# A "minimal" example about generate_peripheral - what data does it generate?
# Secondary goal: document the various properties by being a bit verbose.
# This way, we get the fields and their values so we at least know what to modify!

read_verilog -sv mdz_custom_logic.sv
set periph [ create_peripheral {myCompany.com} {user} {testAXI1} {1.3} ]
proc get_peripheral_props { thing } {
    puts "| ADD_DONT_TOUCH                     | [get_property ADD_DONT_TOUCH                     $thing]"
    puts "| ADVERTISEMENT_IP                   | [get_property ADVERTISEMENT_IP                   $thing]"
    puts "| ADVERTISEMENT_URL                  | [get_property ADVERTISEMENT_URL                  $thing]"
    puts "| AUTO_DEVICE_PROPERTIES_FILTER      | [get_property AUTO_DEVICE_PROPERTIES_FILTER      $thing]"
    puts "| AUTO_FAMILY_SUPPORT_LEVEL          | [get_property AUTO_FAMILY_SUPPORT_LEVEL          $thing]"
    puts "| BLOCK_IP                           | [get_property BLOCK_IP                           $thing]"
    puts "| CHECKSUMS                          | [get_property CHECKSUMS                          $thing]"
    puts "| CLASS                              | [get_property CLASS                              $thing]"
    puts "| COMPANY_URL                        | [get_property COMPANY_URL                        $thing]"
    puts "| CORE_REVISION                      | [get_property CORE_REVISION                      $thing]"
    puts "| CREATION_DATE_TIME                 | [get_property CREATION_DATE_TIME                 $thing]"
    puts "| DEBUG_CORE_INFO                    | [get_property DEBUG_CORE_INFO                    $thing]"
    puts "| DEFAULT_USER_PARAMETER_ADDED       | [get_property DEFAULT_USER_PARAMETER_ADDED       $thing]"
    puts "| DEFINITION_SOURCE                  | [get_property DEFINITION_SOURCE                  $thing]"
    puts "| DESCRIPTION                        | [get_property DESCRIPTION                        $thing]"
    puts "| DESIGN_TOOL_CONTEXTS               | [get_property DESIGN_TOOL_CONTEXTS               $thing]"
    puts "| DEVICE_INDEPENDENT_SYNTH           | [get_property DEVICE_INDEPENDENT_SYNTH           $thing]"
    puts "| DIRTY                              | [get_property DIRTY                              $thing]"
    puts "| DISPLAY_NAME                       | [get_property DISPLAY_NAME                       $thing]"
    puts "| EXAMPLE_DESIGN_NO_IP_IMPORT        | [get_property EXAMPLE_DESIGN_NO_IP_IMPORT        $thing]"
    puts "| EXPECTED_FILEGROUPS                | [get_property EXPECTED_FILEGROUPS                $thing]"
    puts "| HIDE_IN_GUI                        | [get_property HIDE_IN_GUI                        $thing]"
    puts "| INTEGRITY_REPORT_FILE_NAME         | [get_property INTEGRITY_REPORT_FILE_NAME         $thing]"
    puts "| LIBRARY                            | [get_property LIBRARY                            $thing]"
    puts "| NAME                               | [get_property NAME                               $thing]"
    puts "| PAYMENT_REQUIRED                   | [get_property PAYMENT_REQUIRED                   $thing]"
    puts "| PREVIOUS_VERSION_FOR_UPGRADE       | [get_property PREVIOUS_VERSION_FOR_UPGRADE       $thing]"
    puts "| REQUIRES_VIP                       | [get_property REQUIRES_VIP                       $thing]"
    puts "| RETAIN_COMPONENT_INTEGER_PORT_TYPE | [get_property RETAIN_COMPONENT_INTEGER_PORT_TYPE $thing]"
    puts "| ROOT_DIRECTORY                     | [get_property ROOT_DIRECTORY                     $thing]"
    puts "| SDX_KERNEL                         | [get_property SDX_KERNEL                         $thing]"
    puts "| SDX_KERNEL_TYPE                    | [get_property SDX_KERNEL_TYPE                    $thing]"
    puts "| SECURITY_CHECKED                   | [get_property SECURITY_CHECKED                   $thing]"
    puts "| SUMMARY_REPORT_FILE_NAME           | [get_property SUMMARY_REPORT_FILE_NAME           $thing]"
    puts "| SUPPORTED_FAMILIES                 | [get_property SUPPORTED_FAMILIES                 $thing]"
    puts "| SUPPORTS_AUTO_SLRS                 | [get_property SUPPORTS_AUTO_SLRS                 $thing]"
    puts "| SUPPORTS_AUTO_XDC                  | [get_property SUPPORTS_AUTO_XDC                  $thing]"
    puts "| SUPPORTS_DEFERRED_ELABORATION      | [get_property SUPPORTS_DEFERRED_ELABORATION      $thing]"
    puts "| SUPPORTS_DYNAMIC_BITSTRINGS        | [get_property SUPPORTS_DYNAMIC_BITSTRINGS        $thing]"
    puts "| SUPPORTS_IP_CACHE                  | [get_property SUPPORTS_IP_CACHE                  $thing]"
    puts "| SUPPORTS_OOC                       | [get_property SUPPORTS_OOC                       $thing]"
    puts "| SUPPORTS_VIVADO                    | [get_property SUPPORTS_VIVADO                    $thing]"
    puts "| SYSTEMC_LIBRARIES                  | [get_property SYSTEMC_LIBRARIES                  $thing]"
    puts "| TAGS                               | [get_property TAGS                               $thing]"
    puts "| TAXONOMY                           | [get_property TAXONOMY                           $thing]"
    puts "| UNSUPPORTED_SIMULATORS             | [get_property UNSUPPORTED_SIMULATORS             $thing]"
    puts "| USE_VIVADO_HLS                     | [get_property USE_VIVADO_HLS                     $thing]"
    puts "| VENDOR                             | [get_property VENDOR                             $thing]"
    puts "| VENDOR_DISPLAY_NAME                | [get_property VENDOR_DISPLAY_NAME                $thing]"
    puts "| VERSION                            | [get_property VERSION                            $thing]"
    puts "| VLNV                               | [get_property VLNV                               $thing]"
    puts "| XILINX_VERSION                     | [get_property XILINX_VERSION                     $thing]"
    puts "| XILINX_VERSION_COMPATIBILITY       | [get_property XILINX_VERSION_COMPATIBILITY       $thing]"
    puts "| XML_FILE_NAME                      | [get_property XML_FILE_NAME                      $thing]"
    puts "| XPM_LIBRARIES                      | [get_property XPM_LIBRARIES                      $thing]"
}

