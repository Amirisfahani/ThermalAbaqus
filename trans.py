from odbAccess import openOdb
from abaqusConstants import ELEMENT
import csv
# --- Open the ODB file
odb_path = 'Job1_upgraded.odb'
odb = openOdb(odb_path)
step = odb.steps['Step-1']

# --- Output CSV file
output_csv = 'element_temperature_output.csv'

with open(output_csv, 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Time', 'ElementLabel', 'Temperature'])

    # Loop through all frames (time steps)
    for frame in step.frames:
        time = frame.frameValue
        print(f"Processing time = {time:.4f}")

        # Check if 'TEMP' exists in this frame
        if 'TEMP' not in frame.fieldOutputs:
            print(f"TEMP field not found at time {time:.4f}")
            continue

        # Access TEMP field
        temp_field = frame.fieldOutputs['TEMP']

        # Loop through each element value in TEMP field
        for value in temp_field.values:
            if value.position == ELEMENT:
                writer.writerow([time, value.elementLabel, float(value.data)])

odb.close()
print(f"Data written to {output_csv}")
