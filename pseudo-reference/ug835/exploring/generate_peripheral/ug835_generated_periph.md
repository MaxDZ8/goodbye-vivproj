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

[Properties of the `$periph` object itself](./props_of_minimal_periph.md), which is the *component* we want to pack.

The component features additional content which is to be pulled by the appropriate `get_` command.

# Files in their groups
A picture is better than a thousand words so let's check out the thing graphically, as it would appear in the IP packager:
![Files and groups, as hierarchy](./minimal-ippack2-file-groups_hier.png)

Let's examine the result of `ipx::get_file_groups -of_objects $periph`. [It is a list](./file_groups.md) of 4 `file_group` objects.

A bit of trivia but for the sake of completeness, [here are the various files](./props_of_files.md). Oddly enough, even though `ipx::get_files -help` says `-of_objects` can pull files from the component, it seems files can exist in file groups only. The help message is a bit funny so I have to take a bit more effort pull them out.

# Customization parameters
Be careful with this one. It looks  like the customization panel pulls parameters from all the possible sources. There's more than just HDL parameters, which are most likely those you define for the Verilog `module`.

There are two HDL parameters which are those used by the "glue" AXI interface to define address and data width.

| Index | Property                       | Observed value |
|-------|--------------------------------|----------------|
|   0   | CLASS                          | hdl_parameter |
|   0   | CONFIG_GROUPS                  |  |
|   0   | DATA_TYPE                      | integer |
|   0   | DESCRIPTION                    | Width of S_AXI data bus |
|   0   | DISPLAY_NAME                   | C S00 AXI DATA WIDTH |
|   0   | ENABLEMENT_DEPENDENCY          |  |
|   0   | ENABLEMENT_PRESENCE            | optional |
|   0   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   0   | ENABLEMENT_TCL_EXPR            |  |
|   0   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   0   | ENABLEMENT_VALUE               | 1 |
|   0   | IPXACT_ID                      | MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH |
|   0   | NAME                           | C_S00_AXI_DATA_WIDTH |
|   0   | ORDER                          | 3.000 |
|   0   | PARAMETER_TYPES                |  |
|   0   | USAGE                          | all |
|   0   | VALUE                          | 32 |
|   0   | VALUE_BIT_STRING_LENGTH        | 0 |
|   0   | VALUE_DEPENDENCY               |  |
|   0   | VALUE_FORMAT                   | long |
|   0   | VALUE_RESOLVE_TYPE             | generated |
|   0   | VALUE_SOURCE                   | default |
|   0   | VALUE_TCL_EXPR                 |  |
|   0   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   0   | VALUE_VALIDATION_LIST          |  |
|   0   | VALUE_VALIDATION_PAIRS         |  |
|   0   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   0   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   0   | VALUE_VALIDATION_TYPE          | range_long |
|   1   | CLASS                          | hdl_parameter |
|   1   | CONFIG_GROUPS                  |  |
|   1   | DATA_TYPE                      | integer |
|   1   | DESCRIPTION                    | Width of S_AXI address bus |
|   1   | DISPLAY_NAME                   | C S00 AXI ADDR WIDTH |
|   1   | ENABLEMENT_DEPENDENCY          |  |
|   1   | ENABLEMENT_PRESENCE            | optional |
|   1   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   1   | ENABLEMENT_TCL_EXPR            |  |
|   1   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   1   | ENABLEMENT_VALUE               | 1 |
|   1   | IPXACT_ID                      | MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH |
|   1   | NAME                           | C_S00_AXI_ADDR_WIDTH |
|   1   | ORDER                          | 4.000 |
|   1   | PARAMETER_TYPES                |  |
|   1   | USAGE                          | all |
|   1   | VALUE                          | 4 |
|   1   | VALUE_BIT_STRING_LENGTH        | 0 |
|   1   | VALUE_DEPENDENCY               |  |
|   1   | VALUE_FORMAT                   | long |
|   1   | VALUE_RESOLVE_TYPE             | generated |
|   1   | VALUE_SOURCE                   | default |
|   1   | VALUE_TCL_EXPR                 |  |
|   1   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   1   | VALUE_VALIDATION_LIST          |  |
|   1   | VALUE_VALIDATION_PAIRS         |  |
|   1   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   1   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   1   | VALUE_VALIDATION_TYPE          | range_long |