get_peripheral_props $periph
add_peripheral_interface {S00_AXI} -interface_mode {slave} -axi_type {lite} $periph
get_peripheral_props $periph
generate_peripheral $periph
get_peripheral_props $periph

# 3    8888888888 d8b 888                                                                   
#      888        Y8P 888                                                                   
#      888            888                                                                   
#      8888888    888 888  .d88b.        .d88b.  888d888 .d88b.  888  888 88888b.  .d8888b  
#      888        888 888 d8P  Y8b      d88P"88b 888P"  d88""88b 888  888 888 "88b 88K      
#      888        888 888 88888888      888  888 888    888  888 888  888 888  888 "Y8888b. 
#      888        888 888 Y8b.          Y88b 888 888    Y88..88P Y88b 888 888 d88P      X88 
#      888        888 888  "Y8888        "Y88888 888     "Y88P"   "Y88888 88888P"   88888P' 
#                                            888                          888               
#                                       Y8b d88P                          888               
#                                        "Y88P"                           888               

ipx::get_file_groups -of_objects $periph
# --> file_group component_1 xilinx_verilogsynthesis file_group component_1 xilinx_verilogbehavioralsimulation file_group component_1 xilinx_xpgui file_group component_1 bd_tcl
proc get_file_group_props { thing } {
    puts "| CLASS              | [get_property CLASS              $thing] |"
    puts "| COMPONENT_SUBCORES | [get_property COMPONENT_SUBCORES $thing] |"
    puts "| DEPENDENCY         | [get_property DEPENDENCY         $thing] |"
    puts "| DESCRIPTION        | [get_property DESCRIPTION        $thing] |"
    puts "| DISPLAY_NAME       | [get_property DISPLAY_NAME       $thing] |"
    puts "| ENV_IDS            | [get_property ENV_IDS            $thing] |"
    puts "| LANGUAGE           | [get_property LANGUAGE           $thing] |"
    puts "| MODEL_NAME         | [get_property MODEL_NAME         $thing] |"
    puts "| NAME               | [get_property NAME               $thing] |"
    puts "| TYPE               | [get_property TYPE               $thing] |"
}
get_file_group_props [lindex [ ipx::get_file_groups -of_objects $periph ] 0]
get_file_group_props [lindex [ ipx::get_file_groups -of_objects $periph ] 1]
get_file_group_props [lindex [ ipx::get_file_groups -of_objects $periph ] 2]
get_file_group_props [lindex [ ipx::get_file_groups -of_objects $periph ] 3]

# File group parameters are all empty.
ipx::get_file_group_parameters -of_objects [lindex [ ipx::get_file_groups -of_objects $periph ] 0]
ipx::get_file_group_parameters -of_objects [lindex [ ipx::get_file_groups -of_objects $periph ] 1]
ipx::get_file_group_parameters -of_objects [lindex [ ipx::get_file_groups -of_objects $periph ] 2]
ipx::get_file_group_parameters -of_objects [lindex [ ipx::get_file_groups -of_objects $periph ] 3]

# Syntactic sugar?
# ipx::get_file_groups_for_envid                | Get all file_groups that match the specified env_ids.             |
# ^ Why does that exist? Can't you just ipx::get_file_groups -filter ?
# Consider:
#    Vivado% ipx::get_file_groups_for_envid :vivado.xilinx.com:block.diagram $periph
#    file_group component_1 bd_tcl
#    Vivado% ipx::get_file_groups -of_objects $periph -filter {ENV_IDS == :vivado.xilinx.com:block.diagram}
#    file_group component_1 bd_tcl
# I guess filtering can get really unconvenient when it comes to multiple values but w/e.


# ipx::get_parameter_abstractions, help reads "Get all parameter abstractions from a parameter abstraction."
# But, if you read the help -of_objects: "Parent parameter definition objects to get parameter abstraction from".
# So I guess the docs are broken - what a surprise - and it can be applied to everything being a "parameter" of some form?
# File groups have none anyway.

