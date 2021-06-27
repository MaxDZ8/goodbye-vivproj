Let X be the directory containing `component.xml` from canonical GUI-based project flow.

Let Y be the directory containing `component.xml` from TCL script (as I hopefully built there).

Folder compare X vs Y using KDiff3.

Results:
- 11 subdirectories
- 9 files are equal
- 8 files are different

Let's check the various sections more closely and break up those numbers.

# Block design
Subdirectory: `bd`

`bd.tcl` is the same.

# Drivers
Subdirectory: `drivers`

There are 6 files in a couple subdirectories, enumerating them isn't considered worthwile.

All files are the same.

# Example designs
Subdirectory: `example_designs`

Completely missing by design in the proposed TCL-produced peripheral.

I am interested in understanding those in more detail but for the time being the TCL script leaves them out.

Amounts to 8 files.

# Source
Subdirectory: `hdl`.

`mdz_custom_logic.sv` is reported as different by compare tool but contents look the same. There are probably whitespaces differences.

The other files are the same.

## Project mode source (?)
Subdirectory `src`

I have observed this subdirectory in a few occasions and it seems vivado wants it today.
Contains a copy of `mdz_custom_logic.sv`.
AFAIK, this path is useless noise. The tcl script does not generate it for good reason.

# GUI scripts
Subdirectory: `xgui`.

Generated by the `ipx::create_xgui_files` command, it is a bit surprising it has a different output. The **differences are relevant** and therefore noted here.

The GUI generated peripheral GUI code includes those extra procedures:
```
proc update_PARAM_VALUE.MERGE_LATENCY { PARAM_VALUE.MERGE_LATENCY } {
	# Procedure called to update MERGE_LATENCY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MERGE_LATENCY { PARAM_VALUE.MERGE_LATENCY } {
	# Procedure called to validate MERGE_LATENCY
	return true
}

proc update_PARAM_VALUE.MERGE_OP { PARAM_VALUE.MERGE_OP } {
	# Procedure called to update MERGE_OP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MERGE_OP { PARAM_VALUE.MERGE_OP } {
	# Procedure called to validate MERGE_OP
	return true
}
```

Those lines are not present in the TCL-generated GUI. It looks like they could be real useful to build complex peripherals with inter-dependant parameters but they're NOP anyway so - albeit surprising - the result is considered *good enough* to pass and arguably equivalent in this specific case.

# Device component file
`component.xml`

The files are different.

- The file tracks checksums and they are clearly different across the two files. They are considered functionally equivalent.
- The TCL generated component exports no behavioural simulation file group by design.
- Consequently, ports in the GUI-generated component are marked for both `xilinx_verilogsynthesis` - as in the TCL-generated component - and `xilinx_verilogbehavioralsimulation`.
- The parameter `MERGE_LATENCY` got its subfields in different order. They are equivalent.
- The `xilinx_verilogsynthesis_view_fileset` fileset got its contents in different order. Everything looks good enough, considering no simulation is provided.
- The GUI-generated file seems to have a bunch of `<xilinx:tag>` entries tracking... `component.xml` file location? Not considered useful.

