import h5py
import numpy as np

# === File paths ===
src_file = "E:/ThermalAnalysis/Structure/test2.hdf"  # Change path if needed
dst_file = "E:/ThermalAnalysis/Structure/template_test2.hdf"

# === Main process ===
with h5py.File(src_file, "r") as src, h5py.File(dst_file, "w") as dst:

    # -----------------------------
    # Copy .File Header as-is
    # -----------------------------
    if ".File Header" in src:
        dst.create_dataset(".File Header", data=src[".File Header"][...])

    # -----------------------------
    # Create /MOUNTING and its attributes
    # -----------------------------
    grp_mount = dst.create_group("MOUNTING")
    for key, val in src["MOUNTING"].attrs.items():
        grp_mount.attrs[key] = val

    # -----------------------------
    # Create /MOUNTING/TOPO and its attributes
    # -----------------------------
    grp_topo = grp_mount.create_group("TOPO")
    for key, val in src["MOUNTING/TOPO"].attrs.items():
        grp_topo.attrs[key] = val

    # -----------------------------
    # Copy .Analysis dataset
    # -----------------------------
    if ".Analysis" in src["MOUNTING/TOPO"]:
        analysis_data = src["MOUNTING/TOPO/.Analysis"][...]
        grp_topo.create_dataset(".Analysis", data=analysis_data)

    # -----------------------------
    # Copy EFRATIO structure with dummy data
    # -----------------------------
    if "EFRATIO" in src["MOUNTING/TOPO"]:
        src_eft = src["MOUNTING/TOPO/EFRATIO"]
        grp_eft = grp_topo.create_group("EFRATIO")

        for key, val in src_eft.attrs.items():
            grp_eft.attrs[key] = val

        # .RowDes
        if ".RowDes" in src_eft:
            rowdes_data = src_eft[".RowDes"][()]
            if rowdes_data.shape[0] == 0:
                rowdes_data = np.arange(6000, dtype='int64')  # fallback
            grp_eft.create_dataset(".RowDes", data=rowdes_data)

        # Column1
        if "Column1" in src_eft:
            col_data = src_eft["Column1"]
            dummy_col = np.full_like(col_data[...], fill_value=-1.0)
            dset_col = grp_eft.create_dataset("Column1", data=dummy_col)
            for key, val in col_data.attrs.items():
                dset_col.attrs[key] = val

    # -----------------------------
    # Keep ONLY one XYDATA group (CHIS)
    # -----------------------------
    chis_path = "MOUNTING/TOPO/XYDATA TYPE = CHIS"
    if chis_path in src:
        grp_chis = grp_topo.create_group("XYDATA TYPE = CHIS")

        for dset_name in src[chis_path]:
            src_dset = src[f"{chis_path}/{dset_name}"]
            dummy_data = np.full_like(src_dset[...], fill_value=-1.0)
            dst_dset = grp_chis.create_dataset(dset_name, data=dummy_data)
            for attr_key, attr_val in src_dset.attrs.items():
                dst_dset.attrs[attr_key] = attr_val

        for key, val in src[chis_path].attrs.items():
            grp_chis.attrs[key] = val

print(f"✅ Template written successfully to:\n{dst_file}")
