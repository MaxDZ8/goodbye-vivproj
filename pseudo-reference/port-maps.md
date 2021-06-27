# Port maps

How to put I/O ports and busses into bus interfaces? Generating the AXI device by the regular project-based flow gives:
```
ipx::get_bus_interfaces
bus_interface component_1 S00_AXI bus_interface component_1 S00_AXI_RST bus_interface component_1 S00_AXI_CLK
```
In the window, `S00_AXI_RST` and `S00_AXI_CLK` are grouped together into a folder.

The port maps, for each entry are such:

```
ipx::get_port_maps -of_objects [lindex [ ipx::get_bus_interfaces ] 0]
port_map component_1 S00_AXI AWADDR port_map component_1 S00_AXI AWPROT port_map component_1 S00_AXI AWVALID port_map component_1 S00_AXI AWREADY port_map component_1 S00_AXI WDATA port_map component_1 S00_AXI WSTRB port_map component_1 S00_AXI WVALID port_map component_1 S00_AXI WREADY port_map component_1 S00_AXI BRESP port_map component_1 S00_AXI BVALID port_map component_1 S00_AXI BREADY port_map component_1 S00_AXI ARADDR port_map component_1 S00_AXI ARPROT port_map component_1 S00_AXI ARVALID port_map component_1 S00_AXI ARREADY port_map component_1 S00_AXI RDATA port_map component_1 S00_AXI RRESP port_map component_1 S00_AXI RVALID port_map component_1 S00_AXI RREADY
ipx::get_port_maps -of_objects [lindex [ ipx::get_bus_interfaces ] 1]
port_map component_1 S00_AXI_RST RST
ipx::get_port_maps -of_objects [lindex [ ipx::get_bus_interfaces ] 2]
port_map component_1 S00_AXI_CLK CLK
```

| Index |    Label    | Port count |
|-------|-------------|------------|
|   0   | S00_AXI     | 19         |
|   1   | S00_AXI_RST | 1          |
|   2   | S00_AXI_CLK | 1          |

And the properties of each port map entry, for example
```
list_property [lindex [ ipx::get_port_maps -of_objects [lindex [ ipx::get_bus_interfaces ] 0] ] 0 ]
CLASS IS_LOGICAL_VECTOR IS_PHYSICAL_VECTOR LOGICAL_LEFT LOGICAL_LEFT_BIT_STRING_LENGTH LOGICAL_LEFT_DEPENDENCY LOGICAL_LEFT_FORMAT_TYPE LOGICAL_LEFT_RESOLVE_TYPE LOGICAL_NAME LOGICAL_RIGHT LOGICAL_RIGHT_BIT_STRING_LENGTH LOGICAL_RIGHT_DEPENDENCY LOGICAL_RIGHT_FORMAT_TYPE LOGICAL_RIGHT_RESOLVE_TYPE PHYSICAL_LEFT PHYSICAL_LEFT_BIT_STRING_LENGTH PHYSICAL_LEFT_DEPENDENCY PHYSICAL_LEFT_FORMAT_TYPE PHYSICAL_LEFT_RESOLVE_TYPE PHYSICAL_NAME PHYSICAL_RIGHT PHYSICAL_RIGHT_BIT_STRING_LENGTH PHYSICAL_RIGHT_DEPENDENCY PHYSICAL_RIGHT_FORMAT_TYPE PHYSICAL_RIGHT_RESOLVE_TYPE
```

So, by the means of patience this is what we need to reproduce (hopefully less than this) to build our mappings.

**Ports for the `S00_AXI` bus interface (element 0).**


