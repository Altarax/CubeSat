import os, re
from datetime import date
import sys
from vhdl_parser import *
from vhdl_generator import *

COMPONENTS_DRIVERS_FOLDER = "sources/component_drivers"
TESTBENCH_TEMPLATE_FILE = "sources/simulations/template_tb.vhd"

START_KEYWORD_PORT = "entity"

def generate_tb_files() -> None:
    for filename in os.listdir(COMPONENTS_DRIVERS_FOLDER):
        if filename.endswith(".vhd"):

            vhdl_file = os.path.join(COMPONENTS_DRIVERS_FOLDER, filename)
            tb_filename = filename.replace(".vhd", "_tb.vhd")
            tb_file = os.path.join("sources", "simulations", tb_filename)

            with open(TESTBENCH_TEMPLATE_FILE, "r") as f:
                
                tb_template = f.read()
                tb_template = tb_template.replace("template_tb", filename.replace(".vhd", "_tb"))
                tb_template = tb_template.replace("entity_to_test", filename.replace(".vhd", ""))
                
                if os.path.exists(tb_file):
                    os.remove(tb_file)
                tb_file = open(tb_file, "x")
                tb_file.write(tb_template)
                tb_file.close()
                    
                # Parsing entity 
                try:
                    vhdl_content            = open(vhdl_file, "r").readlines()
                    vhdl_ports_parsed       = parse_vhdl_section(vhdl_content, "port", ");")
                    port_names, port_types  = extract_port_names_and_types(vhdl_ports_parsed)
                    signals_code            = generate_signals(port_names, port_types)
                    
                    vhdl_generic_parsed = parse_vhdl_section(vhdl_content, "generic", ");")
                    if vhdl_generic_parsed is not None:
                        generic_names, generic_types = extract_generic_names_and_types(vhdl_generic_parsed)
                    print("Parsing entity from file: " + vhdl_file + " ... OK")
                except:
                    print("Error parsing entity from file: " + vhdl_file)

                # Writing template file
                tb_content = ""
                with open(tb_file.name, "r") as tb:
                    tb_content = tb.read()
                    tb.close()
                    
                architecture_begin_index = tb_content.index("architecture")
                architecture_end_index = tb_content.index("begin", architecture_begin_index)

                tb_content = tb_content[:architecture_end_index] + signals_code + tb_content[architecture_end_index:]

                with open(tb_file.name, "w") as tb:
                    tb.write(tb_content)
                    tb.close()


if __name__ == "__main__":
    print("Generating testbench files...")
    print("====================================\n")
    generate_tb_files()
    print("\n====================================")
    print("Done!")