ipx::get_hdl_parameters -of_objects $periph
# --> hdl_parameter component_1 C_S00_AXI_DATA_WIDTH hdl_parameter component_1 C_S00_AXI_ADDR_WIDTH
proc get_hdl_parameter_props { thing } {
    puts "| CLASS                          | [get_property CLASS                          $thing] |"
    puts "| CONFIG_GROUPS                  | [get_property CONFIG_GROUPS                  $thing] |"
    puts "| DATA_TYPE                      | [get_property DATA_TYPE                      $thing] |"
    puts "| DESCRIPTION                    | [get_property DESCRIPTION                    $thing] |"
    puts "| DISPLAY_NAME                   | [get_property DISPLAY_NAME                   $thing] |"
    puts "| ENABLEMENT_DEPENDENCY          | [get_property ENABLEMENT_DEPENDENCY          $thing] |"
    puts "| ENABLEMENT_PRESENCE            | [get_property ENABLEMENT_PRESENCE            $thing] |"
    puts "| ENABLEMENT_RESOLVE_TYPE        | [get_property ENABLEMENT_RESOLVE_TYPE        $thing] |"
    puts "| ENABLEMENT_TCL_EXPR            | [get_property ENABLEMENT_TCL_EXPR            $thing] |"
    puts "| ENABLEMENT_TCL_EXPR_ARGUMENTS  | [get_property ENABLEMENT_TCL_EXPR_ARGUMENTS  $thing] |"
    puts "| ENABLEMENT_VALUE               | [get_property ENABLEMENT_VALUE               $thing] |"
    puts "| IPXACT_ID                      | [get_property IPXACT_ID                      $thing] |"
    puts "| NAME                           | [get_property NAME                           $thing] |"
    puts "| ORDER                          | [get_property ORDER                          $thing] |"
    puts "| PARAMETER_TYPES                | [get_property PARAMETER_TYPES                $thing] |"
    puts "| USAGE                          | [get_property USAGE                          $thing] |"
    puts "| VALUE                          | [get_property VALUE                          $thing] |"
    puts "| VALUE_BIT_STRING_LENGTH        | [get_property VALUE_BIT_STRING_LENGTH        $thing] |"
    puts "| VALUE_DEPENDENCY               | [get_property VALUE_DEPENDENCY               $thing] |"
    puts "| VALUE_FORMAT                   | [get_property VALUE_FORMAT                   $thing] |"
    puts "| VALUE_RESOLVE_TYPE             | [get_property VALUE_RESOLVE_TYPE             $thing] |"
    puts "| VALUE_SOURCE                   | [get_property VALUE_SOURCE                   $thing] |"
    puts "| VALUE_TCL_EXPR                 | [get_property VALUE_TCL_EXPR                 $thing] |"
    puts "| VALUE_TCL_EXPR_ARGUMENTS       | [get_property VALUE_TCL_EXPR_ARGUMENTS       $thing] |"
    puts "| VALUE_VALIDATION_LIST          | [get_property VALUE_VALIDATION_LIST          $thing] |"
    puts "| VALUE_VALIDATION_PAIRS         | [get_property VALUE_VALIDATION_PAIRS         $thing] |"
    puts "| VALUE_VALIDATION_RANGE_MAXIMUM | [get_property VALUE_VALIDATION_RANGE_MAXIMUM $thing] |"
    puts "| VALUE_VALIDATION_RANGE_MINIMUM | [get_property VALUE_VALIDATION_RANGE_MINIMUM $thing] |"
    puts "| VALUE_VALIDATION_TYPE          | [get_property VALUE_VALIDATION_TYPE          $thing] |"
}
get_hdl_parameter_props [lindex [ ipx::get_hdl_parameters -of_objects $periph ] 0]
get_hdl_parameter_props [lindex [ ipx::get_hdl_parameters -of_objects $periph ] 1]

ipx::get_parameter_abstractions -of_objects [lindex [ ipx::get_hdl_parameters -of_objects $periph ] 0]
ipx::get_parameter_abstractions -of_objects [lindex [ ipx::get_hdl_parameters -of_objects $periph ] 1]
# ^ Both return nothing.

# ipx::get_user_parameters         Get all the user parameters on a component. 
# ipx::get_user_parameters $periph
# Would return empty.


# ipx::get_parameter_maps                       | Get all the parameter map on a component.                         |
# ipx::get_parameter_maps                       | Evaluates to nothing.
# ipx::get_parameter_maps -of_objects $periph   | Evaluates to nothing.


# ipx::get_parameter_abstraction_maps                 | Get all the parameter abstraction map on a component.             |
# ipx::get_parameter_abstraction_maps                 | Evaluates to nothing.
# Vivado% ipx::get_parameter_abstraction_maps $periph | Evaluates to nothing.
# As usual, help is of great use - we can intuitively understand there's a correlation with parameter_abstraction? ... and ... what?

                                                                                                                                                                                             
# 5    8888888b.                  888                                8888888          888                     .d888                                   
#      888   Y88b                 888                                  888            888                    d88P"                                    
#      888    888                 888                                  888            888                    888                                      
#      888   d88P .d88b.  888d888 888888 .d8888b       88888b.         888   88888b.  888888 .d88b.  888d888 888888 8888b.   .d8888b .d88b.  .d8888b  
#      8888888P" d88""88b 888P"   888    88K           888 "88b        888   888 "88b 888   d8P  Y8b 888P"   888       "88b d88P"   d8P  Y8b 88K      
#      888       888  888 888     888    "Y8888b.      888  888        888   888  888 888   88888888 888     888   .d888888 888     88888888 "Y8888b. 
#      888       Y88..88P 888     Y88b.       X88      888  888        888   888  888 Y88b. Y8b.     888     888   888  888 Y88b.   Y8b.          X88 
#      888        "Y88P"  888      "Y888  88888P'      888  888      8888888 888  888  "Y888 "Y8888  888     888   "Y888888  "Y8888P "Y8888   88888P' 

