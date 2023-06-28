import re

def parse_vhdl_section(content, start_keyword, end_keyword) -> str:
    """
    Parses a VHDL section within the content based on the start and end keywords.

    Args:
        content (list): List of lines containing the VHDL content.
        start_keyword (str): Start keyword marking the beginning of the section.
        end_keyword (str): End keyword marking the end of the section.

    Returns:
        str: Parsed content section.

    """
    start_index = None
    end_index = None

    start_found = False
    end_found = False

    for i, line in enumerate(content):
        if not start_found and line.strip().startswith(start_keyword):
            start_index = i + 1
            start_found = True
        elif start_found and line.strip().startswith(end_keyword):
            end_index = i
            end_found = True
            break

    if start_found and end_found:
        parsed_content = content[start_index:end_index]
        return parsed_content
    else:
        return None


def extract_port_names_and_types(port_list):
    """
    Extracts port names and types from a list of port declarations.

    Args:
        port_list (list): List of port declarations.

    Returns:
        tuple: Two lists containing the extracted port names and types, respectively.

    """
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
    """
    Extracts generic names and types from a list of generic declarations.

    Args:
        generic_list (list): List of generic declarations.

    Returns:
        tuple: Two lists containing the extracted generic names and types, respectively.

    """
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
