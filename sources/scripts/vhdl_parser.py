import re

def parse_vhdl_section(content, start_keyword, end_keyword) -> str:
    start_index = None
    end_index = []

    for i, line in enumerate(content):
        if line.strip().startswith(start_keyword):
            start_index = i + 1
        elif line.strip().startswith(end_keyword):
            end_index.append(i)

    if start_index is not None and end_index is not None:
        parsed_content = content[start_index:end_index[0]]
        return parsed_content
    else:
        return None

def extract_port_names_and_types(port_list):
    port_names = []
    port_types = []

    for line in port_list:
        line = line.strip()
        if line and not(line.startswith('--')):
            port_name, port_type = line.split(':')
            port_name = port_name.strip()
            port_type = port_type.split(';')[0].strip()

            unwanted_occurrences = ["in", "out", "inout", "buffer"]
            port_type_parts = [part.strip() for part in port_type.split() if part.strip() not in unwanted_occurrences]
            port_type = ' '.join(port_type_parts)

            port_names.append(port_name)
            port_types.append(port_type)

    return port_names, port_types


def extract_generic_names_and_types(generic_list):
    generic_names = []
    generic_types = []

    for line in generic_list:
        line = line.strip()
        if line and not line.startswith('--') and ':' in line:
            generic_parts = line.split(':')
            generic_name = generic_parts[0].strip()
            generic_type = generic_parts[1].split(';')[0].strip()

            generic_names.append(generic_name)
            generic_types.append(generic_type)

    return generic_names, generic_types