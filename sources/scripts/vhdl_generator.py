import os

def generate_signals(port_names, port_types) -> str:
    """
    Generates signal declarations for the given port names and types.

    Args:
        port_names (list): List of port names.
        port_types (list): List of port types.

    Returns:
        str: Generated signal declarations.
    """
    signals_code = "\n".join([f"    signal {port_name}_s: {port_type};" for port_name, port_type in zip(port_names, port_types)])
    signals_code += "\n\n"
    return signals_code


def generate_constants(generic_names, generic_types) -> str:
    """
    Generates constant declarations for the given generic names and types.

    Args:
        generic_names (list): List of generic names.
        generic_types (list): List of generic types.

    Returns:
        str: Generated constant declarations.
    """
    constants_code = "\n".join([f"    constant {generic_name.upper()}_c : {generic_type} := <value>;" for generic_name, generic_type in zip(generic_names, generic_types)])
    constants_code += "\n\n"
    return constants_code


def generate_uut(port_names, generic_names=None) -> str:
    """
    Generates the instantiation code for the UUT (Unit Under Test) with optional generics.

    Args:
        port_names (list): List of port names.
        generic_names (list, optional): List of generic names. Defaults to None.

    Returns:
        str: Generated UUT instantiation code.
    """
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
