import pandas as pd
import json

df = pd.read_excel('./input/sales.xlsx', sheet_name='sales')

df1 = df.iloc[0:44, 0:3]
df2 = df.iloc[0:40, 5:8]

df2 = df2.rename(columns={'name_of_country.1': 'name_of_country', 'year.1': 'year'})
df2['name_of_country'] = df2['name_of_country'].str.upper()

print(df1.to_string())
print(df2.to_string())

df3 = df1.merge(df2, how='outer', on=['name_of_country', 'year'])

# dropping all rows with nan values and resetting the dataframe index
df3 = df3.dropna().reset_index(drop=True)

print(df3.to_string())

for i, row in df3.iterrows():
    filename = f"output/row_{i}.json"
    with open(filename, 'w') as f:
        json.dump(row.to_dict(), f)
