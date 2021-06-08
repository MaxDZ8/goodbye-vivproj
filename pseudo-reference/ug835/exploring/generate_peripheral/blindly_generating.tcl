# Let's imagine you are carefully building a thing and you call
# generate_peripheral
# because this is the feel you get from for example UG835.
# Would you generate it before adding stuff to it?
# Probably not! Better fasten your seatbelts.
# Hopefully someone will figure out a way to make this work better.


set repositoryDir ../ipRepo/AddSomeBitz
file mkdir $repositoryDir

set outputDir ./
file mkdir $outputDir

# I load up all the sources, they come easily anyway.
read_verilog     rtl/add_some_bitz_v1_0.v
read_verilog -sv 

read_verilog -sv {
    rtl/add_some_bitz_v1_0_S00_AXI.sv
    rtl/mdz_custom_logic.sv
}

# Real stuff. Declare the device, add AXI and generate its output products to send to shared repository.
set periph [ create_peripheral -dir $outputDir {mdz} {prototyping} {add_some_bitz} {0.7} ]
add_peripheral_interface {S00_AXI} -interface_mode {slave} -axi_type {lite} $periph
# Note: this interface is special, get it back later.

# set_property vendor {mdz} $periph            # not needed, create_peripheral 1st parameter
# set_property library {prototyping} $periph    # not needed, create_peripheral 2nd par
# set_property name {add_some_bitz} $periph        # not needed, create_peripheral 3rd
# set_property version {0.7} $periph             # not needed, create_peripheral 4th
set_property display_name {add_some_bitz_ABCD} $periph
set_property description {Help me understand the TCL commands mofo} $periph
set_property vendor_display_name {maxdz8} $periph
set_property company_url {http://www.companyurl.eu} $periph
set_property supported_families { {zynq} {Pre-Production} } $periph

set synth_files [ ipx::add_file_group -type verilog:synthesis xilinx_verilogsynthesis $periph ]
ipx::add_file rtl/add_some_bitz_v1_0.v          $synth_files
ipx::add_file rtl/add_some_bitz_v1_0_S00_AXI.sv $synth_files
ipx::add_file rtl/mdz_custom_logic.sv           $synth_files
set_property MODEL_NAME {add_some_bitz_v1_0} $synth_files
# ^ Which values are good for this? I set it to the top module name.

# Memory map including 1 address block including as many registers as I want.
# I will clone setup from the generated project-mode thing and just define a BASE and HIGH prop.
set memoryMap [ ipx::add_memory_map S00_AXI $periph ]
set addressBlock [ ipx::add_address_block S00_AXI_reg $memoryMap ]
set baseParam [ ipx::add_address_block_parameter OFFSET_BASE_PARAM $addressBlock ]
set highParam [ ipx::add_address_block_parameter OFFSET_HIGH_PARAM $addressBlock ]

set_property VALUE C_S00_AXI_BASEADDR $highParam
set_property VALUE C_S00_AXI_HIGHADDR $highParam
set_property BASE_ADDRESS_RESOLVE_TYPE user $addressBlock
set_property USAGE register $addressBlock
set_property WIDTH 32 $addressBlock

# Bus interfaces, ports and port maps holy sheet!
# Bus interfaces are (intuitively) containers of ports, except not!
# Ports can exist by themselves so it means that we don't put ports into bus interfaces, we put "port maps" instead.
# Port maps are usually found in the "edit interface" context-menu dialog...
# So let's start by generating the various ports as the tool might do...
set pu_merge [ ipx::add_port merge $periph ]
set pu_which [ ipx::add_port which $periph ]
set pu_equal [ ipx::add_port equal $periph ]
set paxi_aclk    [ ipx::add_port s00_axi_aclk    $periph ]
set paxi_aresetn [ ipx::add_port s00_axi_aresetn $periph ]
set paxi_awaddr  [ ipx::add_port s00_axi_awaddr  $periph ]
set paxi_awprot  [ ipx::add_port s00_axi_awprot  $periph ]
set paxi_awvalid [ ipx::add_port s00_axi_awvalid $periph ]
set paxi_awready [ ipx::add_port s00_axi_awready $periph ]
set paxi_wdata   [ ipx::add_port s00_axi_wdata   $periph ]
set paxi_wstrb   [ ipx::add_port s00_axi_wstrb   $periph ]
set paxi_wvalid  [ ipx::add_port s00_axi_wvalid  $periph ]
set paxi_wready  [ ipx::add_port s00_axi_wready  $periph ]
set paxi_bresp   [ ipx::add_port s00_axi_bresp   $periph ]
set paxi_bvalid  [ ipx::add_port s00_axi_bvalid  $periph ]
set paxi_bready  [ ipx::add_port s00_axi_bready  $periph ]
set paxi_araddr  [ ipx::add_port s00_axi_araddr  $periph ]
set paxi_arprot  [ ipx::add_port s00_axi_arprot  $periph ]
set paxi_arvalid [ ipx::add_port s00_axi_arvalid $periph ]
set paxi_arready [ ipx::add_port s00_axi_arready $periph ]
set paxi_rdata   [ ipx::add_port s00_axi_rdata   $periph ]
set paxi_rresp   [ ipx::add_port s00_axi_rresp   $periph ]
set paxi_rvalid  [ ipx::add_port s00_axi_rvalid  $periph ]
set paxi_rready  [ ipx::add_port s00_axi_rready  $periph ]

set_property TYPE_NAME std_logic $pu_merge
set_property TYPE_NAME std_logic $pu_which
set_property TYPE_NAME std_logic $pu_equal
set_property TYPE_NAME wire $paxi_aclk    
set_property TYPE_NAME wire $paxi_aresetn 
set_property TYPE_NAME wire $paxi_awaddr  
set_property TYPE_NAME wire $paxi_awprot  
set_property TYPE_NAME wire $paxi_awvalid 
set_property TYPE_NAME wire $paxi_awready 
set_property TYPE_NAME wire $paxi_wdata   
set_property TYPE_NAME wire $paxi_wstrb   
set_property TYPE_NAME wire $paxi_wvalid  
set_property TYPE_NAME wire $paxi_wready  
set_property TYPE_NAME wire $paxi_bresp   
set_property TYPE_NAME wire $paxi_bvalid  
set_property TYPE_NAME wire $paxi_bready  
set_property TYPE_NAME wire $paxi_araddr  
set_property TYPE_NAME wire $paxi_arprot  
set_property TYPE_NAME wire $paxi_arvalid 
set_property TYPE_NAME wire $paxi_arready 
set_property TYPE_NAME wire $paxi_rdata   
set_property TYPE_NAME wire $paxi_rresp   
set_property TYPE_NAME wire $paxi_rvalid  
set_property TYPE_NAME wire $paxi_rready  


set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $pu_merge
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $pu_which
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $pu_equal
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_aclk    
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_aresetn 
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_awaddr  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_awprot  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_awvalid 
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_awready 
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_wdata   
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_wstrb   
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_wvalid  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_wready  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_bresp   
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_bvalid  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_bready  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_araddr  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_arprot  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_arvalid 
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_arready 
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_rdata   
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_rresp   
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_rvalid  
set_property VIEW_NAME_REFS {xilinx_verilogsynthesis xilinx_verilogbehavioralsimulation} $paxi_rready  

set_property IS_VECTOR 1 $paxi_awaddr
set_property IS_VECTOR 1 $paxi_awprot
set_property IS_VECTOR 1 $paxi_wdata
set_property IS_VECTOR 1 $paxi_wstrb
set_property IS_VECTOR 1 $paxi_bresp
set_property IS_VECTOR 1 $paxi_araddr
set_property IS_VECTOR 1 $paxi_arprot
set_property IS_VECTOR 1 $paxi_rdata
set_property IS_VECTOR 1 $paxi_rresp

set_property SIZE_LEFT  4 $paxi_awaddr
set_property SIZE_LEFT  2 $paxi_awprot
set_property SIZE_LEFT 31 $paxi_wdata
set_property SIZE_LEFT  3 $paxi_wstrb
set_property SIZE_LEFT  1 $paxi_bresp
set_property SIZE_LEFT  4 $paxi_araddr
set_property SIZE_LEFT  2 $paxi_arprot
set_property SIZE_LEFT 31 $paxi_rdata
set_property SIZE_LEFT  1 $paxi_rresp

set_property SIZE_LEFT_RESOLVE_TYPE dependent $paxi_awaddr
set_property SIZE_LEFT_RESOLVE_TYPE dependent $paxi_wdata
set_property SIZE_LEFT_RESOLVE_TYPE dependent $paxi_wstrb
set_property SIZE_LEFT_RESOLVE_TYPE dependent $paxi_araddr
set_property SIZE_LEFT_RESOLVE_TYPE dependent $paxi_rdata

set_property DIRECTION out $pu_equal
set_property DIRECTION out $paxi_awready
set_property DIRECTION out $paxi_wready
set_property DIRECTION out $paxi_bresp
set_property DIRECTION out $paxi_bvalid
set_property DIRECTION out $paxi_arready
set_property DIRECTION out $paxi_rdata
set_property DIRECTION out $paxi_rresp
set_property DIRECTION out $paxi_rvalid

set_property SIZE_LEFT_DEPENDENCY {(spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH')) - 1)} $paxi_awaddr
set_property SIZE_LEFT_DEPENDENCY {(spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH')) - 1)} $paxi_wdata
set_property SIZE_LEFT_DEPENDENCY {((spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH')) / 8) - 1))} $paxi_wstrb
set_property SIZE_LEFT_DEPENDENCY {(spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH')) - 1)} $paxi_araddr
set_property SIZE_LEFT_DEPENDENCY {(spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH')) - 1)} $paxi_rdata

# I need to populate those three - the AXI interface was already created.
set busAxi [ lindex [ipx::get_bus_interfaces -of_objects $periph] 0 ]
set busRst [ ipx::add_bus_interface S00_AXI_RST $periph ]
set busClk [ ipx::add_bus_interface S00_AXI_CLK $periph ]

set_property PHYSICAL_NAME s00_axi_awaddr [ipx::add_port_map AWADDR $busAxi]
set_property PHYSICAL_NAME s00_axi_awprot [ipx::add_port_map AWPROT $busAxi]
set_property PHYSICAL_NAME s00_axi_awvalid [ipx::add_port_map AWVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_awready [ipx::add_port_map AWREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_wdata [ipx::add_port_map WDATA $busAxi]
set_property PHYSICAL_NAME s00_axi_wstrb [ipx::add_port_map WSTRB $busAxi]
set_property PHYSICAL_NAME s00_axi_wvalid [ipx::add_port_map WVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_wready [ipx::add_port_map WREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_bresp [ipx::add_port_map BRESP $busAxi]
set_property PHYSICAL_NAME s00_axi_bvalid [ipx::add_port_map BVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_bready [ipx::add_port_map BREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_araddr [ipx::add_port_map ARADDR $busAxi]
set_property PHYSICAL_NAME s00_axi_arprot [ipx::add_port_map ARPROT $busAxi]
set_property PHYSICAL_NAME s00_axi_arvalid [ipx::add_port_map ARVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_arready [ipx::add_port_map ARREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_rdata [ipx::add_port_map RDATA $busAxi]
set_property PHYSICAL_NAME s00_axi_rresp [ipx::add_port_map RRESP $busAxi]
set_property PHYSICAL_NAME s00_axi_rvalid [ipx::add_port_map RVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_rready [ipx::add_port_map RREADY $busAxi]

# Done with the AXI interface... phew! The rest is simple!
set_property PHYSICAL_NAME s00_axi_aresetn [ipx::add_port_map RST $busRst]

set_property PHYSICAL_NAME s00_axi_aclk [ipx::add_port_map CLK $busClk]

generate_peripheral -driver -force $periph