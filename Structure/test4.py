import h5py
import numpy as np
from datetime import datetime

def create_template_hdf():
    """
    Creates a template.hdf file matching PERMAS structure exactly
    """
    
    # Create the HDF5 file
    with h5py.File('template.hdf', 'w') as f:
        
        # File Header Dataset - Empty
        file_header_data = [b"" for _ in range(12)]
        
        # Create .File Header dataset
        file_header = f.create_dataset('.File Header', 
                                     data=np.array(file_header_data, dtype='|S80'),
                                     shape=(12,))
        
        # Create DFLT_COMP group (PERMAS standard name)
        component_grp = f.create_group('DFLT_COMP')
        component_grp.attrs['Doftype'] = [b'DISP TEMP MATH']
        
        # Create DFLT_COMP/STEP_1 group (PERMAS standard step naming)
        step_grp = component_grp.create_group('STEP_1')
        
        # Create DFLT_COMP/STEP_1/.Analysis dataset
        analysis_data = [b""]  # Empty for template
        analysis_ds = step_grp.create_dataset('.Analysis',
                                            data=np.array(analysis_data, dtype='|S40'),
                                            shape=(1,))
        
        # Create DFLT_COMP/STEP_1/.Model dataset (PERMAS requirement)
        model_data = [b"" for _ in range(1)]  # Start with 1 element, expandable
        model_ds = step_grp.create_dataset('.Model',
                                         data=np.array(model_data, dtype='|S80'),
                                         shape=(1,),
                                         maxshape=(None,))  # Allow resizing
        
        # Create DFLT_COMP/STEP_1/DISPLACEMENT group
        disp_grp = step_grp.create_group('DISPLACEMENT')
        disp_grp.attrs['Data Object'] = [b'USR.DISP']
        disp_grp.attrs['Text'] = [b'Nodal point displacements']
        
        # Create .ColDes dataset - CRITICAL: Must contain actual column count
        coldes_data = np.array([1], dtype=np.int64)  # Number of load patterns/columns
        coldes_ds = disp_grp.create_dataset('.ColDes',
                                          data=coldes_data,
                                          shape=(1,))
        coldes_ds.attrs['Label'] = [b'LPAT']  # Must be exactly this format
        
        # Create .RowDes dataset - CRITICAL: Must contain actual node IDs
        rowdes_data = np.array([1], dtype=np.int64)  # Node ID(s)
        rowdes_ds = disp_grp.create_dataset('.RowDes',
                                          data=rowdes_data,
                                          shape=(1,),
                                          maxshape=(None,))  # Allow resizing
        
        # Create Column1 dataset - CRITICAL: Shape must match .RowDes and be 3D for displacements
        column1_data = np.array([[0.0, 0.0, 0.0]], dtype=np.float32)  # [dx, dy, dz] for node 1
        column1_ds = disp_grp.create_dataset('Column1',
                                           data=column1_data,
                                           shape=(1, 3),
                                           maxshape=(None, 3))  # Allow resizing
        column1_ds.attrs['LPAT'] = [1]  # Load pattern ID
        column1_ds.attrs['Original Column ID'] = [1]
        
    print("PERMAS-compatible template HDF5 file 'template.hdf' created successfully!")
    print("\nFile structure:")
    print("📁 template.hdf")
    print("  📏 .File Header (Dataset) - shape: (12,), dtype: |S80 [EMPTY]")
    print("  📁 DFLT_COMP (Group) - attr: Doftype = [b'DISP TEMP MATH']")
    print("    📁 STEP_1 (Group)")
    print("      📏 .Analysis (Dataset) - shape: (1,), dtype: |S40 [EMPTY]")
    print("      📏 .Model (Dataset) - shape: (1,), dtype: |S80 [EMPTY, RESIZABLE]")
    print("      📁 DISPLACEMENT (Group)")
    print("        🔖 attr: Data Object = [b'USR.DISP']")
    print("        🔖 attr: Text = [b'Nodal point displacements']")
    print("        📏 .ColDes (Dataset) - shape: (1,), dtype: int64")
    print("          🔖 attr: Label = [b'LPAT']")
    print("        📏 .RowDes (Dataset) - shape: (1,), dtype: int64 [RESIZABLE]")
    print("        📏 Column1 (Dataset) - shape: (1, 3), dtype: float32 [RESIZABLE]")
    print("          🔖 attr: LPAT = [1]")
    print("          🔖 attr: Original Column ID = [1]")
    print("\nNOTES:")
    print("- .RowDes contains node IDs")
    print("- Column1 contains [dx, dy, dz] displacements for each node")
    print("- Both .RowDes and Column1 are resizable for adding more nodes")
    print("- .ColDes value (1) indicates one load pattern/column")

