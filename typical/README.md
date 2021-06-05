We want to build a packaged AXI device, but what is it?
This is how we would produce a package by "conventional" means.
UG1119 (Creating and Packaging Custom IP) proposes a few ways so - at the cost of being possibly redundant - let me present the procedure and what I want to build.

# Main project: creation
If you are like me (coming from project mode, because you have been instructed it's the simplest and most appropriate flow for basic work)
then you usually create the AXI device from vivado Tools > Create and package new IP.

This will span a wizard helping you inserting the various info. Some decisions here are inconvenient, such as embedding the *initial* version in device name but let's just get away with most default settings. We'll be creating a thing called `add_some_bitz` with 7 internal registers.

This just generates the following TCL commands:

```
create_peripheral xilinx.com user add_some_bitz 1.0 -dir C:/vivadoProjects/hack_da_ip_packagar/main_project/../ip_repo
add_peripheral_interface S00_AXI -interface_mode slave -axi_type lite [ipx::find_open_core xilinx.com:user:add_some_bitz:1.0]
set_property VALUE 7 [ipx::get_bus_parameters WIZ_NUM_REG -of_objects [ipx::get_bus_interfaces S00_AXI -of_objects [ipx::find_open_core xilinx.com:user:add_some_bitz:1.0]]]
generate_peripheral -driver -bfm_example_design -debug_hw_example_design [ipx::find_open_core xilinx.com:user:add_some_bitz:1.0]
write_peripheral [ipx::find_open_core xilinx.com:user:add_some_bitz:1.0]
set_property  ip_repo_paths  C:/vivadoProjects/hack_da_ip_packagar/main_project/../ip_repo/add_some_bitz_1.0 [current_project]
update_ip_catalog -rebuild
```

We will find those useful later.

# Main project: adding and editing

At this point, we would open block design. I usually add the Zynq first, which will lay out the clock and reset networks but I doubt this is relevant for our discussion.

I then add my device by clicking again on the `+` button and searching for it in the dialog. This produces the following command:

```
startgroup
create_bd_cell -type ip -vlnv xilinx.com:user:add_some_bitz:1.0 add_some_bitz_0
endgroup
```

Vivado then asks me if I want to apply automation to connect the clock, resets and axi interface. Again, I doubt it's much relevant for us but in case, the command is

```
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/add_some_bitz_0/S00_AXI} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins add_some_bitz_0/S00_AXI]
```

The device pops in the graphics representation. I move it around a bit resulting in those commands

```
set_property location {3 847 27} [get_bd_cells add_some_bitz_0]
set_property location {3 1162 19} [get_bd_cells add_some_bitz_0]
```

Purely cosmetic. More interesting: `regenerate_bd_layout`.

# Getting to the real deal

At this point I usually right-click on the device block and click `Edit in IP Packager`. This opens a dialog asking you to create a project with a name and a path, usually relative to the current 'main' project but back one folder.

This is supposed to be a temporary project but I found it stays around easily, I'm not sure why and that's just one of the anomalies I deal with in Vivado. **This *device project* is what I am truly interested in**.

The created project is special - in the Flow Navigator it would have a special "Edit Packaged IP" button. This button is another source of grief for me. The device project indeed opens with the "Package IP" tab ready to go. What I document in those documents is the way we can replace this tab with TCL commands.

Some TCL commands I have observed in this case:

```
ipx::edit_ip_in_project -upgrade true -name add_some_bitz_v1_0_project -directory C:/vivadoProjects/hack_da_ip_packagar/main_project/main_project.tmp/add_some_bitz_v1_0_project c:/vivadoProjects/hack_da_ip_packagar/ip_repo/add_some_bitz_1.0/component.xml
```

...

```
update_compile_order -fileset sources_1
```

Now the other vivado window is open, let's examine the [IP Packager](./ip-packager-panels.md)