ipx::get_ports -of_objects $periph
# --> port component_1 s00_axi_awaddr port component_1 s00_axi_awprot port component_1 s00_axi_awvalid port component_1 s00_axi_awready port component_1 s00_axi_wdata port component_1 s00_axi_wstrb port component_1 s00_axi_wvalid port component_1 s00_axi_wready port component_1 s00_axi_bresp port component_1 s00_axi_bvalid port component_1 s00_axi_bready port component_1 s00_axi_araddr port component_1 s00_axi_arprot port component_1 s00_axi_arvalid port component_1 s00_axi_arready port component_1 s00_axi_rdata port component_1 s00_axi_rresp port component_1 s00_axi_rvalid port component_1 s00_axi_rready port component_1 s00_axi_aclk port component_1 s00_axi_aresetn
proc get_port_props { thing } {
    puts "| BUFFER_TYPE                    | [get_property BUFFER_TYPE                    $thing] |"
    puts "| CLASS                          | [get_property CLASS                          $thing] |"
    puts "| DESCRIPTION                    | [get_property DESCRIPTION                    $thing] |"
    puts "| DIRECTION                      | [get_property DIRECTION                      $thing] |"
    puts "| DISPLAY_NAME                   | [get_property DISPLAY_NAME                   $thing] |"
    puts "| DRIVER_VALUE                   | [get_property DRIVER_VALUE                   $thing] |"
    puts "| DRIVER_VALUE_BIT_STRING_LENGTH | [get_property DRIVER_VALUE_BIT_STRING_LENGTH $thing] |"
    puts "| DRIVER_VALUE_DEPENDENCY        | [get_property DRIVER_VALUE_DEPENDENCY        $thing] |"
    puts "| DRIVER_VALUE_FORMAT            | [get_property DRIVER_VALUE_FORMAT            $thing] |"
    puts "| DRIVER_VALUE_RESOLVE_TYPE      | [get_property DRIVER_VALUE_RESOLVE_TYPE      $thing] |"
    puts "| ENABLEMENT_DEPENDENCY          | [get_property ENABLEMENT_DEPENDENCY          $thing] |"
    puts "| ENABLEMENT_PRESENCE            | [get_property ENABLEMENT_PRESENCE            $thing] |"
    puts "| ENABLEMENT_RESOLVE_TYPE        | [get_property ENABLEMENT_RESOLVE_TYPE        $thing] |"
    puts "| ENABLEMENT_VALUE               | [get_property ENABLEMENT_VALUE               $thing] |"
    puts "| ENDIANNESS                     | [get_property ENDIANNESS                     $thing] |"
    puts "| IS_VECTOR                      | [get_property IS_VECTOR                      $thing] |"
    puts "| LATENCY                        | [get_property LATENCY                        $thing] |"
    puts "| NAME                           | [get_property NAME                           $thing] |"
    puts "| SAMPLE_RATE                    | [get_property SAMPLE_RATE                    $thing] |"
    puts "| SIZE_DESCRIPTION               | [get_property SIZE_DESCRIPTION               $thing] |"
    puts "| SIZE_LEFT                      | [get_property SIZE_LEFT                      $thing] |"
    puts "| SIZE_LEFT_BIT_STRING_LENGTH    | [get_property SIZE_LEFT_BIT_STRING_LENGTH    $thing] |"
    puts "| SIZE_LEFT_DEPENDENCY           | [get_property SIZE_LEFT_DEPENDENCY           $thing] |"
    puts "| SIZE_LEFT_FORMAT_TYPE          | [get_property SIZE_LEFT_FORMAT_TYPE          $thing] |"
    puts "| SIZE_LEFT_RESOLVE_TYPE         | [get_property SIZE_LEFT_RESOLVE_TYPE         $thing] |"
    puts "| SIZE_RIGHT                     | [get_property SIZE_RIGHT                     $thing] |"
    puts "| SIZE_RIGHT_BIT_STRING_LENGTH   | [get_property SIZE_RIGHT_BIT_STRING_LENGTH   $thing] |"
    puts "| SIZE_RIGHT_DEPENDENCY          | [get_property SIZE_RIGHT_DEPENDENCY          $thing] |"
    puts "| SIZE_RIGHT_FORMAT_TYPE         | [get_property SIZE_RIGHT_FORMAT_TYPE         $thing] |"
    puts "| SIZE_RIGHT_RESOLVE_TYPE        | [get_property SIZE_RIGHT_RESOLVE_TYPE        $thing] |"
    puts "| TYPE_DEFINITION                | [get_property TYPE_DEFINITION                $thing] |"
    puts "| TYPE_NAME                      | [get_property TYPE_NAME                      $thing] |"
    puts "| VIEW_NAME_REFS                 | [get_property VIEW_NAME_REFS                 $thing] |"
}
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  0]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  1]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  2]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  3]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  4]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  5]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  6]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  7]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  8]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ]  9]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 10]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 11]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 12]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 13]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 14]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 15]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 16]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 17]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 18]
get_port_props [lindex [ ipx::get_ports -of_objects $periph ] 19]

# ipx::get_tlm_ports                            | Get all the transactional ports on a component.                   |
# Tried: ipx::get_tlm_ports                     | Evaluated to nothing
# Tried: ipx::get_tlm_ports -of_objects $periph | Evaluated to nothing

# ipx::get_service_parameters                   | Get all the service parameter on a transactional port.            |
# Cool, but there are no transactional ports to investigate.

# ipx::get_tlm_interfaces                            | Get all the transactional interfaces on a component.              |
# Tried: ipx::get_tlm_interfaces                     | Evaluated to nothing
# Tried: ipx::get_tlm_interfaces -of_objects $periph | Evaluated to nothing

set busses [ipx::get_bus_interfaces -of_objects $periph]
# --> bus_interface component_1 S00_AXI bus_interface component_1 S00_AXI_RST bus_interface component_1 S00_AXI_CLK
set busAxi [lindex $busses  0]
set busRst [lindex $busses  1]
set busClk [lindex $busses  2]
proc get_bus_interface_props { thing } {
    puts "| ABSTRACTION_TYPE_LIBRARY              | [get_property ABSTRACTION_TYPE_LIBRARY              $thing] |"
    puts "| ABSTRACTION_TYPE_NAME                 | [get_property ABSTRACTION_TYPE_NAME                 $thing] |"
    puts "| ABSTRACTION_TYPE_VENDOR               | [get_property ABSTRACTION_TYPE_VENDOR               $thing] |"
    puts "| ABSTRACTION_TYPE_VERSION              | [get_property ABSTRACTION_TYPE_VERSION              $thing] |"
    puts "| ABSTRACTION_TYPE_VLNV                 | [get_property ABSTRACTION_TYPE_VLNV                 $thing] |"
    puts "| BUS_TYPE_LIBRARY                      | [get_property BUS_TYPE_LIBRARY                      $thing] |"
    puts "| BUS_TYPE_NAME                         | [get_property BUS_TYPE_NAME                         $thing] |"
    puts "| BUS_TYPE_VENDOR                       | [get_property BUS_TYPE_VENDOR                       $thing] |"
    puts "| BUS_TYPE_VERSION                      | [get_property BUS_TYPE_VERSION                      $thing] |"
    puts "| BUS_TYPE_VLNV                         | [get_property BUS_TYPE_VLNV                         $thing] |"
    puts "| CLASS                                 | [get_property CLASS                                 $thing] |"
    puts "| CONNECTION_REQUIRED                   | [get_property CONNECTION_REQUIRED                   $thing] |"
    puts "| DESCRIPTION                           | [get_property DESCRIPTION                           $thing] |"
    puts "| DISPLAY_NAME                          | [get_property DISPLAY_NAME                          $thing] |"
    puts "| ENABLEMENT_DEPENDENCY                 | [get_property ENABLEMENT_DEPENDENCY                 $thing] |"
    puts "| ENABLEMENT_PRESENCE                   | [get_property ENABLEMENT_PRESENCE                   $thing] |"
    puts "| ENABLEMENT_RESOLVE_TYPE               | [get_property ENABLEMENT_RESOLVE_TYPE               $thing] |"
    puts "| ENABLEMENT_VALUE                      | [get_property ENABLEMENT_VALUE                      $thing] |"
    puts "| ENDIANNESS                            | [get_property ENDIANNESS                            $thing] |"
    puts "| INTERFACE_MODE                        | [get_property INTERFACE_MODE                        $thing] |"
    puts "| IS_DECLARATION                        | [get_property IS_DECLARATION                        $thing] |"
    puts "| MASTER_ADDRESS_SPACE_REF              | [get_property MASTER_ADDRESS_SPACE_REF              $thing] |"
    puts "| MASTER_BASE_ADDRESS                   | [get_property MASTER_BASE_ADDRESS                   $thing] |"
    puts "| MASTER_BASE_ADDRESS_BIT_STRING_LENGTH | [get_property MASTER_BASE_ADDRESS_BIT_STRING_LENGTH $thing] |"
    puts "| MASTER_BASE_ADDRESS_DEPENDENCY        | [get_property MASTER_BASE_ADDRESS_DEPENDENCY        $thing] |"
    puts "| MASTER_BASE_ADDRESS_FORMAT            | [get_property MASTER_BASE_ADDRESS_FORMAT            $thing] |"
    puts "| MASTER_BASE_ADDRESS_RESOLVE_TYPE      | [get_property MASTER_BASE_ADDRESS_RESOLVE_TYPE      $thing] |"
    puts "| MONITOR_GROUP                         | [get_property MONITOR_GROUP                         $thing] |"
    puts "| MONITOR_INTERFACE_MODE                | [get_property MONITOR_INTERFACE_MODE                $thing] |"
    puts "| NAME                                  | [get_property NAME                                  $thing] |"
    puts "| SLAVE_BRIDGES                         | [get_property SLAVE_BRIDGES                         $thing] |"
    puts "| SLAVE_MEMORY_MAP_REF                  | [get_property SLAVE_MEMORY_MAP_REF                  $thing] |"
}
get_bus_interface_props $busAxi
get_bus_interface_props $busRst
get_bus_interface_props $busClk

