import os
from datetime import date

COMPONENTS_DRIVERS_FOLDER = "sources/component_drivers"
TESTBENCH_TEMPLATE_FILE = "sources/simulations/template_tb.vhd"

def get_ports_from_entity(file) -> list:
    with open(file, "r") as f:
        entity_str = f.read()
        if "port (" not in entity_str:
            return []
        
        port_str = entity_str.split("port (")[1].split(" );")[0].split("\n")
        ports = []
        for p in port_str:
            p = p.strip().replace(";", "").replace(",", "")
            if len(p) == 0:
                continue
           
            name_type = p.split(":")
            if len(name_type) < 2:
                continue
            
            p_name = name_type[0].strip()
            p_type = name_type[1].strip()
            
            word_to_remove = ["out", "in", "buffer", "inout"]
            for i in word_to_remove:
                p_type = p_type.replace(i, "")
            
            ports.append(f'{p_name} {p_type}')
            
        return ports


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

                index_of_architecture = 0
                with open(tb_file.name, "r") as tb:
                    lines = tb.readlines()
                    for i, line in enumerate(lines):
                        if "architecture" in line:
                            index_of_architecture = i+2
                            tb.close()
                            break
                        
                ports = get_ports_from_entity(vhdl_file)
                for port in ports:
                    lines.insert(index_of_architecture, f"\tsignal {port.split(None, 1)[0]}_s : {port.split(None, 1)[-1]};\n")
                    index_of_architecture = index_of_architecture + 1
                lines.insert(index_of_architecture, "\n")
                
                with open(tb_file.name, "w") as tb:
                    lines = "".join(lines)
                    tb.write(lines)
                    tb.close
                    
                index_of_UUT = 0
                with open(tb_file.name, "r") as tb:
                    lines = tb.readlines()
                    for i, line in enumerate(lines):
                        if "UUT" in line:
                            index_of_UUT = i+1
                            tb.close()
                            break

                lines.insert(index_of_UUT, "\t\tport map (\n")
                index_of_UUT = index_of_UUT+1
                for i, port in enumerate(ports):
                    lines.insert(index_of_UUT, f"\t\t\t{port.split(None, 1)[0]} => {port.split(None, 1)[0]}_s,\n")
                    index_of_UUT = index_of_UUT+1
                    if i == len(ports)-1:
                        lines.insert(index_of_UUT, f"\t\t\t{port.split(None, 1)[0]} => {port.split(None, 1)[0]}_s\n")
                        index_of_UUT = index_of_UUT+1
                lines.insert(index_of_UUT, "\t\t);\n")
                
                with open(tb_file.name, "w") as tb:
                    lines = "".join(lines)
                    tb.write(lines)
                    tb.close


if __name__ == "__main__":
    print("Generating testbench files...")
    generate_tb_files()
    print("Done!")