| Element | Property                         | Observed value      |
|---------|----------------------------------|---------------------|
|  0      | CLASS                            | port_map              |
|  0      | IS_LOGICAL_VECTOR                | 0              |
|  0      | IS_PHYSICAL_VECTOR               | 0              |
|  0      | LOGICAL_LEFT                     | 0              |
|  0      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  0      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  0      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  0      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  0      | LOGICAL_NAME                     | AWADDR              |
|  0      | LOGICAL_RIGHT                    | 0              |
|  0      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  0      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  0      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  0      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  0      | PHYSICAL_LEFT                    | 0              |
|  0      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  0      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  0      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  0      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  0      | PHYSICAL_NAME                    | s00_axi_awaddr              |
|  0      | PHYSICAL_RIGHT                   | 0              |
|  0      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  0      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  0      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  0      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  1      | CLASS                            | port_map              |
|  1      | IS_LOGICAL_VECTOR                | 0              |
|  1      | IS_PHYSICAL_VECTOR               | 0              |
|  1      | LOGICAL_LEFT                     | 0              |
|  1      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  1      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  1      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  1      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  1      | LOGICAL_NAME                     | AWPROT              |
|  1      | LOGICAL_RIGHT                    | 0              |
|  1      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  1      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  1      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  1      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  1      | PHYSICAL_LEFT                    | 0              |
|  1      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  1      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  1      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  1      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  1      | PHYSICAL_NAME                    | s00_axi_awprot              |
|  1      | PHYSICAL_RIGHT                   | 0              |
|  1      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  1      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  1      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  1      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  2      | CLASS                            | port_map              |
|  2      | IS_LOGICAL_VECTOR                | 0              |
|  2      | IS_PHYSICAL_VECTOR               | 0              |
|  2      | LOGICAL_LEFT                     | 0              |
|  2      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  2      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  2      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  2      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  2      | LOGICAL_NAME                     | AWVALID              |
|  2      | LOGICAL_RIGHT                    | 0              |
|  2      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  2      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  2      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  2      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  2      | PHYSICAL_LEFT                    | 0              |
|  2      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  2      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  2      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  2      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  2      | PHYSICAL_NAME                    | s00_axi_awvalid              |
|  2      | PHYSICAL_RIGHT                   | 0              |
|  2      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  2      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  2      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  2      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  3      | CLASS                            | port_map              |
|  3      | IS_LOGICAL_VECTOR                | 0              |
|  3      | IS_PHYSICAL_VECTOR               | 0              |
|  3      | LOGICAL_LEFT                     | 0              |
|  3      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  3      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  3      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  3      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  3      | LOGICAL_NAME                     | AWREADY              |
|  3      | LOGICAL_RIGHT                    | 0              |
|  3      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  3      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  3      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  3      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  3      | PHYSICAL_LEFT                    | 0              |
|  3      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  3      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  3      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  3      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  3      | PHYSICAL_NAME                    | s00_axi_awready              |
|  3      | PHYSICAL_RIGHT                   | 0              |
|  3      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  3      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  3      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  3      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  4      | CLASS                            | port_map              |
|  4      | IS_LOGICAL_VECTOR                | 0              |
|  4      | IS_PHYSICAL_VECTOR               | 0              |
|  4      | LOGICAL_LEFT                     | 0              |
|  4      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  4      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  4      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  4      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  4      | LOGICAL_NAME                     | WDATA              |
|  4      | LOGICAL_RIGHT                    | 0              |
|  4      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  4      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  4      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  4      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  4      | PHYSICAL_LEFT                    | 0              |
|  4      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  4      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  4      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  4      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  4      | PHYSICAL_NAME                    | s00_axi_wdata              |
|  4      | PHYSICAL_RIGHT                   | 0              |
|  4      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  4      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  4      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  4      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  5      | CLASS                            | port_map              |
|  5      | IS_LOGICAL_VECTOR                | 0              |
|  5      | IS_PHYSICAL_VECTOR               | 0              |
|  5      | LOGICAL_LEFT                     | 0              |
|  5      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  5      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  5      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  5      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  5      | LOGICAL_NAME                     | WSTRB              |
|  5      | LOGICAL_RIGHT                    | 0              |
|  5      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  5      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  5      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  5      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  5      | PHYSICAL_LEFT                    | 0              |
|  5      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  5      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  5      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  5      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  5      | PHYSICAL_NAME                    | s00_axi_wstrb              |
|  5      | PHYSICAL_RIGHT                   | 0              |
|  5      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  5      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  5      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  5      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  6      | CLASS                            | port_map              |
|  6      | IS_LOGICAL_VECTOR                | 0              |
|  6      | IS_PHYSICAL_VECTOR               | 0              |
|  6      | LOGICAL_LEFT                     | 0              |
|  6      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  6      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  6      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  6      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  6      | LOGICAL_NAME                     | WVALID              |
|  6      | LOGICAL_RIGHT                    | 0              |
|  6      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  6      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  6      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  6      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  6      | PHYSICAL_LEFT                    | 0              |
|  6      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  6      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  6      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  6      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  6      | PHYSICAL_NAME                    | s00_axi_wvalid              |
|  6      | PHYSICAL_RIGHT                   | 0              |
|  6      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  6      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  6      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  6      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  7      | CLASS                            | port_map              |
|  7      | IS_LOGICAL_VECTOR                | 0              |
|  7      | IS_PHYSICAL_VECTOR               | 0              |
|  7      | LOGICAL_LEFT                     | 0              |
|  7      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  7      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  7      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  7      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  7      | LOGICAL_NAME                     | WREADY              |
|  7      | LOGICAL_RIGHT                    | 0              |
|  7      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  7      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  7      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  7      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  7      | PHYSICAL_LEFT                    | 0              |
|  7      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  7      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  7      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  7      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  7      | PHYSICAL_NAME                    | s00_axi_wready              |
|  7      | PHYSICAL_RIGHT                   | 0              |
|  7      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  7      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  7      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  7      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  8      | CLASS                            | port_map              |
|  8      | IS_LOGICAL_VECTOR                | 0              |
|  8      | IS_PHYSICAL_VECTOR               | 0              |
|  8      | LOGICAL_LEFT                     | 0              |
|  8      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  8      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  8      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  8      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  8      | LOGICAL_NAME                     | BRESP              |
|  8      | LOGICAL_RIGHT                    | 0              |
|  8      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  8      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  8      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  8      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  8      | PHYSICAL_LEFT                    | 0              |
|  8      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  8      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  8      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  8      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  8      | PHYSICAL_NAME                    | s00_axi_bresp              |
|  8      | PHYSICAL_RIGHT                   | 0              |
|  8      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  8      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  8      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  8      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
|  9      | CLASS                            | port_map              |
|  9      | IS_LOGICAL_VECTOR                | 0              |
|  9      | IS_PHYSICAL_VECTOR               | 0              |
|  9      | LOGICAL_LEFT                     | 0              |
|  9      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
|  9      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  9      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
|  9      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
|  9      | LOGICAL_NAME                     | BVALID              |
|  9      | LOGICAL_RIGHT                    | 0              |
|  9      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
|  9      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  9      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
|  9      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
|  9      | PHYSICAL_LEFT                    | 0              |
|  9      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
|  9      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  9      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
|  9      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
|  9      | PHYSICAL_NAME                    | s00_axi_bvalid              |
|  9      | PHYSICAL_RIGHT                   | 0              |
|  9      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
|  9      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  9      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
|  9      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 10      | CLASS                            | port_map              |
| 10      | IS_LOGICAL_VECTOR                | 0              |
| 10      | IS_PHYSICAL_VECTOR               | 0              |
| 10      | LOGICAL_LEFT                     | 0              |
| 10      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 10      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 10      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 10      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 10      | LOGICAL_NAME                     | BREADY              |
| 10      | LOGICAL_RIGHT                    | 0              |
| 10      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 10      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 10      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 10      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 10      | PHYSICAL_LEFT                    | 0              |
| 10      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 10      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 10      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 10      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 10      | PHYSICAL_NAME                    | s00_axi_bready              |
| 10      | PHYSICAL_RIGHT                   | 0              |
| 10      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 10      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 10      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 10      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 11      | CLASS                            | port_map              |
| 11      | IS_LOGICAL_VECTOR                | 0              |
| 11      | IS_PHYSICAL_VECTOR               | 0              |
| 11      | LOGICAL_LEFT                     | 0              |
| 11      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 11      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 11      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 11      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 11      | LOGICAL_NAME                     | ARADDR              |
| 11      | LOGICAL_RIGHT                    | 0              |
| 11      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 11      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 11      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 11      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 11      | PHYSICAL_LEFT                    | 0              |
| 11      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 11      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 11      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 11      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 11      | PHYSICAL_NAME                    | s00_axi_araddr              |
| 11      | PHYSICAL_RIGHT                   | 0              |
| 11      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 11      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 11      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 11      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 12      | CLASS                            | port_map              |
| 12      | IS_LOGICAL_VECTOR                | 0              |
| 12      | IS_PHYSICAL_VECTOR               | 0              |
| 12      | LOGICAL_LEFT                     | 0              |
| 12      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 12      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 12      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 12      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 12      | LOGICAL_NAME                     | ARPROT              |
| 12      | LOGICAL_RIGHT                    | 0              |
| 12      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 12      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 12      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 12      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 12      | PHYSICAL_LEFT                    | 0              |
| 12      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 12      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 12      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 12      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 12      | PHYSICAL_NAME                    | s00_axi_arprot              |
| 12      | PHYSICAL_RIGHT                   | 0              |
| 12      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 12      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 12      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 12      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 13      | CLASS                            | port_map              |
| 13      | IS_LOGICAL_VECTOR                | 0              |
| 13      | IS_PHYSICAL_VECTOR               | 0              |
| 13      | LOGICAL_LEFT                     | 0              |
| 13      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 13      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 13      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 13      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 13      | LOGICAL_NAME                     | ARVALID              |
| 13      | LOGICAL_RIGHT                    | 0              |
| 13      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 13      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 13      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 13      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 13      | PHYSICAL_LEFT                    | 0              |
| 13      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 13      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 13      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 13      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 13      | PHYSICAL_NAME                    | s00_axi_arvalid              |
| 13      | PHYSICAL_RIGHT                   | 0              |
| 13      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 13      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 13      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 13      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 14      | CLASS                            | port_map              |
| 14      | IS_LOGICAL_VECTOR                | 0              |
| 14      | IS_PHYSICAL_VECTOR               | 0              |
| 14      | LOGICAL_LEFT                     | 0              |
| 14      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 14      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 14      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 14      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 14      | LOGICAL_NAME                     | ARREADY              |
| 14      | LOGICAL_RIGHT                    | 0              |
| 14      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 14      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 14      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 14      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 14      | PHYSICAL_LEFT                    | 0              |
| 14      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 14      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 14      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 14      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 14      | PHYSICAL_NAME                    | s00_axi_arready              |
| 14      | PHYSICAL_RIGHT                   | 0              |
| 14      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 14      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 14      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 14      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 15      | CLASS                            | port_map              |
| 15      | IS_LOGICAL_VECTOR                | 0              |
| 15      | IS_PHYSICAL_VECTOR               | 0              |
| 15      | LOGICAL_LEFT                     | 0              |
| 15      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 15      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 15      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 15      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 15      | LOGICAL_NAME                     | RDATA              |
| 15      | LOGICAL_RIGHT                    | 0              |
| 15      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 15      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 15      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 15      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 15      | PHYSICAL_LEFT                    | 0              |
| 15      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 15      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 15      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 15      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 15      | PHYSICAL_NAME                    | s00_axi_rdata              |
| 15      | PHYSICAL_RIGHT                   | 0              |
| 15      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 15      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 15      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 15      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 16      | CLASS                            | port_map              |
| 16      | IS_LOGICAL_VECTOR                | 0              |
| 16      | IS_PHYSICAL_VECTOR               | 0              |
| 16      | LOGICAL_LEFT                     | 0              |
| 16      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 16      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 16      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 16      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 16      | LOGICAL_NAME                     | RRESP              |
| 16      | LOGICAL_RIGHT                    | 0              |
| 16      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 16      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 16      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 16      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 16      | PHYSICAL_LEFT                    | 0              |
| 16      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 16      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 16      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 16      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 16      | PHYSICAL_NAME                    | s00_axi_rresp              |
| 16      | PHYSICAL_RIGHT                   | 0              |
| 16      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 16      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 16      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 16      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 17      | CLASS                            | port_map              |
| 17      | IS_LOGICAL_VECTOR                | 0              |
| 17      | IS_PHYSICAL_VECTOR               | 0              |
| 17      | LOGICAL_LEFT                     | 0              |
| 17      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 17      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 17      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 17      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 17      | LOGICAL_NAME                     | RVALID              |
| 17      | LOGICAL_RIGHT                    | 0              |
| 17      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 17      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 17      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 17      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 17      | PHYSICAL_LEFT                    | 0              |
| 17      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 17      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 17      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 17      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 17      | PHYSICAL_NAME                    | s00_axi_rvalid              |
| 17      | PHYSICAL_RIGHT                   | 0              |
| 17      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 17      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 17      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 17      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |
| 18      | CLASS                            | port_map              |
| 18      | IS_LOGICAL_VECTOR                | 0              |
| 18      | IS_PHYSICAL_VECTOR               | 0              |
| 18      | LOGICAL_LEFT                     | 0              |
| 18      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0              |
| 18      | LOGICAL_LEFT_DEPENDENCY          |                     |
| 18      | LOGICAL_LEFT_FORMAT_TYPE         | long              |
| 18      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate              |
| 18      | LOGICAL_NAME                     | RREADY              |
| 18      | LOGICAL_RIGHT                    | 0              |
| 18      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0              |
| 18      | LOGICAL_RIGHT_DEPENDENCY         |                     |
| 18      | LOGICAL_RIGHT_FORMAT_TYPE        | long              |
| 18      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate              |
| 18      | PHYSICAL_LEFT                    | 0              |
| 18      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0              |
| 18      | PHYSICAL_LEFT_DEPENDENCY         |                     |
| 18      | PHYSICAL_LEFT_FORMAT_TYPE        | long              |
| 18      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate              |
| 18      | PHYSICAL_NAME                    | s00_axi_rready              |
| 18      | PHYSICAL_RIGHT                   | 0              |
| 18      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0              |
| 18      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
| 18      | PHYSICAL_RIGHT_FORMAT_TYPE       | long              |
| 18      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate              |