set investigate [ ipx::get_bus_parameters -of_objects $busAxi ]
# --> bus_parameter component_1 S00_AXI WIZ_DATA_WIDTH bus_parameter component_1 S00_AXI WIZ_NUM_REG bus_parameter component_1 S00_AXI SUPPORTS_NARROW_BURST
proc get_bus_parameter_props { thing } {
    puts "| CLASS                          | [get_property CLASS                          $thing] |"
    puts "| CONFIG_GROUPS                  | [get_property CONFIG_GROUPS                  $thing] |"
    puts "| DESCRIPTION                    | [get_property DESCRIPTION                    $thing] |"
    puts "| DISPLAY_NAME                   | [get_property DISPLAY_NAME                   $thing] |"
    puts "| ENABLEMENT_DEPENDENCY          | [get_property ENABLEMENT_DEPENDENCY          $thing] |"
    puts "| ENABLEMENT_PRESENCE            | [get_property ENABLEMENT_PRESENCE            $thing] |"
    puts "| ENABLEMENT_RESOLVE_TYPE        | [get_property ENABLEMENT_RESOLVE_TYPE        $thing] |"
    puts "| ENABLEMENT_TCL_EXPR            | [get_property ENABLEMENT_TCL_EXPR            $thing] |"
    puts "| ENABLEMENT_TCL_EXPR_ARGUMENTS  | [get_property ENABLEMENT_TCL_EXPR_ARGUMENTS  $thing] |"
    puts "| ENABLEMENT_VALUE               | [get_property ENABLEMENT_VALUE               $thing] |"
    puts "| IPXACT_ID                      | [get_property IPXACT_ID                      $thing] |"
    puts "| NAME                           | [get_property NAME                           $thing] |"
    puts "| ORDER                          | [get_property ORDER                          $thing] |"
    puts "| PARAMETER_TYPES                | [get_property PARAMETER_TYPES                $thing] |"
    puts "| USAGE                          | [get_property USAGE                          $thing] |"
    puts "| VALUE                          | [get_property VALUE                          $thing] |"
    puts "| VALUE_BIT_STRING_LENGTH        | [get_property VALUE_BIT_STRING_LENGTH        $thing] |"
    puts "| VALUE_DEPENDENCY               | [get_property VALUE_DEPENDENCY               $thing] |"
    puts "| VALUE_FORMAT                   | [get_property VALUE_FORMAT                   $thing] |"
    puts "| VALUE_RESOLVE_TYPE             | [get_property VALUE_RESOLVE_TYPE             $thing] |"
    puts "| VALUE_SOURCE                   | [get_property VALUE_SOURCE                   $thing] |"
    puts "| VALUE_TCL_EXPR                 | [get_property VALUE_TCL_EXPR                 $thing] |"
    puts "| VALUE_TCL_EXPR_ARGUMENTS       | [get_property VALUE_TCL_EXPR_ARGUMENTS       $thing] |"
    puts "| VALUE_VALIDATION_LIST          | [get_property VALUE_VALIDATION_LIST          $thing] |"
    puts "| VALUE_VALIDATION_PAIRS         | [get_property VALUE_VALIDATION_PAIRS         $thing] |"
    puts "| VALUE_VALIDATION_RANGE_MAXIMUM | [get_property VALUE_VALIDATION_RANGE_MAXIMUM $thing] |"
    puts "| VALUE_VALIDATION_RANGE_MINIMUM | [get_property VALUE_VALIDATION_RANGE_MINIMUM $thing] |"
    puts "| VALUE_VALIDATION_TYPE          | [get_property VALUE_VALIDATION_TYPE          $thing] |"
}
get_bus_parameter_props [lindex $investigate 0]
get_bus_parameter_props [lindex $investigate 1]
get_bus_parameter_props [lindex $investigate 2]

# Those three all evaluate to nothing empty nil
ipx::get_parameter_abstractions -of_objects [lindex $investigate 0]
ipx::get_parameter_abstractions -of_objects [lindex $investigate 1]
ipx::get_parameter_abstractions -of_objects [lindex $investigate 2]

set investigate [ipx::get_bus_parameters -of_objects $busRst]
# --> bus_parameter component_1 S00_AXI_RST POLARITY
get_bus_parameter_props [lindex $investigate 0]

