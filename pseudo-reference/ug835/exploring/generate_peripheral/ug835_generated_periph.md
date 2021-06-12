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

Properties of the `$periph` object itself, which is the *component* we want to pack.

| Property                           | Immediatly after creation                  | After adding AXI | After `generate_peripheral`   |
|------------------------------------|--------------------------------------------|------------------|-------------------------------|
| ADD_DONT_TOUCH                     | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| ADVERTISEMENT_IP                   | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| ADVERTISEMENT_URL                  |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| AUTO_DEVICE_PROPERTIES_FILTER      |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| AUTO_FAMILY_SUPPORT_LEVEL          |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| BLOCK_IP                           | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| CHECKSUMS                          |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| CLASS                              | component                                  |  *&lt;same&gt;*  | *&lt;same&gt;*
| COMPANY_URL                        |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| CORE_REVISION                      | 1                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| CREATION_DATE_TIME                 |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| DEBUG_CORE_INFO                    | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| DEFAULT_USER_PARAMETER_ADDED       | 0                                          |  *&lt;same&gt;*  | 1
| DEFINITION_SOURCE                  | unknown                                    |  *&lt;same&gt;*  | *&lt;same&gt;*
| DESCRIPTION                        | Peripheral IP template                     |  *&lt;same&gt;*  | *&lt;same&gt;*
| DESIGN_TOOL_CONTEXTS               | All                                        |  *&lt;same&gt;*  | *&lt;same&gt;*
| DEVICE_INDEPENDENT_SYNTH           | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| DIRTY                              | 1                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| DISPLAY_NAME                       | testAXI1                                   |  *&lt;same&gt;*  | *&lt;same&gt;*
| EXAMPLE_DESIGN_NO_IP_IMPORT        | 0 <br> WARNING: [IP_Flow 19-845] The 'expected_filegroups' property has been replaced by the 'ipx::report_possible_file_groups' command.
| EXPECTED_FILEGROUPS                | xilinx_unknown xilinx_project_archive xilinx_elaborateports xilinx_elaborateprecontents xilinx_elaboratesubcores xilinx_elaboratebd xilinx_elaboratepostcontents xilinx_anylanguagehls xilinx_vhdlhlssynthesis xilinx_veriloghlssynthesis xilinx_anylanguagehlssynthesis xilinx_vhdlhlssimulation xilinx_veriloghlssimulation xilinx_anylanguagehlssimulation xilinx_vhdlinstantiationtemplate xilinx_veriloginstantiationtemplate xilinx_anylanguageinstantiationtemplate xilinx_vhdlsynthesis xilinx_verilogsynthesis xilinx_anylanguagesynthesis xilinx_vhdlsourcedelivery xilinx_verilogsourcedelivery xilinx_anylanguagesourcedelivery xilinx_structuralnetlist xilinx_synthesisconstraints xilinx_synthesismemoryarchive xilinx_synthesischeckpoint xilinx_vhdlsynthesiswrapper xilinx_verilogsynthesiswrapper xilinx_anylanguagesynthesiswrapper xilinx_implementation xilinx_vhdlbehavioralsimulation xilinx_verilogbehavioralsimulation xilinx_hybridsimulation xilinx_systemcsimulation xilinx_anylanguagebehavioralsimulation xilinx_simulationmemoryarchive xilinx_simulationcheckpoint xilinx_vhdlsimulationwrapper xilinx_verilogsimulationwrapper xilinx_hybridsimulationwrapper xilinx_systemcsimulationwrapper xilinx_anylanguagesimulationwrapper xilinx_vhdltestbench xilinx_verilogtestbench xilinx_testbench xilinx_cmodelsimulation xilinx_matlabmodels xilinx_systemgeneratormodels xilinx_miscfiles xilinx_exporttosdk xilinx_catalogicon xilinx_catalogdisabledicon xilinx_coreguiicon xilinx_miffiles xilinx_datasheet xilinx_encrypteddatasheet xilinx_gettingstartedguide xilinx_productguide xilinx_versioninformation xilinx_readme xilinx_documentation xilinx_vhdlexamples xilinx_verilogexamples xilinx_examples xilinx_examplessynthesis xilinx_examplessimulation xilinx_examplesimplementation xilinx_examplesscriptext xilinx_examplesscript xilinx_referencedesign xilinx_upgradescripts xilinx_softwaredriver xilinx_externalfiles xilinx_sharedlogic xilinx_hardwarehandoff xilinx_powerdata xilinx_iodata xilinx_xpgui xilinx_xpguicustom xilinx_xpgdrc xilinx_blockdiagram xilinx_utilityxitfiles xilinx_cgvhdlsynthesis xilinx_cgverilogsynthesis xilinx_cganylanguagesynthesis xilinx_cgvhdlsourcedelivery xilinx_cgverilogsourcedelivery xilinx_cganylanguagesourcedelivery xilinx_cgstructuralnetlist xilinx_cgimplementation xilinx_cgvhdlbehavioralsimulation xilinx_cgverilogbehavioralsimulation xilinx_cganylanguagebehavioralsimulation xilinx_cgvhdltestbench xilinx_cgverilogtestbench xilinx_cgtestbench xilinx_cgvhdlinstantiationtemplate xilinx_cgveriloginstantiationtemplate xilinx_cgvhdlsynthesiswrapper xilinx_cgverilogsynthesiswrapper xilinx_cgvhdlsimulationwrapper xilinx_cgverilogsimulationwrapper xilinx_cgcmodelsimulation xilinx_cgmatlabmodels xilinx_cgsystemgeneratormodels xilinx_cgmiscfiles xilinx_cgcatalogicon xilinx_cgcatalogdisabledicon xilinx_cgcoreguiicon xilinx_cgmiffiles xilinx_cgdatasheet xilinx_cgencrypteddatasheet xilinx_cggettingstartedguide xilinx_cgversioninformation xilinx_cgreadme xilinx_cgdocumentation xilinx_cgexamples xilinx_cgexamplessynthesis xilinx_cgexamplessimulation xilinx_cgexamplesimplementation xilinx_cgreferencedesign xilinx_guilayout xilinx_uimodel xilinx_allejava xilinx_associatedfiles xilinx_coregenlegacy xilinx_utility xilinx_generatorfiles xilinx_licensedsources xilinx_synthesisconstraints xilinx_implementationconstraints xilinx_instantiationtemplates xilinx_viewlogicsymbols xilinx_schematicsymbols xilinx_foundationsymbols xilinx_coresymbol xilinx_vhdlmiscfiles xilinx_verilogmiscfiles xilinx_vhdlrtlsimulation xilinx_verilogrtlsimulation xilinx_any_languagertlsimulation xilinx_cgallviews
| HIDE_IN_GUI                        | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| INTEGRITY_REPORT_FILE_NAME         | packager_integrity_report.html             |  *&lt;same&gt;*  | *&lt;same&gt;*
| LIBRARY                            | user                                       |  *&lt;same&gt;*  | *&lt;same&gt;*
| NAME                               | testAXI1                                   |  *&lt;same&gt;*  | *&lt;same&gt;*
| PAYMENT_REQUIRED                   | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| PREVIOUS_VERSION_FOR_UPGRADE       |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| REQUIRES_VIP                       | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| RETAIN_COMPONENT_INTEGER_PORT_TYPE | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| ROOT_DIRECTORY                     | *&lt;SRCDIR&gt;*/.srcs/sources_1/ip  |  *&lt;same&gt;*  | *&lt;SRCDIR&gt;*/defaults/.srcs/sources_1/ip/testAXI1_1.3
| SDX_KERNEL                         | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| SDX_KERNEL_TYPE                    |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| SECURITY_CHECKED                   | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUMMARY_REPORT_FILE_NAME           | packager_summary_report.html               |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTED_FAMILIES                 | artix7 Pre-Production                      |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTS_AUTO_SLRS                 | 1                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTS_AUTO_XDC                  |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTS_DEFERRED_ELABORATION      | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTS_DYNAMIC_BITSTRINGS        | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTS_IP_CACHE                  |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTS_OOC                       |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| SUPPORTS_VIVADO                    | 1                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| SYSTEMC_LIBRARIES                  |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| TAGS                               |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| TAXONOMY                           | AXI_Peripheral                             |  *&lt;same&gt;*  | *&lt;same&gt;*
| UNSUPPORTED_SIMULATORS             |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| USE_VIVADO_HLS                     | 0                                          |  *&lt;same&gt;*  | *&lt;same&gt;*
| VENDOR                             | myCompany<span>.com</span>                 |  *&lt;same&gt;*  | *&lt;same&gt;*
| VENDOR_DISPLAY_NAME                |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| VERSION                            | 1.3                                        |  *&lt;same&gt;*  | *&lt;same&gt;*
| VLNV                               | myCompany<span>.com</span>:user:testAXI1:1.3 |  *&lt;same&gt;*  | *&lt;same&gt;*
| XILINX_VERSION                     |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| XILINX_VERSION_COMPATIBILITY       |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*
| XML_FILE_NAME                      | *&lt;SRCDIR&gt;*/.srcs/sources_1/ip/component.xml |  *&lt;same&gt;*  | *&lt;SRCDIR&gt;*/.srcs/sources_1/ip/testAXI1_1.3/component.xml
| XPM_LIBRARIES                      |                                            |  *&lt;same&gt;*  | *&lt;same&gt;*

Note: in the above *&lt;SRCDIR&gt;* is the directory where I started Vivado. Substituted for clarity.

The component features additional content which is to be pulled by the appropriate `get_` command.

# Files in their groups
A picture is better than a thousand words so let's check out the thing graphically, as it would appear in the IP packager:
![Files and groups, as hierarchy](./minimal-ippack2-file-groups_hier.png)

# Ports and interfaces
This one is fairly complicated.
![Ports and interfaces as visualized by the packager](./minimal-ippack4-bus-interfaces.png)

# Addressing and memory
This one is so weird the graphics don't quite work. The bottom line is a device has at least a memory map. Each memory map contains one or more address blocks and each address block can have its parameters.
![Memory addressing, visualized](./minimal-ippack5-addressing-and-memory.png)


