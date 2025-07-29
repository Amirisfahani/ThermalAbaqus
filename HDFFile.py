import h5py
import pandas as pd

# Step 1: Load the normalized values from CSV
csv_data = pd.read_csv("normalized_output.csv")
normalized_values = csv_data["NormalizedTime"].to_numpy()

# Step 2: Open the HDF5 file and replace the dataset inside the group
with h5py.File("Test4 copy 3.hdf", "r+") as f:
    target_group = f["DFLT_COMP/STEP_1/NODAL POINT STRESS MISES"]

    # Identify dataset to replace (not .ColDes or .RowDes)
    for name in list(target_group.keys()):
        if name not in [".ColDes", ".RowDes"]:
            # Delete the old numerical dataset
            del target_group[name]
            # Create new dataset with the same name and new values
            target_group.create_dataset(name, data=normalized_values)
            print(f"Replaced data in dataset '{name}'")

print("✅ Values updated successfully without renaming anything.")