# Ports and interfaces
This one is fairly complicated.
![Ports and interfaces as visualized by the packager](./minimal-ippack4-bus-interfaces.png)

Since you can define i/o *ports* (i.e. pins, bus) outside a bus interface (bunch of correlated pins/busses), ports are allowed to exist by themselves. Ports are then put into a *bus interface* using a *port map*.

In the minimal generation we're examining, there are 21 ports. It's quite a dump of data so I've opted to put them into [their own file](./minimally_generated_periph_ports.md).

Let's look at the containers:
```
set busses [ipx::get_bus_interfaces -of_objects $periph]
# --> bus_interface component_1 S00_AXI bus_interface component_1 S00_AXI_RST bus_interface component_1 S00_AXI_CLK
```

| Index | Property                              | Observed value                     |
|-------|---------------------------------------|------------------------------------|
|   0   | ABSTRACTION_TYPE_LIBRARY              | interface |
|   0   | ABSTRACTION_TYPE_NAME                 | aximm_rtl |
|   0   | ABSTRACTION_TYPE_VENDOR               | xilinx<span>.com</span> |
|   0   | ABSTRACTION_TYPE_VERSION              | 1.0 |
|   0   | ABSTRACTION_TYPE_VLNV                 | xilinx<span>.com</span>:interface:aximm_rtl:1.0 |
|   0   | BUS_TYPE_LIBRARY                      | interface |
|   0   | BUS_TYPE_NAME                         | aximm |
|   0   | BUS_TYPE_VENDOR                       | xilinx<span>.com</span> |
|   0   | BUS_TYPE_VERSION                      | 1.0 |
|   0   | BUS_TYPE_VLNV                         | xilinx<span>.com</span>:interface:aximm:1.0 |
|   0   | CLASS                                 | bus_interface |
|   0   | CONNECTION_REQUIRED                   | 0 |
|   0   | DESCRIPTION                           |  |
|   0   | DISPLAY_NAME                          |  |
|   0   | ENABLEMENT_DEPENDENCY                 |  |
|   0   | ENABLEMENT_PRESENCE                   | optional |
|   0   | ENABLEMENT_RESOLVE_TYPE               | immediate |
|   0   | ENABLEMENT_VALUE                      | 1 |
|   0   | ENDIANNESS                            | little |
|   0   | INTERFACE_MODE                        | slave |
|   0   | IS_DECLARATION                        | 0 |
|   0   | MASTER_ADDRESS_SPACE_REF              |  |
|   0   | MASTER_BASE_ADDRESS                   | 0 |
|   0   | MASTER_BASE_ADDRESS_BIT_STRING_LENGTH | 0 |
|   0   | MASTER_BASE_ADDRESS_DEPENDENCY        |  |
|   0   | MASTER_BASE_ADDRESS_FORMAT            | long |
|   0   | MASTER_BASE_ADDRESS_RESOLVE_TYPE      | immediate |
|   0   | MONITOR_GROUP                         |  |
|   0   | MONITOR_INTERFACE_MODE                | master |
|   0   | NAME                                  | S00_AXI |
|   0   | SLAVE_BRIDGES                         |  |
|   0   | SLAVE_MEMORY_MAP_REF                  | S00_AXI |
|   1   | ABSTRACTION_TYPE_LIBRARY              | signal |
|   1   | ABSTRACTION_TYPE_NAME                 | reset_rtl |
|   1   | ABSTRACTION_TYPE_VENDOR               | xilinx<span>.com</span> |
|   1   | ABSTRACTION_TYPE_VERSION              | 1.0 |
|   1   | ABSTRACTION_TYPE_VLNV                 | xilinx<span>.com</span>:signal:reset_rtl:1.0 |
|   1   | BUS_TYPE_LIBRARY                      | signal |
|   1   | BUS_TYPE_NAME                         | reset |
|   1   | BUS_TYPE_VENDOR                       | xilinx<span>.com</span> |
|   1   | BUS_TYPE_VERSION                      | 1.0 |
|   1   | BUS_TYPE_VLNV                         | xilinx<span>.com</span>:signal:reset:1.0 |
|   1   | CLASS                                 | bus_interface |
|   1   | CONNECTION_REQUIRED                   | 0 |
|   1   | DESCRIPTION                           |  |
|   1   | DISPLAY_NAME                          |  |
|   1   | ENABLEMENT_DEPENDENCY                 |  |
|   1   | ENABLEMENT_PRESENCE                   | optional |
|   1   | ENABLEMENT_RESOLVE_TYPE               | immediate |
|   1   | ENABLEMENT_VALUE                      | 1 |
|   1   | ENDIANNESS                            | little |
|   1   | INTERFACE_MODE                        | slave |
|   1   | IS_DECLARATION                        | 0 |
|   1   | MASTER_ADDRESS_SPACE_REF              |  |
|   1   | MASTER_BASE_ADDRESS                   | 0 |
|   1   | MASTER_BASE_ADDRESS_BIT_STRING_LENGTH | 0 |
|   1   | MASTER_BASE_ADDRESS_DEPENDENCY        |  |
|   1   | MASTER_BASE_ADDRESS_FORMAT            | long |
|   1   | MASTER_BASE_ADDRESS_RESOLVE_TYPE      | immediate |
|   1   | MONITOR_GROUP                         |  |
|   1   | MONITOR_INTERFACE_MODE                | master |
|   1   | NAME                                  | S00_AXI_RST |
|   1   | SLAVE_BRIDGES                         |  |
|   1   | SLAVE_MEMORY_MAP_REF                  |  |
|   2   | ABSTRACTION_TYPE_LIBRARY              | signal |
|   2   | ABSTRACTION_TYPE_NAME                 | clock_rtl |
|   2   | ABSTRACTION_TYPE_VENDOR               | xilinx<span>.com</span> |
|   2   | ABSTRACTION_TYPE_VERSION              | 1.0 |
|   2   | ABSTRACTION_TYPE_VLNV                 | xilinx<span>.com</span>:signal:clock_rtl:1.0 |
|   2   | BUS_TYPE_LIBRARY                      | signal |
|   2   | BUS_TYPE_NAME                         | clock |
|   2   | BUS_TYPE_VENDOR                       | xilinx<span>.com</span> |
|   2   | BUS_TYPE_VERSION                      | 1.0 |
|   2   | BUS_TYPE_VLNV                         | xilinx<span>.com</span>:signal:clock:1.0 |
|   2   | CLASS                                 | bus_interface |
|   2   | CONNECTION_REQUIRED                   | 0 |
|   2   | DESCRIPTION                           |  |
|   2   | DISPLAY_NAME                          |  |
|   2   | ENABLEMENT_DEPENDENCY                 |  |
|   2   | ENABLEMENT_PRESENCE                   | optional |
|   2   | ENABLEMENT_RESOLVE_TYPE               | immediate |
|   2   | ENABLEMENT_VALUE                      | 1 |
|   2   | ENDIANNESS                            | little |
|   2   | INTERFACE_MODE                        | slave |
|   2   | IS_DECLARATION                        | 0 |
|   2   | MASTER_ADDRESS_SPACE_REF              |  |
|   2   | MASTER_BASE_ADDRESS                   | 0 |
|   2   | MASTER_BASE_ADDRESS_BIT_STRING_LENGTH | 0 |
|   2   | MASTER_BASE_ADDRESS_DEPENDENCY        |  |
|   2   | MASTER_BASE_ADDRESS_FORMAT            | long |
|   2   | MASTER_BASE_ADDRESS_RESOLVE_TYPE      | immediate |
|   2   | MONITOR_GROUP                         |  |
|   2   | MONITOR_INTERFACE_MODE                | master |
|   2   | NAME                                  | S00_AXI_CLK |
|   2   | SLAVE_BRIDGES                         |  |
|   2   | SLAVE_MEMORY_MAP_REF                  |  |

