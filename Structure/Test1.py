import h5py

def print_hdf5_structure(file_path):
    with h5py.File(file_path, 'r') as f:
        def visitor(name, obj):
            print(f"\n📁 {name} ({type(obj).__name__})")
            if isinstance(obj, h5py.Dataset):
                print(f"  📏 shape: {obj.shape}, dtype: {obj.dtype}")
            if hasattr(obj, 'attrs'):
                for key, val in obj.attrs.items():
                    print(f"  🔖 attr: {key} = {val}")
        f.visititems(visitor)

# Example usage:
print_hdf5_structure("Structure/template3.hdf")