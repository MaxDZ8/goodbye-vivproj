# Example peripheral data

UG835 contains the following code to demonstrate `generate_peripheral`:
```
set perifObj [ create_peripheral {myCompany.com} {user} {testAXI1} \
{1.3} -dir {C:/Data/new_periph} ]
add_peripheral_interface {S0_AXI} -interface_mode {slave} \
-axi_type {lite} $perifObj
add_peripheral_interface {S1_AXI} -interface_mode {slave} \
-axi_type {lite} $perifObj
generate_peripheral -driver -bfm_example_design \
-enable_interrupt $perifObj
write_peripheral $perifObj
set_property ip_repo_paths C:/Data/new_periph [current_fileset]
update_ip_catalog -rebuild
```

This example means little to nothing as the output would be:
```
Vivado% set perifObj [ create_peripheral {myCompany.com} {user} {testAXI1} {1.3} -dir {C:/Data/new_periph} ]
ERROR: [Common 17-53] User Exception: No open project. Please create or open a project before executing this command.
```

Lovely.

Note this is known to be wrong, at least in terms of error description as I have generated peripherals in non-project mode as I am writing this (albeit not quite as I wanted).
It seems you need to load at least a file. Let's execute a more minimal example:

```
read_verilog -sv mdz_custom_logic.sv
set periph [ create_peripheral {myCompany.com} {user} {testAXI1} {1.3} ]
add_peripheral_interface {S00_AXI} -interface_mode {slave} -axi_type {lite} $periph
generate_peripheral $periph
```

This would generate in the current directory a subtree such as
```
[.srcs](./minimal-generation)
|_ sources_1
   |_ ip
      |_ testAXI1_1.3
         |_ bd
         |  |_ bd.tcl
         |_ hdl
         |  |_ testAXI1_v1_3.v
         |  |_ testAXI1_v1_3_S00_AXI.v
         |_ xgui
            |_ testAXI1_v1_3.tcl
```

Then, by the means of [this script](./explore-minimal-generation.tcl), the following values are obtained.