def add_node_data(filename='template.hdf', node_ids=None, displacements=None):
    """
    Add node data to the template file
    
    Parameters:
    - node_ids: list of node IDs (integers)
    - displacements: list of [dx, dy, dz] displacement vectors
    """
    if node_ids is None:
        node_ids = [1, 2, 3]  # Example node IDs
    if displacements is None:
        displacements = [[0.0, 0.0, 0.0], [0.1, 0.0, 0.0], [0.2, 0.0, 0.0]]  # Example displacements
    
    with h5py.File(filename, 'r+') as f:
        # Update .RowDes with node IDs
        rowdes_ds = f['DFLT_COMP/STEP_1/DISPLACEMENT/.RowDes']
        rowdes_ds.resize((len(node_ids),))
        rowdes_ds[:] = node_ids
        
        # Update Column1 with displacement data
        column1_ds = f['DFLT_COMP/STEP_1/DISPLACEMENT/Column1']
        column1_ds.resize((len(displacements), 3))
        column1_ds[:] = displacements
    
    print(f"Added {len(node_ids)} nodes to {filename}")

def inspect_hdf_file(filename='template.hdf'):
    """
    Inspect the created HDF5 file structure
    """
    def print_structure(name, obj):
        indent = "  " * (name.count('/'))
        if isinstance(obj, h5py.Group):
            print(f"{indent}📁 {name} (Group)", end="")
            if obj.attrs:
                attrs_str = " ".join([f"🔖 attr: {k} = {list(v)}" for k, v in obj.attrs.items()])
                print(f" {attrs_str}")
            else:
                print()
        elif isinstance(obj, h5py.Dataset):
            print(f"{indent}📏 {name} (Dataset) - shape: {obj.shape}, dtype: {obj.dtype}", end="")
            if obj.attrs:
                attrs_str = " ".join([f"🔖 attr: {k} = {list(v)}" for k, v in obj.attrs.items()])
                print(f" {attrs_str}")
            else:
                print()
    
    print(f"\nInspecting {filename}:")
    print("=" * 50)
    
    try:
        with h5py.File(filename, 'r') as f:
            f.visititems(print_structure)
            
            # Show actual data in key datasets
            print("\nKey dataset contents:")
            print("=" * 30)
            try:
                coldes = f['DFLT_COMP/STEP_1/DISPLACEMENT/.ColDes'][:]
                print(f".ColDes data: {coldes}")
                
                rowdes = f['DFLT_COMP/STEP_1/DISPLACEMENT/.RowDes'][:]
                print(f".RowDes data: {rowdes}")
                
                column1 = f['DFLT_COMP/STEP_1/DISPLACEMENT/Column1'][:]
                print(f"Column1 data: {column1}")
            except KeyError as e:
                print(f"Could not access dataset: {e}")
                
    except FileNotFoundError:
        print(f"File {filename} not found. Please run create_template_hdf() first.")

if __name__ == "__main__":
    # Create the template file
    create_template_hdf()
    
    # Inspect the created file
    inspect_hdf_file()
    
    # Example of adding more node data
    print("\n" + "="*50)
    print("Example: Adding more nodes...")
    add_node_data(node_ids=[1, 2, 3, 4, 5], 
                  displacements=[[0.0, 0.0, 0.0], 
                               [0.1, 0.05, 0.0], 
                               [0.2, 0.1, 0.0],
                               [0.3, 0.15, 0.0],
                               [0.4, 0.2, 0.0]])
    
    # Inspect again to see the changes
    inspect_hdf_file()