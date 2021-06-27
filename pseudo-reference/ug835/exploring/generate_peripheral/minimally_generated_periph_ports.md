Ports of a minimally generated peripheral.

```
Vivado% ipx::get_ports -of_objects $periph
port component_1 s00_axi_awaddr port component_1 s00_axi_awprot port component_1 s00_axi_awvalid port component_1 s00_axi_awready port component_1 s00_axi_wdata port component_1 s00_axi_wstrb port component_1 s00_axi_wvalid port component_1 s00_axi_wready port component_1 s00_axi_bresp port component_1 s00_axi_bvalid port component_1 s00_axi_bready port component_1 s00_axi_araddr port component_1 s00_axi_arprot port component_1 s00_axi_arvalid port component_1 s00_axi_arready port component_1 s00_axi_rdata port component_1 s00_axi_rresp port component_1 s00_axi_rvalid port component_1 s00_axi_rready port component_1 s00_axi_aclk port component_1 s00_axi_aresetn
Vivado% llength [ipx::get_ports -of_objects $periph]
21
```

| Index | Property                       | Observed value |
|-------|--------------------------------|----------------|
|   0   | BUFFER_TYPE                    |  |
|   0   | CLASS                          | port |
|   0   | DESCRIPTION                    |  |
|   0   | DIRECTION                      | in |
|   0   | DISPLAY_NAME                   |  |
|   0   | DRIVER_VALUE                   |  |
|   0   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   0   | DRIVER_VALUE_DEPENDENCY        |  |
|   0   | DRIVER_VALUE_FORMAT            | long |
|   0   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   0   | ENABLEMENT_DEPENDENCY          |  |
|   0   | ENABLEMENT_PRESENCE            | optional |
|   0   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   0   | ENABLEMENT_VALUE               | 1 |
|   0   | ENDIANNESS                     | little |
|   0   | IS_VECTOR                      | 1 |
|   0   | LATENCY                        | 0 |
|   0   | NAME                           | s00_axi_awaddr |
|   0   | SAMPLE_RATE                    |  |
|   0   | SIZE_DESCRIPTION               | 0 : 0 |
|   0   | SIZE_LEFT                      | 0 |
|   0   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   0   | SIZE_LEFT_DEPENDENCY           | (spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH'))-1) |
|   0   | SIZE_LEFT_FORMAT_TYPE          | long |
|   0   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|   0   | SIZE_RIGHT                     | 0 |
|   0   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   0   | SIZE_RIGHT_DEPENDENCY          | 0 |
|   0   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   0   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|   0   | TYPE_DEFINITION                |  |
|   0   | TYPE_NAME                      | wire |
|   0   | VIEW_NAME_REFS                 |  |
|   1   | BUFFER_TYPE                    |  |
|   1   | CLASS                          | port |
|   1   | DESCRIPTION                    |  |
|   1   | DIRECTION                      | in |
|   1   | DISPLAY_NAME                   |  |
|   1   | DRIVER_VALUE                   |  |
|   1   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   1   | DRIVER_VALUE_DEPENDENCY        |  |
|   1   | DRIVER_VALUE_FORMAT            | long |
|   1   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   1   | ENABLEMENT_DEPENDENCY          |  |
|   1   | ENABLEMENT_PRESENCE            | optional |
|   1   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   1   | ENABLEMENT_VALUE               | 1 |
|   1   | ENDIANNESS                     | little |
|   1   | IS_VECTOR                      | 1 |
|   1   | LATENCY                        | 0 |
|   1   | NAME                           | s00_axi_awprot |
|   1   | SAMPLE_RATE                    |  |
|   1   | SIZE_DESCRIPTION               | 0 : 0 |
|   1   | SIZE_LEFT                      | 0 |
|   1   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   1   | SIZE_LEFT_DEPENDENCY           | 2 |
|   1   | SIZE_LEFT_FORMAT_TYPE          | long |
|   1   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|   1   | SIZE_RIGHT                     | 0 |
|   1   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   1   | SIZE_RIGHT_DEPENDENCY          | 0 |
|   1   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   1   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|   1   | TYPE_DEFINITION                |  |
|   1   | TYPE_NAME                      | wire |
|   1   | VIEW_NAME_REFS                 |  |
|   2   | BUFFER_TYPE                    |  |
|   2   | CLASS                          | port |
|   2   | DESCRIPTION                    |  |
|   2   | DIRECTION                      | in |
|   2   | DISPLAY_NAME                   |  |
|   2   | DRIVER_VALUE                   |  |
|   2   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   2   | DRIVER_VALUE_DEPENDENCY        |  |
|   2   | DRIVER_VALUE_FORMAT            | long |
|   2   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   2   | ENABLEMENT_DEPENDENCY          |  |
|   2   | ENABLEMENT_PRESENCE            | optional |
|   2   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   2   | ENABLEMENT_VALUE               | 1 |
|   2   | ENDIANNESS                     | little |
|   2   | IS_VECTOR                      | 0 |
|   2   | LATENCY                        | 0 |
|   2   | NAME                           | s00_axi_awvalid |
|   2   | SAMPLE_RATE                    |  |
|   2   | SIZE_DESCRIPTION               | 1 |
|   2   | SIZE_LEFT                      | 0 |
|   2   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   2   | SIZE_LEFT_DEPENDENCY           |  |
|   2   | SIZE_LEFT_FORMAT_TYPE          | long |
|   2   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|   2   | SIZE_RIGHT                     | 0 |
|   2   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   2   | SIZE_RIGHT_DEPENDENCY          |  |
|   2   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   2   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|   2   | TYPE_DEFINITION                |  |
|   2   | TYPE_NAME                      | wire |
|   2   | VIEW_NAME_REFS                 |  |
|   3   | BUFFER_TYPE                    |  |
|   3   | CLASS                          | port |
|   3   | DESCRIPTION                    |  |
|   3   | DIRECTION                      | out |
|   3   | DISPLAY_NAME                   |  |
|   3   | DRIVER_VALUE                   |  |
|   3   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   3   | DRIVER_VALUE_DEPENDENCY        |  |
|   3   | DRIVER_VALUE_FORMAT            | long |
|   3   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   3   | ENABLEMENT_DEPENDENCY          |  |
|   3   | ENABLEMENT_PRESENCE            | optional |
|   3   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   3   | ENABLEMENT_VALUE               | 1 |
|   3   | ENDIANNESS                     | little |
|   3   | IS_VECTOR                      | 0 |
|   3   | LATENCY                        | 0 |
|   3   | NAME                           | s00_axi_awready |
|   3   | SAMPLE_RATE                    |  |
|   3   | SIZE_DESCRIPTION               | 1 |
|   3   | SIZE_LEFT                      | 0 |
|   3   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   3   | SIZE_LEFT_DEPENDENCY           |  |
|   3   | SIZE_LEFT_FORMAT_TYPE          | long |
|   3   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|   3   | SIZE_RIGHT                     | 0 |
|   3   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   3   | SIZE_RIGHT_DEPENDENCY          |  |
|   3   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   3   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|   3   | TYPE_DEFINITION                |  |
|   3   | TYPE_NAME                      | wire |
|   3   | VIEW_NAME_REFS                 |  |
|   4   | BUFFER_TYPE                    |  |
|   4   | CLASS                          | port |
|   4   | DESCRIPTION                    |  |
|   4   | DIRECTION                      | in |
|   4   | DISPLAY_NAME                   |  |
|   4   | DRIVER_VALUE                   |  |
|   4   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   4   | DRIVER_VALUE_DEPENDENCY        |  |
|   4   | DRIVER_VALUE_FORMAT            | long |
|   4   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   4   | ENABLEMENT_DEPENDENCY          |  |
|   4   | ENABLEMENT_PRESENCE            | optional |
|   4   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   4   | ENABLEMENT_VALUE               | 1 |
|   4   | ENDIANNESS                     | little |
|   4   | IS_VECTOR                      | 1 |
|   4   | LATENCY                        | 0 |
|   4   | NAME                           | s00_axi_wdata |
|   4   | SAMPLE_RATE                    |  |
|   4   | SIZE_DESCRIPTION               | 0 : 0 |
|   4   | SIZE_LEFT                      | 0 |
|   4   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   4   | SIZE_LEFT_DEPENDENCY           | (spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH'))-1) |
|   4   | SIZE_LEFT_FORMAT_TYPE          | long |
|   4   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|   4   | SIZE_RIGHT                     | 0 |
|   4   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   4   | SIZE_RIGHT_DEPENDENCY          | 0 |
|   4   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   4   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|   4   | TYPE_DEFINITION                |  |
|   4   | TYPE_NAME                      | wire |
|   4   | VIEW_NAME_REFS                 |  |
|   5   | BUFFER_TYPE                    |  |
|   5   | CLASS                          | port |
|   5   | DESCRIPTION                    |  |
|   5   | DIRECTION                      | in |
|   5   | DISPLAY_NAME                   |  |
|   5   | DRIVER_VALUE                   |  |
|   5   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   5   | DRIVER_VALUE_DEPENDENCY        |  |
|   5   | DRIVER_VALUE_FORMAT            | long |
|   5   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   5   | ENABLEMENT_DEPENDENCY          |  |
|   5   | ENABLEMENT_PRESENCE            | optional |
|   5   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   5   | ENABLEMENT_VALUE               | 1 |
|   5   | ENDIANNESS                     | little |
|   5   | IS_VECTOR                      | 1 |
|   5   | LATENCY                        | 0 |
|   5   | NAME                           | s00_axi_wstrb |
|   5   | SAMPLE_RATE                    |  |
|   5   | SIZE_DESCRIPTION               | 0 : 0 |
|   5   | SIZE_LEFT                      | 0 |
|   5   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   5   | SIZE_LEFT_DEPENDENCY           | ((spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH'))/8)-1) |
|   5   | SIZE_LEFT_FORMAT_TYPE          | long |
|   5   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|   5   | SIZE_RIGHT                     | 0 |
|   5   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   5   | SIZE_RIGHT_DEPENDENCY          | 0 |
|   5   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   5   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|   5   | TYPE_DEFINITION                |  |
|   5   | TYPE_NAME                      | wire |
|   5   | VIEW_NAME_REFS                 |  |
|   6   | BUFFER_TYPE                    |  |
|   6   | CLASS                          | port |
|   6   | DESCRIPTION                    |  |
|   6   | DIRECTION                      | in |
|   6   | DISPLAY_NAME                   |  |
|   6   | DRIVER_VALUE                   |  |
|   6   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   6   | DRIVER_VALUE_DEPENDENCY        |  |
|   6   | DRIVER_VALUE_FORMAT            | long |
|   6   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   6   | ENABLEMENT_DEPENDENCY          |  |
|   6   | ENABLEMENT_PRESENCE            | optional |
|   6   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   6   | ENABLEMENT_VALUE               | 1 |
|   6   | ENDIANNESS                     | little |
|   6   | IS_VECTOR                      | 0 |
|   6   | LATENCY                        | 0 |
|   6   | NAME                           | s00_axi_wvalid |
|   6   | SAMPLE_RATE                    |  |
|   6   | SIZE_DESCRIPTION               | 1 |
|   6   | SIZE_LEFT                      | 0 |
|   6   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   6   | SIZE_LEFT_DEPENDENCY           |  |
|   6   | SIZE_LEFT_FORMAT_TYPE          | long |
|   6   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|   6   | SIZE_RIGHT                     | 0 |
|   6   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   6   | SIZE_RIGHT_DEPENDENCY          |  |
|   6   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   6   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|   6   | TYPE_DEFINITION                |  |
|   6   | TYPE_NAME                      | wire |
|   6   | VIEW_NAME_REFS                 |  |
|   7   | BUFFER_TYPE                    |  |
|   7   | CLASS                          | port |
|   7   | DESCRIPTION                    |  |
|   7   | DIRECTION                      | out |
|   7   | DISPLAY_NAME                   |  |
|   7   | DRIVER_VALUE                   |  |
|   7   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   7   | DRIVER_VALUE_DEPENDENCY        |  |
|   7   | DRIVER_VALUE_FORMAT            | long |
|   7   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   7   | ENABLEMENT_DEPENDENCY          |  |
|   7   | ENABLEMENT_PRESENCE            | optional |
|   7   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   7   | ENABLEMENT_VALUE               | 1 |
|   7   | ENDIANNESS                     | little |
|   7   | IS_VECTOR                      | 0 |
|   7   | LATENCY                        | 0 |
|   7   | NAME                           | s00_axi_wready |
|   7   | SAMPLE_RATE                    |  |
|   7   | SIZE_DESCRIPTION               | 1 |
|   7   | SIZE_LEFT                      | 0 |
|   7   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   7   | SIZE_LEFT_DEPENDENCY           |  |
|   7   | SIZE_LEFT_FORMAT_TYPE          | long |
|   7   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|   7   | SIZE_RIGHT                     | 0 |
|   7   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   7   | SIZE_RIGHT_DEPENDENCY          |  |
|   7   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   7   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|   7   | TYPE_DEFINITION                |  |
|   7   | TYPE_NAME                      | wire |
|   7   | VIEW_NAME_REFS                 |  |
|   8   | BUFFER_TYPE                    |  |
|   8   | CLASS                          | port |
|   8   | DESCRIPTION                    |  |
|   8   | DIRECTION                      | out |
|   8   | DISPLAY_NAME                   |  |
|   8   | DRIVER_VALUE                   |  |
|   8   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   8   | DRIVER_VALUE_DEPENDENCY        |  |
|   8   | DRIVER_VALUE_FORMAT            | long |
|   8   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   8   | ENABLEMENT_DEPENDENCY          |  |
|   8   | ENABLEMENT_PRESENCE            | optional |
|   8   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   8   | ENABLEMENT_VALUE               | 1 |
|   8   | ENDIANNESS                     | little |
|   8   | IS_VECTOR                      | 1 |
|   8   | LATENCY                        | 0 |
|   8   | NAME                           | s00_axi_bresp |
|   8   | SAMPLE_RATE                    |  |
|   8   | SIZE_DESCRIPTION               | 0 : 0 |
|   8   | SIZE_LEFT                      | 0 |
|   8   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   8   | SIZE_LEFT_DEPENDENCY           | 1 |
|   8   | SIZE_LEFT_FORMAT_TYPE          | long |
|   8   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|   8   | SIZE_RIGHT                     | 0 |
|   8   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   8   | SIZE_RIGHT_DEPENDENCY          | 0 |
|   8   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   8   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|   8   | TYPE_DEFINITION                |  |
|   8   | TYPE_NAME                      | wire |
|   8   | VIEW_NAME_REFS                 |  |
|   9   | BUFFER_TYPE                    |  |
|   9   | CLASS                          | port |
|   9   | DESCRIPTION                    |  |
|   9   | DIRECTION                      | out |
|   9   | DISPLAY_NAME                   |  |
|   9   | DRIVER_VALUE                   |  |
|   9   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|   9   | DRIVER_VALUE_DEPENDENCY        |  |
|   9   | DRIVER_VALUE_FORMAT            | long |
|   9   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|   9   | ENABLEMENT_DEPENDENCY          |  |
|   9   | ENABLEMENT_PRESENCE            | optional |
|   9   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   9   | ENABLEMENT_VALUE               | 1 |
|   9   | ENDIANNESS                     | little |
|   9   | IS_VECTOR                      | 0 |
|   9   | LATENCY                        | 0 |
|   9   | NAME                           | s00_axi_bvalid |
|   9   | SAMPLE_RATE                    |  |
|   9   | SIZE_DESCRIPTION               | 1 |
|   9   | SIZE_LEFT                      | 0 |
|   9   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|   9   | SIZE_LEFT_DEPENDENCY           |  |
|   9   | SIZE_LEFT_FORMAT_TYPE          | long |
|   9   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|   9   | SIZE_RIGHT                     | 0 |
|   9   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|   9   | SIZE_RIGHT_DEPENDENCY          |  |
|   9   | SIZE_RIGHT_FORMAT_TYPE         | long |
|   9   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|   9   | TYPE_DEFINITION                |  |
|   9   | TYPE_NAME                      | wire |
|   9   | VIEW_NAME_REFS                 |  |
|  10   | BUFFER_TYPE                    |  |
|  10   | CLASS                          | port |
|  10   | DESCRIPTION                    |  |
|  10   | DIRECTION                      | in |
|  10   | DISPLAY_NAME                   |  |
|  10   | DRIVER_VALUE                   |  |
|  10   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  10   | DRIVER_VALUE_DEPENDENCY        |  |
|  10   | DRIVER_VALUE_FORMAT            | long |
|  10   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  10   | ENABLEMENT_DEPENDENCY          |  |
|  10   | ENABLEMENT_PRESENCE            | optional |
|  10   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  10   | ENABLEMENT_VALUE               | 1 |
|  10   | ENDIANNESS                     | little |
|  10   | IS_VECTOR                      | 0 |
|  10   | LATENCY                        | 0 |
|  10   | NAME                           | s00_axi_bready |
|  10   | SAMPLE_RATE                    |  |
|  10   | SIZE_DESCRIPTION               | 1 |
|  10   | SIZE_LEFT                      | 0 |
|  10   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  10   | SIZE_LEFT_DEPENDENCY           |  |
|  10   | SIZE_LEFT_FORMAT_TYPE          | long |
|  10   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|  10   | SIZE_RIGHT                     | 0 |
|  10   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  10   | SIZE_RIGHT_DEPENDENCY          |  |
|  10   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  10   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|  10   | TYPE_DEFINITION                |  |
|  10   | TYPE_NAME                      | wire |
|  10   | VIEW_NAME_REFS                 |  |
|  11   | BUFFER_TYPE                    |  |
|  11   | CLASS                          | port |
|  11   | DESCRIPTION                    |  |
|  11   | DIRECTION                      | in |
|  11   | DISPLAY_NAME                   |  |
|  11   | DRIVER_VALUE                   |  |
|  11   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  11   | DRIVER_VALUE_DEPENDENCY        |  |
|  11   | DRIVER_VALUE_FORMAT            | long |
|  11   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  11   | ENABLEMENT_DEPENDENCY          |  |
|  11   | ENABLEMENT_PRESENCE            | optional |
|  11   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  11   | ENABLEMENT_VALUE               | 1 |
|  11   | ENDIANNESS                     | little |
|  11   | IS_VECTOR                      | 1 |
|  11   | LATENCY                        | 0 |
|  11   | NAME                           | s00_axi_araddr |
|  11   | SAMPLE_RATE                    |  |
|  11   | SIZE_DESCRIPTION               | 0 : 0 |
|  11   | SIZE_LEFT                      | 0 |
|  11   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  11   | SIZE_LEFT_DEPENDENCY           | (spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH'))-1) |
|  11   | SIZE_LEFT_FORMAT_TYPE          | long |
|  11   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|  11   | SIZE_RIGHT                     | 0 |
|  11   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  11   | SIZE_RIGHT_DEPENDENCY          | 0 |
|  11   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  11   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|  11   | TYPE_DEFINITION                |  |
|  11   | TYPE_NAME                      | wire |
|  11   | VIEW_NAME_REFS                 |  |
|  12   | BUFFER_TYPE                    |  |
|  12   | CLASS                          | port |
|  12   | DESCRIPTION                    |  |
|  12   | DIRECTION                      | in |
|  12   | DISPLAY_NAME                   |  |
|  12   | DRIVER_VALUE                   |  |
|  12   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  12   | DRIVER_VALUE_DEPENDENCY        |  |
|  12   | DRIVER_VALUE_FORMAT            | long |
|  12   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  12   | ENABLEMENT_DEPENDENCY          |  |
|  12   | ENABLEMENT_PRESENCE            | optional |
|  12   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  12   | ENABLEMENT_VALUE               | 1 |
|  12   | ENDIANNESS                     | little |
|  12   | IS_VECTOR                      | 1 |
|  12   | LATENCY                        | 0 |
|  12   | NAME                           | s00_axi_arprot |
|  12   | SAMPLE_RATE                    |  |
|  12   | SIZE_DESCRIPTION               | 0 : 0 |
|  12   | SIZE_LEFT                      | 0 |
|  12   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  12   | SIZE_LEFT_DEPENDENCY           | 2 |
|  12   | SIZE_LEFT_FORMAT_TYPE          | long |
|  12   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|  12   | SIZE_RIGHT                     | 0 |
|  12   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  12   | SIZE_RIGHT_DEPENDENCY          | 0 |
|  12   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  12   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|  12   | TYPE_DEFINITION                |  |
|  12   | TYPE_NAME                      | wire |
|  12   | VIEW_NAME_REFS                 |  |
|  13   | BUFFER_TYPE                    |  |
|  13   | CLASS                          | port |
|  13   | DESCRIPTION                    |  |
|  13   | DIRECTION                      | in |
|  13   | DISPLAY_NAME                   |  |
|  13   | DRIVER_VALUE                   |  |
|  13   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  13   | DRIVER_VALUE_DEPENDENCY        |  |
|  13   | DRIVER_VALUE_FORMAT            | long |
|  13   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  13   | ENABLEMENT_DEPENDENCY          |  |
|  13   | ENABLEMENT_PRESENCE            | optional |
|  13   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  13   | ENABLEMENT_VALUE               | 1 |
|  13   | ENDIANNESS                     | little |
|  13   | IS_VECTOR                      | 0 |
|  13   | LATENCY                        | 0 |
|  13   | NAME                           | s00_axi_arvalid |
|  13   | SAMPLE_RATE                    |  |
|  13   | SIZE_DESCRIPTION               | 1 |
|  13   | SIZE_LEFT                      | 0 |
|  13   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  13   | SIZE_LEFT_DEPENDENCY           |  |
|  13   | SIZE_LEFT_FORMAT_TYPE          | long |
|  13   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|  13   | SIZE_RIGHT                     | 0 |
|  13   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  13   | SIZE_RIGHT_DEPENDENCY          |  |
|  13   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  13   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|  13   | TYPE_DEFINITION                |  |
|  13   | TYPE_NAME                      | wire |
|  13   | VIEW_NAME_REFS                 |  |
|  14   | BUFFER_TYPE                    |  |
|  14   | CLASS                          | port |
|  14   | DESCRIPTION                    |  |
|  14   | DIRECTION                      | out |
|  14   | DISPLAY_NAME                   |  |
|  14   | DRIVER_VALUE                   |  |
|  14   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  14   | DRIVER_VALUE_DEPENDENCY        |  |
|  14   | DRIVER_VALUE_FORMAT            | long |
|  14   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  14   | ENABLEMENT_DEPENDENCY          |  |
|  14   | ENABLEMENT_PRESENCE            | optional |
|  14   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  14   | ENABLEMENT_VALUE               | 1 |
|  14   | ENDIANNESS                     | little |
|  14   | IS_VECTOR                      | 0 |
|  14   | LATENCY                        | 0 |
|  14   | NAME                           | s00_axi_arready |
|  14   | SAMPLE_RATE                    |  |
|  14   | SIZE_DESCRIPTION               | 1 |
|  14   | SIZE_LEFT                      | 0 |
|  14   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  14   | SIZE_LEFT_DEPENDENCY           |  |
|  14   | SIZE_LEFT_FORMAT_TYPE          | long |
|  14   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|  14   | SIZE_RIGHT                     | 0 |
|  14   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  14   | SIZE_RIGHT_DEPENDENCY          |  |
|  14   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  14   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|  14   | TYPE_DEFINITION                |  |
|  14   | TYPE_NAME                      | wire |
|  14   | VIEW_NAME_REFS                 |  |
|  15   | BUFFER_TYPE                    |  |
|  15   | CLASS                          | port |
|  15   | DESCRIPTION                    |  |
|  15   | DIRECTION                      | out |
|  15   | DISPLAY_NAME                   |  |
|  15   | DRIVER_VALUE                   |  |
|  15   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  15   | DRIVER_VALUE_DEPENDENCY        |  |
|  15   | DRIVER_VALUE_FORMAT            | long |
|  15   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  15   | ENABLEMENT_DEPENDENCY          |  |
|  15   | ENABLEMENT_PRESENCE            | optional |
|  15   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  15   | ENABLEMENT_VALUE               | 1 |
|  15   | ENDIANNESS                     | little |
|  15   | IS_VECTOR                      | 1 |
|  15   | LATENCY                        | 0 |
|  15   | NAME                           | s00_axi_rdata |
|  15   | SAMPLE_RATE                    |  |
|  15   | SIZE_DESCRIPTION               | 0 : 0 |
|  15   | SIZE_LEFT                      | 0 |
|  15   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  15   | SIZE_LEFT_DEPENDENCY           | (spirit:decode(id('MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH'))-1) |
|  15   | SIZE_LEFT_FORMAT_TYPE          | long |
|  15   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|  15   | SIZE_RIGHT                     | 0 |
|  15   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  15   | SIZE_RIGHT_DEPENDENCY          | 0 |
|  15   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  15   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|  15   | TYPE_DEFINITION                |  |
|  15   | TYPE_NAME                      | wire |
|  15   | VIEW_NAME_REFS                 |  |
|  16   | BUFFER_TYPE                    |  |
|  16   | CLASS                          | port |
|  16   | DESCRIPTION                    |  |
|  16   | DIRECTION                      | out |
|  16   | DISPLAY_NAME                   |  |
|  16   | DRIVER_VALUE                   |  |
|  16   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  16   | DRIVER_VALUE_DEPENDENCY        |  |
|  16   | DRIVER_VALUE_FORMAT            | long |
|  16   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  16   | ENABLEMENT_DEPENDENCY          |  |
|  16   | ENABLEMENT_PRESENCE            | optional |
|  16   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  16   | ENABLEMENT_VALUE               | 1 |
|  16   | ENDIANNESS                     | little |
|  16   | IS_VECTOR                      | 1 |
|  16   | LATENCY                        | 0 |
|  16   | NAME                           | s00_axi_rresp |
|  16   | SAMPLE_RATE                    |  |
|  16   | SIZE_DESCRIPTION               | 0 : 0 |
|  16   | SIZE_LEFT                      | 0 |
|  16   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  16   | SIZE_LEFT_DEPENDENCY           | 1 |
|  16   | SIZE_LEFT_FORMAT_TYPE          | long |
|  16   | SIZE_LEFT_RESOLVE_TYPE         | dependent |
|  16   | SIZE_RIGHT                     | 0 |
|  16   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  16   | SIZE_RIGHT_DEPENDENCY          | 0 |
|  16   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  16   | SIZE_RIGHT_RESOLVE_TYPE        | dependent |
|  16   | TYPE_DEFINITION                |  |
|  16   | TYPE_NAME                      | wire |
|  16   | VIEW_NAME_REFS                 |  |
|  17   | BUFFER_TYPE                    |  |
|  17   | CLASS                          | port |
|  17   | DESCRIPTION                    |  |
|  17   | DIRECTION                      | out |
|  17   | DISPLAY_NAME                   |  |
|  17   | DRIVER_VALUE                   |  |
|  17   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  17   | DRIVER_VALUE_DEPENDENCY        |  |
|  17   | DRIVER_VALUE_FORMAT            | long |
|  17   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  17   | ENABLEMENT_DEPENDENCY          |  |
|  17   | ENABLEMENT_PRESENCE            | optional |
|  17   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  17   | ENABLEMENT_VALUE               | 1 |
|  17   | ENDIANNESS                     | little |
|  17   | IS_VECTOR                      | 0 |
|  17   | LATENCY                        | 0 |
|  17   | NAME                           | s00_axi_rvalid |
|  17   | SAMPLE_RATE                    |  |
|  17   | SIZE_DESCRIPTION               | 1 |
|  17   | SIZE_LEFT                      | 0 |
|  17   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  17   | SIZE_LEFT_DEPENDENCY           |  |
|  17   | SIZE_LEFT_FORMAT_TYPE          | long |
|  17   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|  17   | SIZE_RIGHT                     | 0 |
|  17   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  17   | SIZE_RIGHT_DEPENDENCY          |  |
|  17   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  17   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|  17   | TYPE_DEFINITION                |  |
|  17   | TYPE_NAME                      | wire |
|  17   | VIEW_NAME_REFS                 |  |
|  18   | BUFFER_TYPE                    |  |
|  18   | CLASS                          | port |
|  18   | DESCRIPTION                    |  |
|  18   | DIRECTION                      | in |
|  18   | DISPLAY_NAME                   |  |
|  18   | DRIVER_VALUE                   |  |
|  18   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  18   | DRIVER_VALUE_DEPENDENCY        |  |
|  18   | DRIVER_VALUE_FORMAT            | long |
|  18   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  18   | ENABLEMENT_DEPENDENCY          |  |
|  18   | ENABLEMENT_PRESENCE            | optional |
|  18   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  18   | ENABLEMENT_VALUE               | 1 |
|  18   | ENDIANNESS                     | little |
|  18   | IS_VECTOR                      | 0 |
|  18   | LATENCY                        | 0 |
|  18   | NAME                           | s00_axi_rready |
|  18   | SAMPLE_RATE                    |  |
|  18   | SIZE_DESCRIPTION               | 1 |
|  18   | SIZE_LEFT                      | 0 |
|  18   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  18   | SIZE_LEFT_DEPENDENCY           |  |
|  18   | SIZE_LEFT_FORMAT_TYPE          | long |
|  18   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|  18   | SIZE_RIGHT                     | 0 |
|  18   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  18   | SIZE_RIGHT_DEPENDENCY          |  |
|  18   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  18   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|  18   | TYPE_DEFINITION                |  |
|  18   | TYPE_NAME                      | wire |
|  18   | VIEW_NAME_REFS                 |  |
|  19   | BUFFER_TYPE                    |  |
|  19   | CLASS                          | port |
|  19   | DESCRIPTION                    |  |
|  19   | DIRECTION                      | in |
|  19   | DISPLAY_NAME                   |  |
|  19   | DRIVER_VALUE                   |  |
|  19   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  19   | DRIVER_VALUE_DEPENDENCY        |  |
|  19   | DRIVER_VALUE_FORMAT            | long |
|  19   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  19   | ENABLEMENT_DEPENDENCY          |  |
|  19   | ENABLEMENT_PRESENCE            | optional |
|  19   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  19   | ENABLEMENT_VALUE               | 1 |
|  19   | ENDIANNESS                     | little |
|  19   | IS_VECTOR                      | 0 |
|  19   | LATENCY                        | 0 |
|  19   | NAME                           | s00_axi_aclk |
|  19   | SAMPLE_RATE                    |  |
|  19   | SIZE_DESCRIPTION               | 1 |
|  19   | SIZE_LEFT                      | 0 |
|  19   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  19   | SIZE_LEFT_DEPENDENCY           |  |
|  19   | SIZE_LEFT_FORMAT_TYPE          | long |
|  19   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|  19   | SIZE_RIGHT                     | 0 |
|  19   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  19   | SIZE_RIGHT_DEPENDENCY          |  |
|  19   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  19   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|  19   | TYPE_DEFINITION                |  |
|  19   | TYPE_NAME                      | wire |
|  19   | VIEW_NAME_REFS                 |  |
|  20   | BUFFER_TYPE                    |  |
|  20   | CLASS                          | port |
|  20   | DESCRIPTION                    |  |
|  20   | DIRECTION                      | in |
|  20   | DISPLAY_NAME                   |  |
|  20   | DRIVER_VALUE                   |  |
|  20   | DRIVER_VALUE_BIT_STRING_LENGTH |  |
|  20   | DRIVER_VALUE_DEPENDENCY        |  |
|  20   | DRIVER_VALUE_FORMAT            | long |
|  20   | DRIVER_VALUE_RESOLVE_TYPE      | immediate |
|  20   | ENABLEMENT_DEPENDENCY          |  |
|  20   | ENABLEMENT_PRESENCE            | optional |
|  20   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|  20   | ENABLEMENT_VALUE               | 1 |
|  20   | ENDIANNESS                     | little |
|  20   | IS_VECTOR                      | 0 |
|  20   | LATENCY                        | 0 |
|  20   | NAME                           | s00_axi_aresetn |
|  20   | SAMPLE_RATE                    |  |
|  20   | SIZE_DESCRIPTION               | 1 |
|  20   | SIZE_LEFT                      | 0 |
|  20   | SIZE_LEFT_BIT_STRING_LENGTH    |  |
|  20   | SIZE_LEFT_DEPENDENCY           |  |
|  20   | SIZE_LEFT_FORMAT_TYPE          | long |
|  20   | SIZE_LEFT_RESOLVE_TYPE         | immediate |
|  20   | SIZE_RIGHT                     | 0 |
|  20   | SIZE_RIGHT_BIT_STRING_LENGTH   |  |
|  20   | SIZE_RIGHT_DEPENDENCY          |  |
|  20   | SIZE_RIGHT_FORMAT_TYPE         | long |
|  20   | SIZE_RIGHT_RESOLVE_TYPE        | immediate |
|  20   | TYPE_DEFINITION                |  |
|  20   | TYPE_NAME                      | wire |
|  20   | VIEW_NAME_REFS                 |  |
