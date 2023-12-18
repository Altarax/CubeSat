# Generate a lookup table

lookup_table = """
    type altitude_type is array (natural range 0 to 2**20 - 1) of real;
    constant altitude_lookup_table: altitude_type := (

"""

max_value_pressure = 500
for pressure in range(0, max_value_pressure):
    altitude = round(44330 * (1 - pow(pressure/100 / 1013.25 , 0.1903)));
    if pressure == max_value_pressure-1:
        lookup_table+= f"   {pressure} : {altitude}"
    else:
        lookup_table+= f"   {pressure} : {altitude},\n"
    

lookup_table+= "\n);"
print(lookup_table)