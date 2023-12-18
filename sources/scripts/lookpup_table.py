# Generate a lookup table

altitude_lookup_table = """
    type altitude_type is array (natural range 0 to 499) of integer;
    constant altitude_lookup_table: altitude_type := (

"""

max_value_pressure = 500
for pressure in range(0, max_value_pressure):
    altitude = round(44330 * (1 - pow(pressure/100 / 1013.25 , 0.1903)));
    if pressure == max_value_pressure-1:
        altitude_lookup_table+= f"   {altitude}"
    else:
        altitude_lookup_table+= f"   {altitude},\n"
    

altitude_lookup_table+= "\n);"
print(altitude_lookup_table)