*The `S00_AXI_RST` bus interface has a single port.*

| Element | Property                         | Observed value      |
|---------|----------------------------------|---------------------|
|  0      | CLASS                            | port_map            |
|  0      | IS_LOGICAL_VECTOR                | 0            |
|  0      | IS_PHYSICAL_VECTOR               | 0            |
|  0      | LOGICAL_LEFT                     | 0            |
|  0      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0            |
|  0      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  0      | LOGICAL_LEFT_FORMAT_TYPE         | long            |
|  0      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate            |
|  0      | LOGICAL_NAME                     | RST            |
|  0      | LOGICAL_RIGHT                    | 0            |
|  0      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0            |
|  0      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  0      | LOGICAL_RIGHT_FORMAT_TYPE        | long            |
|  0      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate            |
|  0      | PHYSICAL_LEFT                    | 0            |
|  0      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0            |
|  0      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  0      | PHYSICAL_LEFT_FORMAT_TYPE        | long            |
|  0      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate            |
|  0      | PHYSICAL_NAME                    | s00_axi_aresetn            |
|  0      | PHYSICAL_RIGHT                   | 0            |
|  0      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0            |
|  0      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  0      | PHYSICAL_RIGHT_FORMAT_TYPE       | long            |
|  0      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate            |