Bus interfaces can have their own customization parameters.
Parameters for the `S00_AXI` bus interface.

| Index | Property                       | Observed value                          |
|-------|--------------------------------|-----------------------------------------|
|   0   | CLASS                          | bus_parameter |
|   0   | CONFIG_GROUPS                  |  |
|   0   | DESCRIPTION                    |  |
|   0   | DISPLAY_NAME                   |  |
|   0   | ENABLEMENT_DEPENDENCY          |  |
|   0   | ENABLEMENT_PRESENCE            | optional |
|   0   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   0   | ENABLEMENT_TCL_EXPR            |  |
|   0   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   0   | ENABLEMENT_VALUE               | 1 |
|   0   | IPXACT_ID                      | BUSIFPARAM_VALUE.S00_AXI.WIZ_DATA_WIDTH |
|   0   | NAME                           | WIZ_DATA_WIDTH |
|   0   | ORDER                          | 0.000 |
|   0   | PARAMETER_TYPES                |  |
|   0   | USAGE                          | all |
|   0   | VALUE                          | 32 |
|   0   | VALUE_BIT_STRING_LENGTH        | 0 |
|   0   | VALUE_DEPENDENCY               |  |
|   0   | VALUE_FORMAT                   | long |
|   0   | VALUE_RESOLVE_TYPE             | immediate |
|   0   | VALUE_SOURCE                   | default |
|   0   | VALUE_TCL_EXPR                 |  |
|   0   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   0   | VALUE_VALIDATION_LIST          | 32 |
|   0   | VALUE_VALIDATION_PAIRS         | 32 32 |
|   0   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   0   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   0   | VALUE_VALIDATION_TYPE          | list |
|   1   | CLASS                          | bus_parameter |
|   1   | CONFIG_GROUPS                  |  |
|   1   | DESCRIPTION                    |  |
|   1   | DISPLAY_NAME                   |  |
|   1   | ENABLEMENT_DEPENDENCY          |  |
|   1   | ENABLEMENT_PRESENCE            | optional |
|   1   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   1   | ENABLEMENT_TCL_EXPR            |  |
|   1   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   1   | ENABLEMENT_VALUE               | 1 |
|   1   | IPXACT_ID                      | BUSIFPARAM_VALUE.S00_AXI.WIZ_NUM_REG |
|   1   | NAME                           | WIZ_NUM_REG |
|   1   | ORDER                          | 0.000 |
|   1   | PARAMETER_TYPES                |  |
|   1   | USAGE                          | all |
|   1   | VALUE                          | 4 |
|   1   | VALUE_BIT_STRING_LENGTH        | 0 |
|   1   | VALUE_DEPENDENCY               |  |
|   1   | VALUE_FORMAT                   | long |
|   1   | VALUE_RESOLVE_TYPE             | immediate |
|   1   | VALUE_SOURCE                   | default |
|   1   | VALUE_TCL_EXPR                 |  |
|   1   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   1   | VALUE_VALIDATION_LIST          |  |
|   1   | VALUE_VALIDATION_PAIRS         |  |
|   1   | VALUE_VALIDATION_RANGE_MAXIMUM | 512 |
|   1   | VALUE_VALIDATION_RANGE_MINIMUM | 4 |
|   1   | VALUE_VALIDATION_TYPE          | range_long |
|   2   | CLASS                          | bus_parameter |
|   2   | CONFIG_GROUPS                  |  |
|   2   | DESCRIPTION                    |  |
|   2   | DISPLAY_NAME                   |  |
|   2   | ENABLEMENT_DEPENDENCY          |  |
|   2   | ENABLEMENT_PRESENCE            | optional |
|   2   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   2   | ENABLEMENT_TCL_EXPR            |  |
|   2   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   2   | ENABLEMENT_VALUE               | 1 |
|   2   | IPXACT_ID                      | BUSIFPARAM_VALUE.S00_AXI.SUPPORTS_NARROW_BURST |
|   2   | NAME                           | SUPPORTS_NARROW_BURST |
|   2   | ORDER                          | 0.000 |
|   2   | PARAMETER_TYPES                |  |
|   2   | USAGE                          | all |
|   2   | VALUE                          | 0 |
|   2   | VALUE_BIT_STRING_LENGTH        | 0 |
|   2   | VALUE_DEPENDENCY               |  |
|   2   | VALUE_FORMAT                   | long |
|   2   | VALUE_RESOLVE_TYPE             | immediate |
|   2   | VALUE_SOURCE                   | default |
|   2   | VALUE_TCL_EXPR                 |  |
|   2   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   2   | VALUE_VALIDATION_LIST          | true:1 false:0 |
|   2   | VALUE_VALIDATION_PAIRS         | true 1 false 0 |
|   2   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   2   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   2   | VALUE_VALIDATION_TYPE          | pairs |

