read_verilog -sv mdz_custom_logic.sv
set periph [ create_peripheral {myCompany.com} {user} {testAXI1} {1.3} ]
add_peripheral_interface {S00_AXI} -interface_mode {slave} -axi_type {lite} $periph
generate_peripheral $periph


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


ipx::get_hdl_parameters -of_objects $periph
# --> hdl_parameter component_1 C_S00_AXI_DATA_WIDTH hdl_parameter component_1 C_S00_AXI_ADDR_WIDTH
proc get_hdl_parameter_props { thing } {
    puts "| CLASS                          | [get_property CLASS                          $thing] | "
    puts "| CONFIG_GROUPS                  | [get_property CONFIG_GROUPS                  $thing] | "
    puts "| DATA_TYPE                      | [get_property DATA_TYPE                      $thing] | "
    puts "| DESCRIPTION                    | [get_property DESCRIPTION                    $thing] | "
    puts "| DISPLAY_NAME                   | [get_property DISPLAY_NAME                   $thing] | "
    puts "| ENABLEMENT_DEPENDENCY          | [get_property ENABLEMENT_DEPENDENCY          $thing] | "
    puts "| ENABLEMENT_PRESENCE            | [get_property ENABLEMENT_PRESENCE            $thing] | "
    puts "| ENABLEMENT_RESOLVE_TYPE        | [get_property ENABLEMENT_RESOLVE_TYPE        $thing] | "
    puts "| ENABLEMENT_TCL_EXPR            | [get_property ENABLEMENT_TCL_EXPR            $thing] | "
    puts "| ENABLEMENT_TCL_EXPR_ARGUMENTS  | [get_property ENABLEMENT_TCL_EXPR_ARGUMENTS  $thing] | "
    puts "| ENABLEMENT_VALUE               | [get_property ENABLEMENT_VALUE               $thing] | "
    puts "| IPXACT_ID                      | [get_property IPXACT_ID                      $thing] | "
    puts "| NAME                           | [get_property NAME                           $thing] | "
    puts "| ORDER                          | [get_property ORDER                          $thing] | "
    puts "| PARAMETER_TYPES                | [get_property PARAMETER_TYPES                $thing] | "
    puts "| USAGE                          | [get_property USAGE                          $thing] | "
    puts "| VALUE                          | [get_property VALUE                          $thing] | "
    puts "| VALUE_BIT_STRING_LENGTH        | [get_property VALUE_BIT_STRING_LENGTH        $thing] | "
    puts "| VALUE_DEPENDENCY               | [get_property VALUE_DEPENDENCY               $thing] | "
    puts "| VALUE_FORMAT                   | [get_property VALUE_FORMAT                   $thing] | "
    puts "| VALUE_RESOLVE_TYPE             | [get_property VALUE_RESOLVE_TYPE             $thing] | "
    puts "| VALUE_SOURCE                   | [get_property VALUE_SOURCE                   $thing] | "
    puts "| VALUE_TCL_EXPR                 | [get_property VALUE_TCL_EXPR                 $thing] | "
    puts "| VALUE_TCL_EXPR_ARGUMENTS       | [get_property VALUE_TCL_EXPR_ARGUMENTS       $thing] | "
    puts "| VALUE_VALIDATION_LIST          | [get_property VALUE_VALIDATION_LIST          $thing] | "
    puts "| VALUE_VALIDATION_PAIRS         | [get_property VALUE_VALIDATION_PAIRS         $thing] | "
    puts "| VALUE_VALIDATION_RANGE_MAXIMUM | [get_property VALUE_VALIDATION_RANGE_MAXIMUM $thing] | "
    puts "| VALUE_VALIDATION_RANGE_MINIMUM | [get_property VALUE_VALIDATION_RANGE_MINIMUM $thing] | "
    puts "| VALUE_VALIDATION_TYPE          | [get_property VALUE_VALIDATION_TYPE          $thing] | "
}
get_hdl_parameter_props [lindex [ ipx::get_hdl_parameters -of_objects $periph ] 0]
get_hdl_parameter_props [lindex [ ipx::get_hdl_parameters -of_objects $periph ] 1]