set investigate [ipx::get_bus_parameters -of_objects $busClk]
# --> bus_parameter component_1 S00_AXI_CLK ASSOCIATED_BUSIF bus_parameter component_1 S00_AXI_CLK ASSOCIATED_RESET
get_bus_parameter_props [lindex $investigate 0]
get_bus_parameter_props [lindex $investigate 1]

set investigate [ipx::get_port_maps -of_objects $busAxi]
# --> port_map component_1 S00_AXI AWADDR port_map component_1 S00_AXI AWPROT port_map component_1 S00_AXI AWVALID port_map component_1 S00_AXI AWREADY port_map component_1 S00_AXI WDATA port_map component_1 S00_AXI WSTRB port_map component_1 S00_AXI WVALID port_map component_1 S00_AXI WREADY port_map component_1 S00_AXI BRESP port_map component_1 S00_AXI BVALID port_map component_1 S00_AXI BREADY port_map component_1 S00_AXI ARADDR port_map component_1 S00_AXI ARPROT port_map component_1 S00_AXI ARVALID port_map component_1 S00_AXI ARREADY port_map component_1 S00_AXI RDATA port_map component_1 S00_AXI RRESP port_map component_1 S00_AXI RVALID port_map component_1 S00_AXI RREADY
proc get_port_map_props { $thing } {
    puts "| CLASS                            | [get_property CLASS                            $thing] |"
    puts "| IS_LOGICAL_VECTOR                | [get_property IS_LOGICAL_VECTOR                $thing] |"
    puts "| IS_PHYSICAL_VECTOR               | [get_property IS_PHYSICAL_VECTOR               $thing] |"
    puts "| LOGICAL_LEFT                     | [get_property LOGICAL_LEFT                     $thing] |"
    puts "| LOGICAL_LEFT_BIT_STRING_LENGTH   | [get_property LOGICAL_LEFT_BIT_STRING_LENGTH   $thing] |"
    puts "| LOGICAL_LEFT_DEPENDENCY          | [get_property LOGICAL_LEFT_DEPENDENCY          $thing] |"
    puts "| LOGICAL_LEFT_FORMAT_TYPE         | [get_property LOGICAL_LEFT_FORMAT_TYPE         $thing] |"
    puts "| LOGICAL_LEFT_RESOLVE_TYPE        | [get_property LOGICAL_LEFT_RESOLVE_TYPE        $thing] |"
    puts "| LOGICAL_NAME                     | [get_property LOGICAL_NAME                     $thing] |"
    puts "| LOGICAL_RIGHT                    | [get_property LOGICAL_RIGHT                    $thing] |"
    puts "| LOGICAL_RIGHT_BIT_STRING_LENGTH  | [get_property LOGICAL_RIGHT_BIT_STRING_LENGTH  $thing] |"
    puts "| LOGICAL_RIGHT_DEPENDENCY         | [get_property LOGICAL_RIGHT_DEPENDENCY         $thing] |"
    puts "| LOGICAL_RIGHT_FORMAT_TYPE        | [get_property LOGICAL_RIGHT_FORMAT_TYPE        $thing] |"
    puts "| LOGICAL_RIGHT_RESOLVE_TYPE       | [get_property LOGICAL_RIGHT_RESOLVE_TYPE       $thing] |"
    puts "| PHYSICAL_LEFT                    | [get_property PHYSICAL_LEFT                    $thing] |"
    puts "| PHYSICAL_LEFT_BIT_STRING_LENGTH  | [get_property PHYSICAL_LEFT_BIT_STRING_LENGTH  $thing] |"
    puts "| PHYSICAL_LEFT_DEPENDENCY         | [get_property PHYSICAL_LEFT_DEPENDENCY         $thing] |"
    puts "| PHYSICAL_LEFT_FORMAT_TYPE        | [get_property PHYSICAL_LEFT_FORMAT_TYPE        $thing] |"
    puts "| PHYSICAL_LEFT_RESOLVE_TYPE       | [get_property PHYSICAL_LEFT_RESOLVE_TYPE       $thing] |"
    puts "| PHYSICAL_NAME                    | [get_property PHYSICAL_NAME                    $thing] |"
    puts "| PHYSICAL_RIGHT                   | [get_property PHYSICAL_RIGHT                   $thing] |"
    puts "| PHYSICAL_RIGHT_BIT_STRING_LENGTH | [get_property PHYSICAL_RIGHT_BIT_STRING_LENGTH $thing] |"
    puts "| PHYSICAL_RIGHT_DEPENDENCY        | [get_property PHYSICAL_RIGHT_DEPENDENCY        $thing] |"
    puts "| PHYSICAL_RIGHT_FORMAT_TYPE       | [get_property PHYSICAL_RIGHT_FORMAT_TYPE       $thing] |"
    puts "| PHYSICAL_RIGHT_RESOLVE_TYPE      | [get_property PHYSICAL_RIGHT_RESOLVE_TYPE      $thing] |"
}
get_port_map_props [lindex $investigate  0]
get_port_map_props [lindex $investigate  1]
get_port_map_props [lindex $investigate  2]
get_port_map_props [lindex $investigate  3]
get_port_map_props [lindex $investigate  4]
get_port_map_props [lindex $investigate  5]
get_port_map_props [lindex $investigate  6]
get_port_map_props [lindex $investigate  7]
get_port_map_props [lindex $investigate  8]
get_port_map_props [lindex $investigate  9]
get_port_map_props [lindex $investigate 10]
get_port_map_props [lindex $investigate 11]
get_port_map_props [lindex $investigate 12]
get_port_map_props [lindex $investigate 13]
get_port_map_props [lindex $investigate 14]
get_port_map_props [lindex $investigate 15]
get_port_map_props [lindex $investigate 16]
get_port_map_props [lindex $investigate 17]
get_port_map_props [lindex $investigate 18]

set investigate [ipx::get_port_maps -of_objects $busRst]
# --> port_map component_1 S00_AXI_RST RST
get_port_map_props [lindex $investigate  0]

set investigate [ipx::get_port_maps -of_objects $busClk]
# --> port_map component_1 S00_AXI_CLK CLK
get_port_map_props [lindex $investigate  0]

