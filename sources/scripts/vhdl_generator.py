import os

def generate_signals(port_names, port_types) -> str:
    signals_code = "\n".join([f"    signal {port_name}_s: {port_type};" for port_name, port_type in zip(port_names, port_types)])
    signals_code += "\n\n"
    return signals_code

def generate_constants(generic_names, generic_types) -> str:
    constants_code = "\n".join([f"    constant {generic_name.upper()}_c : {generic_type} := <valeur>;" for generic_name, generic_type in zip(generic_names, generic_types)])
    constants_code += "\n\n"
    return constants_code


def generate_uut(port_names, generic_names=None) -> str:
    uut_code = ""
    
    if generic_names:
        uut_code += "   generic map (\n"
        for generic_name in generic_names:
            uut_code += f"          {generic_name} => {generic_name}_c,\n"
        uut_code = uut_code.rstrip(",\n") + "\n"
        uut_code += "       )\n"
        
    uut_code += "       port map (\n"
    for port_name in port_names:
        signal_name = port_name + "_s"
        uut_code += f"          {port_name} => {signal_name},\n"
    uut_code = uut_code.rstrip(",\n") + "\n"
    uut_code += "       );\n"

    return uut_code