ipx::get_ports -of_objects $periph
# --> port component_1 s00_axi_awaddr port component_1 s00_axi_awprot port component_1 s00_axi_awvalid port component_1 s00_axi_awready port component_1 s00_axi_wdata port component_1 s00_axi_wstrb port component_1 s00_axi_wvalid port component_1 s00_axi_wready port component_1 s00_axi_bresp port component_1 s00_axi_bvalid port component_1 s00_axi_bready port component_1 s00_axi_araddr port component_1 s00_axi_arprot port component_1 s00_axi_arvalid port component_1 s00_axi_arready port component_1 s00_axi_rdata port component_1 s00_axi_rresp port component_1 s00_axi_rvalid port component_1 s00_axi_rready port component_1 s00_axi_aclk port component_1 s00_axi_aresetn
proc get_port_props { thing } {
    puts "| BUFFER_TYPE                    | [get_property BUFFER_TYPE                    $thing] | "
    puts "| CLASS                          | [get_property CLASS                          $thing] | "
    puts "| DESCRIPTION                    | [get_property DESCRIPTION                    $thing] | "
    puts "| DIRECTION                      | [get_property DIRECTION                      $thing] | "
    puts "| DISPLAY_NAME                   | [get_property DISPLAY_NAME                   $thing] | "
    puts "| DRIVER_VALUE                   | [get_property DRIVER_VALUE                   $thing] | "
    puts "| DRIVER_VALUE_BIT_STRING_LENGTH | [get_property DRIVER_VALUE_BIT_STRING_LENGTH $thing] | "
    puts "| DRIVER_VALUE_DEPENDENCY        | [get_property DRIVER_VALUE_DEPENDENCY        $thing] | "
    puts "| DRIVER_VALUE_FORMAT            | [get_property DRIVER_VALUE_FORMAT            $thing] | "
    puts "| DRIVER_VALUE_RESOLVE_TYPE      | [get_property DRIVER_VALUE_RESOLVE_TYPE      $thing] | "
    puts "| ENABLEMENT_DEPENDENCY          | [get_property ENABLEMENT_DEPENDENCY          $thing] | "
    puts "| ENABLEMENT_PRESENCE            | [get_property ENABLEMENT_PRESENCE            $thing] | "
    puts "| ENABLEMENT_RESOLVE_TYPE        | [get_property ENABLEMENT_RESOLVE_TYPE        $thing] | "
    puts "| ENABLEMENT_VALUE               | [get_property ENABLEMENT_VALUE               $thing] | "
    puts "| ENDIANNESS                     | [get_property ENDIANNESS                     $thing] | "
    puts "| IS_VECTOR                      | [get_property IS_VECTOR                      $thing] | "
    puts "| LATENCY                        | [get_property LATENCY                        $thing] | "
    puts "| NAME                           | [get_property NAME                           $thing] | "
    puts "| SAMPLE_RATE                    | [get_property SAMPLE_RATE                    $thing] | "
    puts "| SIZE_DESCRIPTION               | [get_property SIZE_DESCRIPTION               $thing] | "
    puts "| SIZE_LEFT                      | [get_property SIZE_LEFT                      $thing] | "
    puts "| SIZE_LEFT_BIT_STRING_LENGTH    | [get_property SIZE_LEFT_BIT_STRING_LENGTH    $thing] | "
    puts "| SIZE_LEFT_DEPENDENCY           | [get_property SIZE_LEFT_DEPENDENCY           $thing] | "
    puts "| SIZE_LEFT_FORMAT_TYPE          | [get_property SIZE_LEFT_FORMAT_TYPE          $thing] | "
    puts "| SIZE_LEFT_RESOLVE_TYPE         | [get_property SIZE_LEFT_RESOLVE_TYPE         $thing] | "
    puts "| SIZE_RIGHT                     | [get_property SIZE_RIGHT                     $thing] | "
    puts "| SIZE_RIGHT_BIT_STRING_LENGTH   | [get_property SIZE_RIGHT_BIT_STRING_LENGTH   $thing] | "
    puts "| SIZE_RIGHT_DEPENDENCY          | [get_property SIZE_RIGHT_DEPENDENCY          $thing] | "
    puts "| SIZE_RIGHT_FORMAT_TYPE         | [get_property SIZE_RIGHT_FORMAT_TYPE         $thing] | "
    puts "| SIZE_RIGHT_RESOLVE_TYPE        | [get_property SIZE_RIGHT_RESOLVE_TYPE        $thing] | "
    puts "| TYPE_DEFINITION                | [get_property TYPE_DEFINITION                $thing] | "
    puts "| TYPE_NAME                      | [get_property TYPE_NAME                      $thing] | "
    puts "| VIEW_NAME_REFS                 | [get_property VIEW_NAME_REFS                 $thing] | "
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

set investigate ipx::get_bus_parameters -of_objects $busRst
# --> bus_parameter component_1 S00_AXI_RST POLARITY
get_bus_parameter_props [lindex $investigate 0]

set investigate [ipx::get_bus_parameters -of_objects $busClk]
# --> bus_parameter component_1 S00_AXI_CLK ASSOCIATED_BUSIF bus_parameter component_1 S00_AXI_CLK ASSOCIATED_RESET
get_bus_parameter_props [lindex $investigate 0]
get_bus_parameter_props [lindex $investigate 1]

set investigate [ipx::get_port_maps -of_objects $busAxi]
# --> port_map component_1 S00_AXI AWADDR port_map component_1 S00_AXI AWPROT port_map component_1 S00_AXI AWVALID port_map component_1 S00_AXI AWREADY port_map component_1 S00_AXI WDATA port_map component_1 S00_AXI WSTRB port_map component_1 S00_AXI WVALID port_map component_1 S00_AXI WREADY port_map component_1 S00_AXI BRESP port_map component_1 S00_AXI BVALID port_map component_1 S00_AXI BREADY port_map component_1 S00_AXI ARADDR port_map component_1 S00_AXI ARPROT port_map component_1 S00_AXI ARVALID port_map component_1 S00_AXI ARREADY port_map component_1 S00_AXI RDATA port_map component_1 S00_AXI RRESP port_map component_1 S00_AXI RVALID port_map component_1 S00_AXI RREADY
proc get_port_map_props { $thing }
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

# So, running this makes no sense.
# ipx::get_address_space_parameters             | Get all the addressSpace parameter on an address space.           |




# TODO ----- Where do those go?

# ipx::get_bus_abstraction_ports                | Get all the bus abstraction port on a bus abstraction.            |
# ipx::get_bus_parameter_abstraction_maps       | Get all the parameter abstraction map on a component or bus interface
# ipx::get_channels                             | Get all the channel on a component.                               |
# ipx::get_cores                                | Get a list of available ipx cores                                 |
# ipx::get_cpus                                 | Get all the cpu on a component.                                   |
# ipx::get_fields                               | Get all fields from a register.                                   |
# ipx::get_file_groups_for_envid                | Get all file_groups that match the specified env_ids.             |
# ipx::get_file_groups_for_file                 | Get all file_groups that contain the specified file name.         |
# ipx::get_files                                | Get all or selected files a file group.                           |
# ipx::get_generator_parameters                 | Get all the generator parameter on a generator.                   |
# ipx::get_generators                           | Get all the generator on a component.                             |
# ipx::get_parameter_abstraction_maps           | Get all the parameter abstraction map on a component.             |
# ipx::get_parameter_abstractions               | Get all parameter abstractions from a parameter abstraction.      |
# ipx::get_parameter_maps                       | Get all the parameter map on a component.                         |
# ipx::get_project_parameters                   | Get all the project parameters on a component.                    |
# ipx::get_register_parameters                  | Get all the register parameter on an register.                    |
# ipx::get_registers                            | Get all registers from an address block.                          |
# ipx::get_segments                             | Get all the addressSpace address segment on an address space.     |
# ipx::get_service_parameters                   | Get all the service parameter on a transactional port.            |
# ipx::get_subcores                             | Get all subcores from a fileGroup.                                |
# ipx::get_subspace_maps                        | Get all the subspace maps on a memory map.                        |
# ipx::get_tlm_interfaces                       | Get all the transactional interfaces on a component.              |
# ipx::get_tlm_ports                            | Get all the transactional ports on a component.                   |
# ipx::get_user_parameters                      | Get all the user parameters on a component.                       |