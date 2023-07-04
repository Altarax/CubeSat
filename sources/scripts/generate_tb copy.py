import os
from vhdl_parser import parse_vhdl_section, extract_port_names_and_types, extract_generic_names_and_types
from vhdl_generator import generate_signals, generate_constants, generate_uut

COMPONENTS_DRIVERS_FOLDER = "sources/component_drivers"
TESTBENCH_TEMPLATE_FILE = "sources/simulations/template_tb.vhd"

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

                with open(tb_file, "w") as tb:
                    tb.write(tb_template)

            try:
                vhdl_content = open(vhdl_file, "r").readlines()
                vhdl_ports_parsed = parse_vhdl_section(vhdl_content, "port", ");")
                port_names, port_types = extract_port_names_and_types(vhdl_ports_parsed)
                signals_code = generate_signals(port_names, port_types)
                constants_code = ""
                generic_names = None

                vhdl_generic_parsed = parse_vhdl_section(vhdl_content, "generic", ");")
                if vhdl_generic_parsed is not None:
                    generic_names, generic_types = extract_generic_names_and_types(vhdl_generic_parsed)
                    constants_code = generate_constants(generic_names, generic_types)
                print("Parsing entity from file: " + vhdl_file + " ... OK")

                with open(tb_file, "r") as tb:
                    arch_content = tb.read()

                architecture_begin_index = arch_content.index("architecture")
                architecture_end_index = arch_content.index("begin", architecture_begin_index)
                arch_content = arch_content[:architecture_end_index] + constants_code + signals_code \
                               + arch_content[architecture_end_index:]

                uut_index = arch_content.index("UUT")
                reset_gen_index = arch_content.index("reset_gen", uut_index) - 5
                arch_content = arch_content[:reset_gen_index] + "\t" + generate_uut(port_names, generic_names) \
                               + "\t" + arch_content[reset_gen_index:]

                print("Writing testbench file: " + tb_file + " ... OK\n")
                with open(tb_file, "w") as tb:
                    tb.write(arch_content)
                    tb.close()

            except Exception as e:
                print("Error parsing entity from file: " + vhdl_file)
                print(str(e))


if __name__ == "__main__":
    print("Generating testbench files...")
    print("====================================\n")
    generate_tb_files()
    print("====================================")
    print("Done!")