# 8           d8888      888                  d8b                                      888b     d888                                         
#            d88888      888                  Y8P                                      8888b   d8888                                         
#           d88P888      888                                                           88888b.d88888                                         
#          d88P 888  .d88888 888d888 .d8888b  888 88888b.   .d88b.       88888b.       888Y88888P888  .d88b.  88888b.d88b.  888d888 888  888 
#         d88P  888 d88" 888 888P"   88K      888 888 "88b d88P"88b      888 "88b      888 Y888P 888 d8P  Y8b 888 "888 "88b 888P"   888  888 
#        d88P   888 888  888 888     "Y8888b. 888 888  888 888  888      888  888      888  Y8P  888 88888888 888  888  888 888     888  888 
#       d8888888888 Y88b 888 888          X88 888 888  888 Y88b 888      888  888      888   "   888 Y8b.     888  888  888 888     Y88b 888 
#      d88P     888  "Y88888 888      88888P' 888 888  888  "Y88888      888  888      888       888  "Y8888  888  888  888 888      "Y88888 
#                                                               888                                                                      888 
#                                                          Y8b d88P                                                                 Y8b d88P 
#                                                           "Y88P"                                                                   "Y88P"  

# Peripheral contains memory maps contains address blocks, each own with its address block parameters
set investigate [ipx::get_memory_maps -of_objects $periph]
# --> memory_map component_1 S00_AXI
proc get_memory_map_props { thing } {
    puts "| CLASS                   | [get_property CLASS                   $thing] |"
    puts "| DESCRIPTION             | [get_property DESCRIPTION             $thing] |"
    puts "| DISPLAY_NAME            | [get_property DISPLAY_NAME            $thing] |"
    puts "| ENABLEMENT_DEPENDENCY   | [get_property ENABLEMENT_DEPENDENCY   $thing] |"
    puts "| ENABLEMENT_PRESENCE     | [get_property ENABLEMENT_PRESENCE     $thing] |"
    puts "| ENABLEMENT_RESOLVE_TYPE | [get_property ENABLEMENT_RESOLVE_TYPE $thing] |"
    puts "| ENABLEMENT_VALUE        | [get_property ENABLEMENT_VALUE        $thing] |"
    puts "| NAME                    | [get_property NAME                    $thing] |"
}
get_memory_map_props $investigate

ipx::get_subspace_maps -of_objects $investigate
# Evaluates to nothing.

set investigate [ipx::get_address_blocks -of_objects $investigate]
# --> address_block component_1 S00_AXI S00_AXI_reg
proc get_address_block_props { thing } {
    puts "| ACCESS                         | [get_property ACCESS                         $thing] |"
    puts "| BASE_ADDRESS                   | [get_property BASE_ADDRESS                   $thing] |"
    puts "| BASE_ADDRESS_BIT_STRING_LENGTH | [get_property BASE_ADDRESS_BIT_STRING_LENGTH $thing] |"
    puts "| BASE_ADDRESS_DEPENDENCY        | [get_property BASE_ADDRESS_DEPENDENCY        $thing] |"
    puts "| BASE_ADDRESS_FORMAT            | [get_property BASE_ADDRESS_FORMAT            $thing] |"
    puts "| BASE_ADDRESS_RESOLVE_TYPE      | [get_property BASE_ADDRESS_RESOLVE_TYPE      $thing] |"
    puts "| CLASS                          | [get_property CLASS                          $thing] |"
    puts "| DESCRIPTION                    | [get_property DESCRIPTION                    $thing] |"
    puts "| DISPLAY_NAME                   | [get_property DISPLAY_NAME                   $thing] |"
    puts "| ENABLEMENT_DEPENDENCY          | [get_property ENABLEMENT_DEPENDENCY          $thing] |"
    puts "| ENABLEMENT_PRESENCE            | [get_property ENABLEMENT_PRESENCE            $thing] |"
    puts "| ENABLEMENT_RESOLVE_TYPE        | [get_property ENABLEMENT_RESOLVE_TYPE        $thing] |"
    puts "| ENABLEMENT_VALUE               | [get_property ENABLEMENT_VALUE               $thing] |"
    puts "| NAME                           | [get_property NAME                           $thing] |"
    puts "| RANGE                          | [get_property RANGE                          $thing] |"
    puts "| RANGE_BIT_STRING_LENGTH        | [get_property RANGE_BIT_STRING_LENGTH        $thing] |"
    puts "| RANGE_DEPENDENCY               | [get_property RANGE_DEPENDENCY               $thing] |"
    puts "| RANGE_FORMAT                   | [get_property RANGE_FORMAT                   $thing] |"
    puts "| RANGE_MAXIMUM                  | [get_property RANGE_MAXIMUM                  $thing] |"
    puts "| RANGE_MINIMUM                  | [get_property RANGE_MINIMUM                  $thing] |"
    puts "| RANGE_RESOLVE_TYPE             | [get_property RANGE_RESOLVE_TYPE             $thing] |"
    puts "| USAGE                          | [get_property USAGE                          $thing] |"
    puts "| WIDTH                          | [get_property WIDTH                          $thing] |"
    puts "| WIDTH_BIT_STRING_LENGTH        | [get_property WIDTH_BIT_STRING_LENGTH        $thing] |"
    puts "| WIDTH_DEPENDENCY               | [get_property WIDTH_DEPENDENCY               $thing] |"
    puts "| WIDTH_FORMAT                   | [get_property WIDTH_FORMAT                   $thing] |"
    puts "| WIDTH_RESOLVE_TYPE             | [get_property WIDTH_RESOLVE_TYPE             $thing] |"
}

# ipx::get_registers                            | Get all registers from an address block.                          |
# So cool! Maybe we can set register names? It would be lovely but... that's for another time as
#   ipx::get_registers -of_objects [lindex $investigate 0]
# is empty :sadface:

# ipx::get_fields                               | Get all fields from a register.                                   |
# Wow! Maybe I can define my bitflags ? Would be nice but... that's again for another time.

# ipx::get_register_parameters                  | Get all the register parameter on an register.                    |
# Nothing to do for this one - no registers to probe.