The `S00_AXI_RST` bus interface contains a single parameter.

| Property                       | Observed value                          |
|--------------------------------|-----------------------------------------|
| CLASS                          | bus_parameter |
| CONFIG_GROUPS                  |  |
| DESCRIPTION                    |  |
| DISPLAY_NAME                   |  |
| ENABLEMENT_DEPENDENCY          |  |
| ENABLEMENT_PRESENCE            | optional |
| ENABLEMENT_RESOLVE_TYPE        | immediate |
| ENABLEMENT_TCL_EXPR            |  |
| ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
| ENABLEMENT_VALUE               | 1 |
| IPXACT_ID                      | BUSIFPARAM_VALUE.S00_AXI_RST.POLARITY |
| NAME                           | POLARITY |
| ORDER                          | 0.000 |
| PARAMETER_TYPES                |  |
| USAGE                          | all |
| VALUE                          | ACTIVE_LOW |
| VALUE_BIT_STRING_LENGTH        | 0 |
| VALUE_DEPENDENCY               |  |
| VALUE_FORMAT                   | string |
| VALUE_RESOLVE_TYPE             | immediate |
| VALUE_SOURCE                   | default |
| VALUE_TCL_EXPR                 |  |
| VALUE_TCL_EXPR_ARGUMENTS       |  |
| VALUE_VALIDATION_LIST          |  |
| VALUE_VALIDATION_PAIRS         |  |
| VALUE_VALIDATION_RANGE_MAXIMUM |  |
| VALUE_VALIDATION_RANGE_MINIMUM |  |
| VALUE_VALIDATION_TYPE          | none |

