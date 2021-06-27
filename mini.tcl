set outputDir ./_tmp_packing
file mkdir $outputDir

set sources_verilog {
    rtl/add_some_bitz_v1_0.v
}
set sources_sv {
    rtl/mdz_custom_logic.sv
    rtl/add_some_bitz_v1_0_S00_AXI.sv
}
read_verilog $sources_verilog
# ^ I load the top module only, it's enough for the magic to work.
set_property part {xc7z020clg400-1} [current_project]
set_property top add_some_bitz_v1_0 [current_fileset]

# A thing pretty much required is to create the AXI bus in advance so we can set the parameters required for .c driver generation.
set componentIdentifier {add_some_bitz}
set componentVersion {0.7}
set periph [ create_peripheral -dir $outputDir {mdz} {prototyping} $componentIdentifier $componentVersion ]
set busAxi [ add_peripheral_interface {S00_AXI} -interface_mode {slave} -axi_type {lite} $periph ]
set_property VALUE 32 [ipx::get_bus_parameters WIZ_DATA_WIDTH -of_objects $busAxi]
set_property VALUE  7 [ipx::get_bus_parameters WIZ_NUM_REG    -of_objects $busAxi]

# set_property vendor {mdz} $periph            # not needed, create_peripheral 1st parameter
# set_property library {prototyping} $periph    # not needed, create_peripheral 2nd par
# set_property name $componentIdentifier $periph        # not needed, create_peripheral 3rd
# set_property version $componentVersion $periph             # not needed, create_peripheral 4th
set_property display_name {add_some_bitz_ABCD} $periph
set_property description {Help me understand the TCL commands mofo} $periph
set_property vendor_display_name {maxdz8} $periph
set_property company_url {http://www.companyurl.eu} $periph
set_property supported_families { {zynq} {Pre-Production} } $periph

generate_peripheral -driver -force $periph

write_peripheral $periph
start_gui
