# Wannabe TCL command reference

Open Vivado in GUI mode and write in TCL console:
```
help ipx::
```

As of Vivado 2020.2 (build 3064766 on Wed Nov 18 09:12:45 MST 2020) the following are reported:

| Topic                                         | Description                                                       |
|-----------------------------------------------|-------------------------------------------------------------------|
| ipx::add_address_block                        | Add a new address block to a memory map.                          |
| ipx::add_address_block_parameter              | Add a new parameter to an address block.                          |
| ipx::add_address_space                        | Add a new address space to a component.                           |
| ipx::add_address_space_parameter              | Add a new parameter to an address space.                          |
| ipx::add_board_support                        | Add board support for the specified interface                     |
| ipx::add_bus_abstraction_port                 | Add a new port to a bus abstraction.                              |
| ipx::add_bus_interface                        | Add a new bus interface to a component.                           |
| ipx::add_bus_parameter                        | Add a new parameter to a bus interface.                           |
| ipx::add_bus_parameter_abstraction_map        | Add a new parameter abstraction map to a bus interface.           |
| ipx::add_channel                              | Add a new channel to a component.                                 |
| ipx::add_cpu                                  | Add a new cpu to a component.                                     |
| ipx::add_env_id                               | Add a new env_id to a file group.                                 |
| ipx::add_field                                | Add a new field to a register.                                    |
| ipx::add_file                                 | Add a new file to a file group.                                   |
| ipx::add_file_group                           | Add a new file group to a component.                              |
| ipx::add_file_group_parameter                 | Add a new parameter to a file group.                              |
| ipx::add_generator                            | Add a new generator to a component.                               |
| ipx::add_generator_parameter                  | Add a new parameter to a component generator.                     |
| ipx::add_hdl_parameter                        | Add a new hdl parameter to a component.                           |
| ipx::add_license_key                          | Add a new license key to a component.                             |
| ipx::add_memory_map                           | Add a new memory map to a component.                              |
| ipx::add_model_parameters_from_hdl            | Add model parameters to a component from it's top-level HDL file. |
| ipx::add_parameter_abstraction                | Add a new parameter abstraction to a parameter definition.        |
| ipx::add_parameter_abstraction_map            | Add a new parameter abstraction map to a component.               |
| ipx::add_parameter_map                        | Add a new parameter map to a parameter abstraction map.           |
| ipx::add_port                                 | Add a new port to a component.                                    |
| ipx::add_port_map                             | Add a new port map to a bus interface.                            |
| ipx::add_ports_from_hdl                       | Add model ports to a component from it's top-level HDL file.      |
| ipx::add_project_parameter                    | Add a new project parameter to a component.                       |
| ipx::add_register                             | Add a new register to an address block.                           |
| ipx::add_register_parameter                   | Add a new parameter to an register.                               |
| ipx::add_segment                              | Add a new address segment to an address space.                    |
| ipx::add_service_parameter                    | Add a new parameter to a transactional port service.              |
| ipx::add_subcore                              | Add a new subcore to a fileGroup.                                 |
| ipx::add_subspace_map                         | Add a new subspace map to a memory map.                           |
| ipx::add_tlm_interface                        | Add a new transactional interface to a component.                 |
| ipx::add_tlm_port                             | Add a new transactional port to a component.                      |
| ipx::add_user_parameter                       | Add a new user parameter to a component.                          |
| ipx::archive_core                             | Archive core.                                                     |
| ipx::associate_bus_interfaces                 | Assocate bus interfaces.                                          |
| ipx::check_integrity                          | Check integrity of packager object.                               |
| ipx::copy_contents_from                       | Overwrite all contents of a file group except for name, display_name, description, and env_ids.                               |
| ipx::copy_definition_ports_from               | Copy existing abstraction definition ports and their properties from one definition to another.                               |
| ipx::copy_files                               | Copy file objects into a different file group, thic changes only component meta-data, no changes to the file system are made. |
| ipx::copy_files_from                          | Copy all files from a file group into another file group (appends files to current list).                                     |
| ipx::create_abstraction_definition            | Create a abstraction definition with a VLNV.                      |
| ipx::create_bd_file                           | Create Block Diagram Tcl file.                                    |
| ipx::create_bus_definition                    | Create a bus definition with a VLNV.                              |
| ipx::create_core                              | Create a component with a VLNV.                                   |
| ipx::create_default_gui_files                 | Create default GUI and XGUI files.                                |
| ipx::create_parameter_definition              | Create a parameter definition with a VLNV.                        |
| ipx::create_xgui_files                        | Create default XGUI files.                                        |
| ipx::current_busabs                           | Set or get the currently active bus abstraction definition for packaging related commands. |
| ipx::current_busdef                           | Set or get the currently active bus definition for packaging related commands.             |
| ipx::current_core                             | Set or get the currently active component for packaging related commands.                  |
| ipx::current_paramdef                         | Set or get the currently active parameter definition for packaging related commands.       |
| ipx::dump_tcl_commands                        | Dump TCL commands.                                                |
| ipx::edit_ip_in_project                       | Edit IP in new project.                                           |
| ipx::evaluate_to_bitstring_value              | Evaluate an XPath expression to a bitstring value.                |
| ipx::evaluate_to_boolean_value                | Evaluate an XPath expression to a Boolean value.                  |
| ipx::evaluate_to_double_value                 | Evaluate an XPath expression to a double precision value.         |
| ipx::evaluate_to_long_value                   | Evaluate an XPath expression to a long integer value.             |
| ipx::evaluate_to_string_value                 | Evaluate an XPath expression to a string value.                   |
| ipx::find_open_busabs                         | Find a previously loaded bus abstraction definition.              |
| ipx::find_open_busdef                         | Find a previously loaded bus definition.                          |
| ipx::find_open_core                           | Find a previously loaded component.                               |
| ipx::find_open_paramdef                       | Find a previously loaded parameter definition.                    |
| ipx::find_parameter_definition                | Find the parameter definition correlated to the bus interface.    |
| ipx::get_address_block_parameters             | Get all the addressBlock parameter on an address block.           |
| ipx::get_address_blocks                       | Get all the address blocks on a memory map.                       |
| ipx::get_address_space_parameters             | Get all the addressSpace parameter on an address space.           |
| ipx::get_address_spaces                       | Get all the address space on a component.                         |
| ipx::get_basic_expression                     | Convert an XPath expression to basic expression.                  |
| ipx::get_bus_abstraction_ports                | Get all the bus abstraction port on a bus abstraction.            |
| ipx::get_bus_interfaces                       | Get all the bus interface on a component.                         |
| ipx::get_bus_parameter_abstraction_maps       | Get all the parameter abstraction map on a component or bus interface. |
| ipx::get_bus_parameters                       | Get all the bus parameter on a bus interface.                     |
| ipx::get_channels                             | Get all the channel on a component.                               |
| ipx::get_cores                                | Get a list of available ipx cores                                 |
| ipx::get_cpus                                 | Get all the cpu on a component.                                   |
| ipx::get_fields                               | Get all fields from a register.                                   |
| ipx::get_file_group_parameters                | Get all the file group parameters on a file group.                |
| ipx::get_file_groups                          | Get all the file group on a component.                            |
| ipx::get_file_groups_for_envid                | Get all file_groups that match the specified env_ids.             |
| ipx::get_file_groups_for_file                 | Get all file_groups that contain the specified file name.         |
| ipx::get_files                                | Get all or selected files a file group.                           |
| ipx::get_generator_parameters                 | Get all the generator parameter on a generator.                   |
| ipx::get_generators                           | Get all the generator on a component.                             |
| ipx::get_hdl_parameters                       | Get all the hdl parameter on a component.                         |
| ipx::get_ipfiles                              | Get a list of IP files from the current Catalog                   |
| ipx::get_license_keys                         | Get all the license key on a component.                           |
| ipx::get_memory_maps                          | Get all the memory map on a component.                            |
| ipx::get_parameter_abstraction_maps           | Get all the parameter abstraction map on a component.             |
| ipx::get_parameter_abstractions               | Get all parameter abstractions from a parameter abstraction.      |
| ipx::get_parameter_maps                       | Get all the parameter map on a component.                         |
| ipx::get_port_maps                            | Get all the port map on a bus interface.                          |
| ipx::get_ports                                | Get all the port on a component.                                  |
| ipx::get_project_parameters                   | Get all the project parameters on a component.                    |
| ipx::get_register_parameters                  | Get all the register parameter on an register.                    |
| ipx::get_registers                            | Get all registers from an address block.                          |
| ipx::get_segments                             | Get all the addressSpace address segment on an address space.     |
| ipx::get_service_parameters                   | Get all the service parameter on a transactional port.            |
| ipx::get_subcores                             | Get all subcores from a fileGroup.                                |
| ipx::get_subspace_maps                        | Get all the subspace maps on a memory map.                        |
| ipx::get_tlm_interfaces                       | Get all the transactional interfaces on a component.              |
| ipx::get_tlm_ports                            | Get all the transactional ports on a component.                   |
| ipx::get_user_parameters                      | Get all the user parameters on a component.                       |
| ipx::get_xpath_expression                     | Convert a basic expression to XPath expression.                   |
| ipx::import_remote_files                      | Unpackage IP into the current project                             |
| ipx::import_top_level_hdl                     | Import model parameters and ports from the top-level HDL file. Both data are imported if none of the -parameters and -ports options are given. |
| ipx::infer_address_space                      | Infer port maps.                                                  |     
| ipx::infer_block                              | Create a HDL block IP for use in IPI diagram.                     |     
| ipx::infer_bus_interface                      | Infer bus interfaces from component ports.                        |     
| ipx::infer_bus_interfaces                     | Infer bus interfaces from component ports.                        |     
| ipx::infer_core                               | Infer a core from a directory structure.                          |     
| ipx::infer_memory_address_block               | Infer port maps.                                                  |     
| ipx::infer_port_maps                          | Infer port maps.                                                  |     
| ipx::infer_supported_families                 | Convert ISE family string syntax to RDI syntax.                   |     
| ipx::infer_user_parameter_order               | Infer user parameter order base on the Tcl dependency.            |     
| ipx::infer_user_parameters                    | Infer user parameters from other core content (mainly HDL parameters). |
| ipx::init_guidata                             | This command initializes IPComponent with GUI information         |    
| ipx::insert_file                              | Change the order of files in the fileset.                         |    
| ipx::is_tcl_expr_valid                        | Indicate if utility generator expression is valid.                |    
| ipx::merge_project_changes                    | Merge project changes into the current component.                 |    
| ipx::move_temp_component_back                 |                                                                   |    
| ipx::open_abstraction_definition              | Open a abstraction definition from a file.                        |    
| ipx::open_bus_definition                      | Open a bus definition from a file.                                |    
| ipx::open_core                                | Open or Load a component xml file from a file name.               |    
| ipx::open_ipxact_file                         | Open a general IP-XACT file for component, abstraction definition, bus definition or parameter definition object. |
| ipx::open_parameter_definition                | Open a parameter definition from a file.                          |
| ipx::package_checkpoint                       | Package a design checkpoint                                       |
| ipx::package_project                          | Package the current project                                       |
| ipx::remove_address_block                     | Remove a named address block from a memory map.                   |
| ipx::remove_address_block_parameter           | Remove a named parameter from the address block.                  |
| ipx::remove_address_space                     | Remove a named address space from a component.                    |
| ipx::remove_address_space_parameter           | Remove a named parameter from the address space.                  |
| ipx::remove_all_address_block                 | Remove all address blocks from a memory map.                      |
| ipx::remove_all_address_block_parameter       | Remove all parameters from the address block.                     |
| ipx::remove_all_address_space                 | Remove all address spaces from a component.                       |
| ipx::remove_all_address_space_parameter       | Remove all parameters from the address space.                     |
| ipx::remove_all_bus_interface                 | Remove all bus interfaces from a component.                       |
| ipx::remove_all_bus_parameter                 | Remove all parameters from the bus interface.                     |
| ipx::remove_all_bus_parameter_abstraction_map | Remove all parameter abstraction maps from the bus interface.     |
| ipx::remove_all_channel                       | Remove all channels from a component.                             |
| ipx::remove_all_cpu                           | Remove all cpus from a component.                                 |
| ipx::remove_all_field                         | Remove all fields from a register.                                |
| ipx::remove_all_file                          | Remove all files from a file group.                               |
| ipx::remove_all_file_group                    | Remove all file groups from a component.                          |
| ipx::remove_all_generator                     | Remove all component generators from a component.                 |
| ipx::remove_all_generator_parameter           | Remove all parameters from the component generator.               |
| ipx::remove_all_hdl_parameter                 | Remove all hdl parameters from a component.                       |
| ipx::remove_all_license_key                   | Remove all license features from a component.                     |
| ipx::remove_all_memory_map                    | Remove all memory maps from a component.                          |
| ipx::remove_all_parameter_abstraction         | Remove all parameter abstractions from a parameter definition.    |
| ipx::remove_all_parameter_abstraction_map     | Remove all parameter abstraction maps from a component.           |
| ipx::remove_all_parameter_map                 | Remove all parameter maps from the parameter abstraction map.     |
| ipx::remove_all_port                          | Remove all ports from a component.                                |
| ipx::remove_all_port_map                      | Remove all port maps from the bus interface.                      |
| ipx::remove_all_register                      | Remove all registers from an address block.                       |
| ipx::remove_all_register_parameter            | Remove all parameters from the register.                          |
| ipx::remove_all_segment                       | Remove all address segments from the address space.               |
| ipx::remove_all_service_parameter             | Remove all parameters from a transactional port.                  |
| ipx::remove_all_subcore                       | Remove all subcores from a fileGroup.                             |
| ipx::remove_all_subspace_map                  | Remove all subspace maps from a memory map.                       |
| ipx::remove_all_user_parameter                | Remove all user parameters from a component.                      |
| ipx::remove_board_support                     | Remove board support for the specified interface                  |
| ipx::remove_bus_abstraction_port              | Remove a named port from a bus abstraction.                       |
| ipx::remove_bus_interface                     | Remove a named bus interface from a component.                    |
| ipx::remove_bus_parameter                     | Remove a named parameter from the bus interface.                  |
| ipx::remove_bus_parameter_abstraction_map     | Remove a parameter abstraction map from the bus interface.        |
| ipx::remove_channel                           | Remove a named channel from a component.                          |
| ipx::remove_cpu                               | Remove a named cpu from a component.                              |
| ipx::remove_field                             | Remove a named field from a register.                             |
| ipx::remove_file                              | Remove a named file from a file group.                            |
| ipx::remove_file_group                        | Remove a named file group from a component.                       |
| ipx::remove_file_group_parameter              | Remove a named parameter from the file group.                     |
| ipx::remove_generator                         | Remove a named component generator from a component.              |
| ipx::remove_generator_parameter               | Remove a named parameter from the component generator.            |
| ipx::remove_hdl_parameter                     | Remove a named hdl parameter from a component.                    |
| ipx::remove_license_key                       | Remove a named license feature from a component.                  |
| ipx::remove_memory_map                        | Remove a named memory map from a component.                       |
| ipx::remove_parameter_abstraction             | Remove a named parameter abstraction from a parameter definition. |
| ipx::remove_parameter_abstraction_map         | Remove a parameter abstraction map from a component.              |
| ipx::remove_parameter_map                     | Remove a parameter map from the parameter abstraction map.        |
| ipx::remove_port                              | Remove a named port from a component.                             |
| ipx::remove_port_map                          | Remove a port map from the bus interface.                         |
| ipx::remove_project_parameter                 | Remove a project parameter from a component.                      |
| ipx::remove_register                          | Remove a named register from an address block.                    |
| ipx::remove_register_parameter                | Remove a named parameter from the register.                       |
| ipx::remove_segment                           | Remove a named address segment from the address space.            |
| ipx::remove_service_parameter                 | Remove a named parameter from the a transactional port.           |
| ipx::remove_subcore                           | Remove a named subcore from a fileGroup.                          |
| ipx::remove_subspace_map                      | Remove a named subspace map from a memory map.                    |
| ipx::remove_tlm_interface                     | Remove a named transactional interface from a component.          |
| ipx::remove_tlm_port                          | Remove a named transactional port from a component.               |
| ipx::remove_user_parameter                    | Remove a named user parameter from a component.                   |
| ipx::reorder_bus_interfaces                   | Change the order of busInterfaces in the component.               |
| ipx::reorder_files                            | Change the order of files in the fileset.                         |
| ipx::reorder_ports                            | Change the order of ports in the component.                       |
| ipx::report_possible_file_groups              | Report information about all possible file groups.                |
| ipx::save_abstraction_definition              | Save a abstraction definition to the previously opened filename.  |
| ipx::save_bus_definition                      | Save a bus definition to the previously opened filename.          |
| ipx::save_core                                | Save a component to the previously opened filename.               |
| ipx::save_parameter_definition                | Save a parameter definition to the previously opened filename.    |
| ipx::unload_abstraction_definition            | Unload a abstraction definition from memory.                      |
| ipx::unload_bus_definition                    | Unload a bus definition from memory.                              |
| ipx::unload_core                              | Unload/remove a component.                                        |
| ipx::unload_parameter_definition              | Unload a parameter definition from memory.                        |
| ipx::update_board_files                       | Create default board flow related files.                          |
| ipx::update_checksums                         | Update checksums within core meta-data.                           |
| ipx::update_dependency                        | Evaluate Tcl and XPATH expressions, and update default values for the specified object, including any other object dependencies that are derived from this object. |
| ipx::update_docs_filegroup                    | Copy Coregen ReadMe, DataSheet, VersionInfo and GettingStartedGuide files to all documentation file group. |
| ipx::update_expressions                       | Update expressions in component                                   |
| ipx::update_ip_instances                      | Deploy iterative packaging IP                                     |
| ipx::update_source_project_archive            |                                                                   |
| ipx::upgrade_core                             | Upgrade core to latest version of meta-data.                      |
| ipx::utils::gen_cmodel_template               | Generates all the sls layers                                      |

For help on an individual topic, type 'help <topic>'. For example:
% help create_project
```

Vivado Design Suite Tcl Command Reference Guide (UG835) further notes other commands: in the *CreatePeripheral* and *IpFlow* category but to build the project (as in the sense of TCL script-based-project) additional commands are needed.
Some of the useful commands include:

| Command                                       | Description                                                       |
|-----------------------------------------------|-------------------------------------------------------------------|
| TODO                                          | TODO                                                              |

Commands are a thing, but their parameters and properties are another.

1. Available [taxonomies](./taxonomies.md) (aka "categories", in their dialog).
2. [Properties](./axi-component-properties.md) of an AXI component.
3. [Bus interfaces](./bus-interfaces.md) of a component created by the regular project-based flow.
4. [Ports](./io-ports.md) of a component created by the regular project-based flow **and** supporting some custom ports for the lulz (I usually just drive feedback LEDs or throw them away).