The `S00_AXI_CLK` bus interface contains two parameters.

| Index | Property                              | Observed value                     |
|-------|---------------------------------------|------------------------------------|
|   0   | CLASS                          | bus_parameter |
|   0   | CONFIG_GROUPS                  |  |
|   0   | DESCRIPTION                    | List of bus interface names separated by colons. For example, m_axis_a:s_axis_b:s_axis_c |
|   0   | DISPLAY_NAME                   |  |
|   0   | ENABLEMENT_DEPENDENCY          |  |
|   0   | ENABLEMENT_PRESENCE            | optional |
|   0   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   0   | ENABLEMENT_TCL_EXPR            |  |
|   0   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   0   | ENABLEMENT_VALUE               | 1 |
|   0   | IPXACT_ID                      | BUSIFPARAM_VALUE.S00_AXI_CLK.ASSOCIATED_BUSIF |
|   0   | NAME                           | ASSOCIATED_BUSIF |
|   0   | ORDER                          | 0.000 |
|   0   | PARAMETER_TYPES                |  |
|   0   | USAGE                          | all |
|   0   | VALUE                          | S00_AXI |
|   0   | VALUE_BIT_STRING_LENGTH        | 0 |
|   0   | VALUE_DEPENDENCY               |  |
|   0   | VALUE_FORMAT                   | string |
|   0   | VALUE_RESOLVE_TYPE             | immediate |
|   0   | VALUE_SOURCE                   | default |
|   0   | VALUE_TCL_EXPR                 |  |
|   0   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   0   | VALUE_VALIDATION_LIST          |  |
|   0   | VALUE_VALIDATION_PAIRS         |  |
|   0   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   0   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   0   | VALUE_VALIDATION_TYPE          | none |
|   1   | CLASS                          | bus_parameter |
|   1   | CONFIG_GROUPS                  |  |
|   1   | DESCRIPTION                    |  |
|   1   | DISPLAY_NAME                   |  |
|   1   | ENABLEMENT_DEPENDENCY          |  |
|   1   | ENABLEMENT_PRESENCE            | optional |
|   1   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   1   | ENABLEMENT_TCL_EXPR            |  |
|   1   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   1   | ENABLEMENT_VALUE               | 1 |
|   1   | IPXACT_ID                      | BUSIFPARAM_VALUE.S00_AXI_CLK.ASSOCIATED_RESET |
|   1   | NAME                           | ASSOCIATED_RESET |
|   1   | ORDER                          | 0.000 |
|   1   | PARAMETER_TYPES                |  |
|   1   | USAGE                          | all |
|   1   | VALUE                          | s00_axi_aresetn |
|   1   | VALUE_BIT_STRING_LENGTH        | 0 |
|   1   | VALUE_DEPENDENCY               |  |
|   1   | VALUE_FORMAT                   | string |
|   1   | VALUE_RESOLVE_TYPE             | immediate |
|   1   | VALUE_SOURCE                   | default |
|   1   | VALUE_TCL_EXPR                 |  |
|   1   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   1   | VALUE_VALIDATION_LIST          |  |
|   1   | VALUE_VALIDATION_PAIRS         |  |
|   1   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   1   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   1   | VALUE_VALIDATION_TYPE          | none |

