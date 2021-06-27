# run as
# vivado -mode batch make-component.tcl
#
# Packages my sources for use in block designs.
# It's just a way to deliver library components, there's nothing really to synth or anything.
# Replaces GUI mode Tools > Create and package new IP
# Non-project mode.
#
# This time I'll attempt something serious going by the book with generate_peripheral, which looks like
# the only game in town generating .c drivers and stuff. I will then merge hdl parameters, it's kinda
# like the usual GUI-based operations but I need to tame generate_peripheral

# This first part is just like the merging_hdl example.

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
set componentVersion {1.0}
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


# This one is debatable. I honestly don't find much benefit in providing testbenches ( = unit tests, for me) into package.
# I'd be interested in seeing some useful examples. For now, I drop them.
ipx::remove_file_group xilinx_verilogbehavioralsimulation $periph

set synth_files [ ipx::get_file_groups_for_envid verilogSource:vivado.xilinx.com:synthesis $periph ]
# Move the finished files; the templates are useless.
set resultsDir "${componentIdentifier}_${componentVersion}"
set componentDir "$outputDir/$resultsDir"
set sourceTarget "$componentDir/hdl"
file delete -force $sourceTarget
file copy {./rtl}  $sourceTarget
foreach dummy [ipx::get_files -of_objects $synth_files] { ipx::remove_file [get_property NAME $dummy] $synth_files }

proc moved { files from to } {
    set magic {}
    foreach source $files { lappend magic [ regsub "^$from" $source $to ] }
    return $magic;
}

# This works because paths for component files are relative to component.xml, which will be put into $componentDir 
remove_files [current_fileset] $sources_verilog
foreach thing [ moved $sources_verilog rtl hdl ] { ipx::add_file $thing $synth_files }
foreach thing [ moved $sources_sv      rtl hdl ] { ipx::add_file $thing $synth_files }

# Note: you can remove this two and everything works kinda ok except you get:
# CRITICAL WARNING: [IP_Flow 19-377] There are no source files from the current project to package.
# Eeew! Critical warnings are no good! So I keep those two commands... but...
read_verilog     [ moved $sources_verilog rtl $sourceTarget ]
read_verilog -sv [ moved $sources_sv      rtl $sourceTarget ]

# Parse the files and create the ipgui structures behind the scenes. We are not allowed to know about this pixie dust.
ipx::merge_project_changes hdl_parameters $periph

# Get the rid of a file group merge_project_changes introduced because having commands doing a single thing doesn't sound good to Xilinx interns dealing with our lives.
ipx::remove_file_group xilinx_anylanguagebehavioralsimulation $periph

# Adding my two module parameters. Remember: I also want to capture this information and help user choosing right!
set uhdlp_merge_op  [ ipx::get_user_parameters MERGE_OP      -of_objects $periph ]
set uhdlp_merge_lat [ ipx::get_user_parameters MERGE_LATENCY -of_objects $periph ]

set_property DATA_TYPE          string     $uhdlp_merge_op
set_property DISPLAY_NAME       {Merge Op} $uhdlp_merge_op
set_property VALUE              {+}        $uhdlp_merge_op
set_property VALUE_FORMAT       string     $uhdlp_merge_op
set_property VALUE_RESOLVE_TYPE generated  $uhdlp_merge_op
set_property VALUE_VALIDATION_LIST {+ ^}   $uhdlp_merge_op
set_property VALUE_VALIDATION_TYPE list    $uhdlp_merge_op
ipgui::add_param -name {MERGE_OP} -component $periph -display_name {Merge Operation} -show_label {true} -show_range {true} -widget {comboBox}
set_property TOOLTIP {The two partials are merged with this} [ipgui::get_guiparamspec -name "MERGE_OP" -component $periph ]

set_property DATA_TYPE          integer         $uhdlp_merge_lat;
set_property DISPLAY_NAME       {Merge Latency} $uhdlp_merge_lat
set_property VALUE              0               $uhdlp_merge_lat
set_property VALUE_FORMAT       long            $uhdlp_merge_lat
set_property VALUE_RESOLVE_TYPE generated       $uhdlp_merge_lat
set_property VALUE_VALIDATION_TYPE range_long   $uhdlp_merge_lat
set_property VALUE_VALIDATION_RANGE_MINIMUM 0   $uhdlp_merge_lat
set_property VALUE_VALIDATION_RANGE_MAXIMUM 1   $uhdlp_merge_lat
ipgui::add_param -name {MERGE_LATENCY} -component $periph -display_name {Merge Latency} -show_label {true} -show_range {true} -widget {textEdit}

# And we need to regenerate the GUI files...
file delete -force "$componentDir/xgui"
ipx::create_xgui_files $periph

# Just generates component.xml
write_peripheral $periph
