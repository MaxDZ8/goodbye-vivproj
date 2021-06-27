# ipx::add_ports_from_hdl
Add model ports to a component from it's top-level HDL file.
```
ipx::add_ports_from_hdl  -ordered_files <args> [-top_level_hdl_file <arg>]
                         [-top_module_name <arg>] -include_dirs <args>
                         -include_subcore_dirs <args> [-quiet] [-verbose]
                         <component>
```


| Name           | Req / Opt | Description                                 |
|----------------|-----------|------------
|-ordered_files        | Req | HDL files to parse in order. The last file should be the top-level HDL file; if not, the `-top_level_hdl_file` must be specified. |
|-top_level_hdl_file   | Opt | Top-level source file where ports and model parameters are imported from. |
|-top_module_name      | Opt | Top module name.
|-include_dirs         | Req | Specifies the locations on which files or fileSets may be dependent.  Typically, this would be a directory that would contain included files. |
|-include_subcore_dirs | Req | Infer subcore repository locations as included directories for given subcore VLNV's. Example, `-inlude_subcore_dirs {xilinx.com:ip:helper:1.0}`. If no VLNV given, component subcore references are inferred. |
|-quiet                | Opt | Ignore command errors |
|-verbose              | Opt | Suspend message limits during command execution |
|&lt;component&gt;     | Req | Component object |

# Notes
Possibly called by `ipx::merge_project_changes`.
Good amount of automation. For the time being I'm not using it just because I'm trying to document workings of the thing but I do want to switch to it ASAP.
Except: what about parameter-conditional ports?
Needs more investigation.
