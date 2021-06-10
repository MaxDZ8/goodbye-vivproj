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

Note this is known to be wrong, at least in terms of error description as I have generated non-project peripherals in non-project mode as I am writing this (albeit not quite as I wanted).

# Needs more work
TODO