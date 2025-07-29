import h5py
import numpy as np

with h5py.File("permas_template.hdf", "w") as f:  # <-- use .hdf instead of .h5

    # -------------------------------
    # .File Header Dataset
    # -------------------------------
    file_header_lines = [
        "--------------------------------------------------------------------------------",
        "Result file written by PERMAS Education Edition Version 20.00.333",
        "Distributed by INTES Stuttgart",
        "Date: 2-Jul-25 21:04:31",
        "................................................................................",
        "P r o j e c t          Test4",
        "................................................................................",
        "Site: amirhossein.isfahani rwth-aachen.de",
        "Host: AMIR / Windows 10 Pro-AMD64-19045",
        "Code: M9v20 (32 bpw)",
        "",
        "--------------------------------------------------------------------------------"
    ]
    f.create_dataset(".File Header", data=np.array(file_header_lines, dtype='S80'))

    # -------------------------------
    # /DFLT_COMP group and attribute
    # -------------------------------
    grp_comp = f.create_group("DFLT_COMP")
    grp_comp.attrs["Doftype"] = np.array(["DISP TEMP MATH"], dtype='S80')

    # -------------------------------
    # /DFLT_COMP/STEP_1 group
    # -------------------------------
    grp_step = grp_comp.create_group("STEP_1")
    grp_step.create_dataset(".Analysis", data=np.array(["STATIC ANALYSIS"], dtype='S40'))
    grp_step.create_dataset(".Model", data=np.array(["MODEL-NODE-PLACEHOLDER"] * 12287, dtype='S80'))

    # -------------------------------
    # DISPLACEMENT group structure
    # -------------------------------
    grp_disp = grp_step.create_group("DISPLACEMENT")
    grp_disp.attrs["Data Object"] = [b'USR.DISP']
    grp_disp.attrs["Text"] = [b'Nodal point displacements']
    grp_disp.create_dataset(".ColDes", data=np.array([1], dtype='int64')).attrs["Label"] = [b'LPAT']
    grp_disp.create_dataset(".RowDes", data=np.arange(1, 4926, dtype='int64'))
    grp_disp.create_dataset("Column1", data=np.zeros((4925, 3), dtype='float32'))
    grp_disp["Column1"].attrs["LPAT"] = [1]
    grp_disp["Column1"].attrs["Original Column ID"] = [1]