Now we know about the containers, let's put the contents inside but in [their own file](./minimally_generated_periph_port_maps.md).

# Addressing and memory
This one is so weird the graphics don't quite work. The bottom line is a device has at least a memory map. Each memory map contains one or more address blocks and each address block can have its parameters.
![Memory addressing, visualized](./minimal-ippack5-addressing-and-memory.png)

Just for clarity, `get_memory_map_props [ipx::get_memory_maps -of_objects $periph]` evaluates to a single memory map.
| Property                | Observed value |
|-------------------------|----------------|
| CLASS                   | memory_map |
| DESCRIPTION             |  |
| DISPLAY_NAME            |  |
| ENABLEMENT_DEPENDENCY   |  |
| ENABLEMENT_PRESENCE     | optional |
| ENABLEMENT_RESOLVE_TYPE | immediate |
| ENABLEMENT_VALUE        | 1 |
| NAME                    | S00_AXI |

It is built of a single address block.
| Property                       | Observed value |
|--------------------------------|----------------|
| ACCESS                         |   |
| BASE_ADDRESS                   | 0 |
| BASE_ADDRESS_BIT_STRING_LENGTH | 0 |
| BASE_ADDRESS_DEPENDENCY        |   |
| BASE_ADDRESS_FORMAT            | long |
| BASE_ADDRESS_RESOLVE_TYPE      | user |
| CLASS                          | address_block |
| DESCRIPTION                    |  |
| DISPLAY_NAME                   |  |
| ENABLEMENT_DEPENDENCY          |  |
| ENABLEMENT_PRESENCE            | optional |
| ENABLEMENT_RESOLVE_TYPE        | immediate |
| ENABLEMENT_VALUE               | 1 |
| NAME                           | S00_AXI_reg |
| RANGE                          | 4096 |
| RANGE_BIT_STRING_LENGTH        | 0 |
| RANGE_DEPENDENCY               |   |
| RANGE_FORMAT                   | long |
| RANGE_MAXIMUM                  |  |
| RANGE_MINIMUM                  |  |
| RANGE_RESOLVE_TYPE             | immediate |
| USAGE                          | register |
| WIDTH                          | 32 |
| WIDTH_BIT_STRING_LENGTH        | 0 |
| WIDTH_DEPENDENCY               |   |
| WIDTH_FORMAT                   | long |
| WIDTH_RESOLVE_TYPE             | immediate |

