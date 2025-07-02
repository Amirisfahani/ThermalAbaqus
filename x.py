from odbAccess import openOdb
import csv

# Parameters
odb_path = 'Job1_upgraded.odb'
step_name = 'Step-1'
target_temp = 30.0  # 1500 - 30
output_csv = 'nodes_temp_reach.csv'

# Open the odb
odb = openOdb(path=odb_path)
step = odb.steps[step_name]
frames = step.frames

# Access instance (assumes only one)
instance = list(odb.rootAssembly.instances.values())[0]

# Create dictionary to store first time temp falls below threshold
node_temp_times = {node.label: None for node in instance.nodes}

# Loop over frames
for frame in frames:
    time = frame.frameValue
    temp_field = frame.fieldOutputs['NT11']  # Nodal temperature

    for value in temp_field.values:
        node_id = value.nodeLabel
        temp = value.data

        # If this node hasn't reached below target yet and now it has
        if node_temp_times[node_id] is None and temp <= target_temp:
            node_temp_times[node_id] = time

# Write to CSV and sort by node label
sorted_nodes = sorted(node_temp_times.items(), key=lambda x: x[0])

with open(output_csv, 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['NodeLabel', 'TimeReachedBelow1470'])
    for node_id, time in sorted_nodes:
        writer.writerow([node_id, time if time is not None else 'NotReached'])

print(f"Done. Output saved to {output_csv}")