set investigate [ipx::get_address_block_parameters -of_objects $investigate]
# --> address_block_parameter component_1 S00_AXI S00_AXI_reg OFFSET_BASE_PARAM address_block_parameter component_1 S00_AXI S00_AXI_reg OFFSET_HIGH_PARAM
proc get_address_block_parameter_props { thing } {
    puts "| CLASS                          | [get_property CLASS                          $thing] |"
    puts "| CONFIG_GROUPS                  | [get_property CONFIG_GROUPS                  $thing] |"
    puts "| DESCRIPTION                    | [get_property DESCRIPTION                    $thing] |"
    puts "| DISPLAY_NAME                   | [get_property DISPLAY_NAME                   $thing] |"
    puts "| ENABLEMENT_DEPENDENCY          | [get_property ENABLEMENT_DEPENDENCY          $thing] |"
    puts "| ENABLEMENT_PRESENCE            | [get_property ENABLEMENT_PRESENCE            $thing] |"
    puts "| ENABLEMENT_RESOLVE_TYPE        | [get_property ENABLEMENT_RESOLVE_TYPE        $thing] |"
    puts "| ENABLEMENT_TCL_EXPR            | [get_property ENABLEMENT_TCL_EXPR            $thing] |"
    puts "| ENABLEMENT_TCL_EXPR_ARGUMENTS  | [get_property ENABLEMENT_TCL_EXPR_ARGUMENTS  $thing] |"
    puts "| ENABLEMENT_VALUE               | [get_property ENABLEMENT_VALUE               $thing] |"
    puts "| IPXACT_ID                      | [get_property IPXACT_ID                      $thing] |"
    puts "| NAME                           | [get_property NAME                           $thing] |"
    puts "| ORDER                          | [get_property ORDER                          $thing] |"
    puts "| PARAMETER_TYPES                | [get_property PARAMETER_TYPES                $thing] |"
    puts "| VALUE                          | [get_property VALUE                          $thing] |"
    puts "| VALUE_BIT_STRING_LENGTH        | [get_property VALUE_BIT_STRING_LENGTH        $thing] |"
    puts "| VALUE_DEPENDENCY               | [get_property VALUE_DEPENDENCY               $thing] |"
    puts "| VALUE_FORMAT                   | [get_property VALUE_FORMAT                   $thing] |"
    puts "| VALUE_RESOLVE_TYPE             | [get_property VALUE_RESOLVE_TYPE             $thing] |"
    puts "| VALUE_SOURCE                   | [get_property VALUE_SOURCE                   $thing] |"
    puts "| VALUE_TCL_EXPR                 | [get_property VALUE_TCL_EXPR                 $thing] |"
    puts "| VALUE_TCL_EXPR_ARGUMENTS       | [get_property VALUE_TCL_EXPR_ARGUMENTS       $thing] |"
    puts "| VALUE_VALIDATION_LIST          | [get_property VALUE_VALIDATION_LIST          $thing] |"
    puts "| VALUE_VALIDATION_PAIRS         | [get_property VALUE_VALIDATION_PAIRS         $thing] |"
    puts "| VALUE_VALIDATION_RANGE_MAXIMUM | [get_property VALUE_VALIDATION_RANGE_MAXIMUM $thing] |"
    puts "| VALUE_VALIDATION_RANGE_MINIMUM | [get_property VALUE_VALIDATION_RANGE_MINIMUM $thing] |"
    puts "| VALUE_VALIDATION_TYPE          | [get_property VALUE_VALIDATION_TYPE          $thing] |"
}
list_property [lindex $investigate 0]
list_property [lindex $investigate 1]

# It seems there's another thing called "address space", a couple commands to investigate them:
ipx::get_address_spaces -of_objects $periph
# --> !empty!

# So, running those makes no sense.
# ipx::get_address_space_parameters             | Get all the addressSpace parameter on an address space.           |
# ipx::get_segments                             | Get all the addressSpace address segment on an address space.     |



#    888b     d888 d8b                   
#    8888b   d8888 Y8P                   
#    88888b.d88888                       
#    888Y88888P888 888 .d8888b   .d8888b 
#    888 Y888P 888 888 88K      d88P"    
#    888  Y8P  888 888 "Y8888b. 888      
#    888   "   888 888      X88 Y88b.    
#    888       888 888  88888P'  "Y8888P 
#
# No clue where those even go
ipx::get_cpus
ipx::get_cpus -of_objects $periph
# ^ Both evaluate to nothing.

# Not really useful for us
## ipx::get_cores
# ^ Crunches for a while. Returns a list of 350 components conveniently named component0...component349.
# ^ Pulled from the default repository? From all the configured repositories?

ipx::get_project_parameters $periph
# ^ Evaluates to nothing. Who knows what a "project parameter" is supposed to be?

# ipx::get_generators                           | Get all the generator on a component.                             |
# ipx::get_generators                           | Evaluates to nothing.
# ipx::get_generators -of_objects $periph       | Evaluates to nothing.


# ipx::get_channels                             | Get all the channel on a component.                               |
# ipx::get_channels                             | Evaluates to nothing.
# ipx::get_channels -of_objects                 | Evaluates to nothing.
# What is a "channel" anyway?


# ipx::get_bus_parameter_abstraction_maps                     | Get all the parameter abstraction map on a component or bus interface
# ipx::get_bus_parameter_abstraction_maps                     | Evaluates to nothing
# ipx::get_bus_parameter_abstraction_maps -of_objects $periph | Evaluates to nothing
# ipx::get_bus_parameter_abstraction_maps -of_objects $busAxi | Evaluates to nothing
# ipx::get_bus_parameter_abstraction_maps -of_objects $busClk | Evaluates to nothing
# ipx::get_bus_parameter_abstraction_maps -of_objects $busRst | Evaluates to nothing
# I get you guys at Xilinx know about that. I get some people has contacts to enquiry.
# I assume this information is serious competitive advantage because why not to just document it is beyond me.


# ipx::get_bus_abstraction_ports                | Get all the bus abstraction port on a bus abstraction.            |
# ^ Lovely, but what is a "bus abstraction" and how to get it? Shouldn't there be a "ipx::get_bus_abstractions" command somewhere?