*The bus interface `S00_AXI_CLK` also has a single port.*

| Element | Property                         | Observed value      |
|---------|----------------------------------|---------------------|
|  0      | CLASS                            | port_map            |
|  0      | IS_LOGICAL_VECTOR                | 0            |
|  0      | IS_PHYSICAL_VECTOR               | 0            |
|  0      | LOGICAL_LEFT                     | 0            |
|  0      | LOGICAL_LEFT_BIT_STRING_LENGTH   | 0            |
|  0      | LOGICAL_LEFT_DEPENDENCY          |                     |
|  0      | LOGICAL_LEFT_FORMAT_TYPE         | long            |
|  0      | LOGICAL_LEFT_RESOLVE_TYPE        | immediate            |
|  0      | LOGICAL_NAME                     | CLK            |
|  0      | LOGICAL_RIGHT                    | 0            |
|  0      | LOGICAL_RIGHT_BIT_STRING_LENGTH  | 0            |
|  0      | LOGICAL_RIGHT_DEPENDENCY         |                     |
|  0      | LOGICAL_RIGHT_FORMAT_TYPE        | long            |
|  0      | LOGICAL_RIGHT_RESOLVE_TYPE       | immediate            |
|  0      | PHYSICAL_LEFT                    | 0            |
|  0      | PHYSICAL_LEFT_BIT_STRING_LENGTH  | 0            |
|  0      | PHYSICAL_LEFT_DEPENDENCY         |                     |
|  0      | PHYSICAL_LEFT_FORMAT_TYPE        | long            |
|  0      | PHYSICAL_LEFT_RESOLVE_TYPE       | immediate            |
|  0      | PHYSICAL_NAME                    | s00_axi_aclk            |
|  0      | PHYSICAL_RIGHT                   | 0            |
|  0      | PHYSICAL_RIGHT_BIT_STRING_LENGTH | 0            |
|  0      | PHYSICAL_RIGHT_DEPENDENCY        |                     |
|  0      | PHYSICAL_RIGHT_FORMAT_TYPE       | long            |
|  0      | PHYSICAL_RIGHT_RESOLVE_TYPE      | immediate            |

It turns out this is basically what you get out of `ipx::add_port_map`. Just change `LOGICAL_NAME`, `PHYSICAL_NAME` and you're good to go.