The address block contains two parameters.

| Index | Property                       | Observed value |
|-------|--------------------------------|----------------|
|   0   | CLASS                          | address_block_parameter |
|   0   | CONFIG_GROUPS                  |  |
|   0   | DESCRIPTION                    |  |
|   0   | DISPLAY_NAME                   |  |
|   0   | ENABLEMENT_DEPENDENCY          |  |
|   0   | ENABLEMENT_PRESENCE            | optional |
|   0   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   0   | ENABLEMENT_TCL_EXPR            |  |
|   0   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   0   | ENABLEMENT_VALUE               | 1 |
|   0   | IPXACT_ID                      | ADDRBLOCKPARAM_VALUE.S00_AXI.S00_AXI_REG.OFFSET_BASE_PARAM |
|   0   | NAME                           | OFFSET_BASE_PARAM |
|   0   | ORDER                          | 0.000 |
|   0   | PARAMETER_TYPES                |  |
|   0   | VALUE                          | C_S00_AXI_BASEADDR |
|   0   | VALUE_BIT_STRING_LENGTH        | 0 |
|   0   | VALUE_DEPENDENCY               |  |
|   0   | VALUE_FORMAT                   | string |
|   0   | VALUE_RESOLVE_TYPE             | immediate |
|   0   | VALUE_SOURCE                   | default |
|   0   | VALUE_TCL_EXPR                 |  |
|   0   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   0   | VALUE_VALIDATION_LIST          |  |
|   0   | VALUE_VALIDATION_PAIRS         |  |
|   0   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   0   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   0   | VALUE_VALIDATION_TYPE          | none |
|   1   | CLASS                          | address_block_parameter |
|   1   | CONFIG_GROUPS                  |  |
|   1   | DESCRIPTION                    |  |
|   1   | DISPLAY_NAME                   |  |
|   1   | ENABLEMENT_DEPENDENCY          |  |
|   1   | ENABLEMENT_PRESENCE            | optional |
|   1   | ENABLEMENT_RESOLVE_TYPE        | immediate |
|   1   | ENABLEMENT_TCL_EXPR            |  |
|   1   | ENABLEMENT_TCL_EXPR_ARGUMENTS  |  |
|   1   | ENABLEMENT_VALUE               | 1 |
|   1   | IPXACT_ID                      | ADDRBLOCKPARAM_VALUE.S00_AXI.S00_AXI_REG.OFFSET_HIGH_PARAM |
|   1   | NAME                           | OFFSET_HIGH_PARAM |
|   1   | ORDER                          | 0.000 |
|   1   | PARAMETER_TYPES                |  |
|   1   | VALUE                          | C_S00_AXI_HIGHADDR |
|   1   | VALUE_BIT_STRING_LENGTH        | 0 |
|   1   | VALUE_DEPENDENCY               |  |
|   1   | VALUE_FORMAT                   | string |
|   1   | VALUE_RESOLVE_TYPE             | immediate |
|   1   | VALUE_SOURCE                   | default |
|   1   | VALUE_TCL_EXPR                 |  |
|   1   | VALUE_TCL_EXPR_ARGUMENTS       |  |
|   1   | VALUE_VALIDATION_LIST          |  |
|   1   | VALUE_VALIDATION_PAIRS         |  |
|   1   | VALUE_VALIDATION_RANGE_MAXIMUM |  |
|   1   | VALUE_VALIDATION_RANGE_MINIMUM |  |
|   1   | VALUE_VALIDATION_TYPE          | none |

That's it.
There are still more commands I have been unable to use.
Hopefully that's a starting point in building our scripts.