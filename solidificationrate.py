import pandas as pd

# Load the CSV file
df = pd.read_csv('nodes_temp_reach.csv')  # Replace with your actual filename

# Divide the second column by 1470 and create a new column
df['NormalizedTime'] = 1470 / df['TimeReached30from1500'] * 10

# Optionally save to a new CSV file
df.to_csv('normalized_output.csv', index=False)