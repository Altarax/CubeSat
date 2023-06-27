import os

def generate_signals(port_names, port_types) -> str:
    signals_code = ""
    for port_name, port_type in zip(port_names, port_types):
        signal_line = f"    signal {port_name}_s: {port_type};\n"
        signals_code += signal_line
    signals_code += "\n"
    return signals_code