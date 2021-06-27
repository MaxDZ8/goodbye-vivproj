set top_module {add_some_bitz_v1_0}
set temporaryPrefix {./_tmp_packing}
set componentIdentifier {add_some_bitz}
set componentVersion {0.7}
set outputDir "${temporaryPrefix}_${componentIdentifier}_${componentVersion}"
file mkdir $outputDir
set sources_verilog {
    rtl/add_some_bitz_v1_0.v
}
set sources_sv {
    rtl/mdz_custom_logic.sv
    rtl/add_some_bitz_v1_0_S00_AXI.sv
}

set sourceTarget "$outputDir/hdl"
file copy rtl $outputDir
file rename "$outputDir/rtl" $sourceTarget

proc moved { files from to } {
    set magic {}
    foreach source $files { lappend magic [ regsub "^$from" $source $to ] }
    return $magic;
}
set sources_verilog [moved $sources_verilog rtl $sourceTarget]
set sources_sv [moved $sources_sv rtl $sourceTarget]

read_verilog $sources_verilog
read_verilog -sv $sources_sv
set_property part {xc7z020clg400-1} [current_project]
set_property top add_some_bitz_v1_0 [current_fileset]

# A thing pretty much required is to create the AXI bus in advance so we can set the parameters required for .c driver generation.
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

#                                            d8888 Y88b   d88P 8888888
#                                           d88888  Y88b d88P    888
#                                          d88P888   Y88o88P     888
#                                         d88P 888    Y888P      888
#                                        d88P  888    d888b      888
#                                       d88P   888   d88888b     888
#                                      d8888888888  d88P Y88b    888
#                                     d88P     888 d88P   Y88b 8888888

# If you run ipx::get_ports -of_objects $periph here, it gives you NIL so one wonders Q: what add_peripheral_interface really does?
# A: it just adds a bus_interface object to the component. It seems there's nothing inside.
# So I just populate it. I took this from a GUI-generated component and it'll mostly go by copypasta.
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
set_property SIZE_LEFT_DEPENDENCY {((spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH')) / 8) - 1)} $paxi_wstrb
set_property SIZE_LEFT_DEPENDENCY {(spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH')) - 1)} $paxi_araddr
set_property SIZE_LEFT_DEPENDENCY {(spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH')) - 1)} $paxi_rdata

set_property PHYSICAL_NAME s00_axi_awaddr  [ipx::add_port_map AWADDR $busAxi]
set_property PHYSICAL_NAME s00_axi_awprot  [ipx::add_port_map AWPROT $busAxi]
set_property PHYSICAL_NAME s00_axi_awvalid [ipx::add_port_map AWVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_awready [ipx::add_port_map AWREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_wdata   [ipx::add_port_map WDATA $busAxi]
set_property PHYSICAL_NAME s00_axi_wstrb   [ipx::add_port_map WSTRB $busAxi]
set_property PHYSICAL_NAME s00_axi_wvalid  [ipx::add_port_map WVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_wready  [ipx::add_port_map WREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_bresp   [ipx::add_port_map BRESP $busAxi]
set_property PHYSICAL_NAME s00_axi_bvalid  [ipx::add_port_map BVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_bready  [ipx::add_port_map BREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_araddr  [ipx::add_port_map ARADDR $busAxi]
set_property PHYSICAL_NAME s00_axi_arprot  [ipx::add_port_map ARPROT $busAxi]
set_property PHYSICAL_NAME s00_axi_arvalid [ipx::add_port_map ARVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_arready [ipx::add_port_map ARREADY $busAxi]
set_property PHYSICAL_NAME s00_axi_rdata   [ipx::add_port_map RDATA $busAxi]
set_property PHYSICAL_NAME s00_axi_rresp   [ipx::add_port_map RRESP $busAxi]
set_property PHYSICAL_NAME s00_axi_rvalid  [ipx::add_port_map RVALID $busAxi]
set_property PHYSICAL_NAME s00_axi_rready  [ipx::add_port_map RREADY $busAxi]

# Parse the files and create the ipgui structures behind the scenes. We are not allowed to know about this pixie dust.
ipx::merge_project_changes hdl_parameters $periph

# In this moment, there are only two groups: file_group component_1 xilinx_anylanguagesynthesis file_group component_1 xilinx_anylanguagebehavioralsimulation
# Declare their top model and then move them to "Advanced". This second thing does not really exist.
# Turning them into something similar to GUI generated is quite some work.
foreach fgrp [ipx::get_file_groups -of_objects $periph] { set_property MODEL_NAME $top_module $fgrp}
set synth_files [lindex [ipx::get_file_groups -of_objects $periph] 0]
set simul_files [lindex [ipx::get_file_groups -of_objects $periph] 1]

set_property DISPLAY_NAME {Verilog Synthesis}                       $synth_files
set_property ENV_IDS      verilogSource:vivado.xilinx.com:synthesis $synth_files
set_property LANGUAGE     verilog                                   $synth_files
set_property NAME         xilinx_verilogsynthesis                   $synth_files
set_property TYPE         verilog:synthesis                         $synth_files

set_property DISPLAY_NAME {Verilog Simulation}                       $simul_files
set_property ENV_IDS      verilogSource:vivado.xilinx.com:simulation $simul_files
set_property LANGUAGE     verilog                                    $simul_files
set_property NAME         xilinx_verilogbehavioralsimulation         $simul_files
set_property TYPE         verilog:simulation                         $simul_files




