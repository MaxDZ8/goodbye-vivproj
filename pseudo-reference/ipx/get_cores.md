# ipx:get_cores
Get a list of available ipx cores
`ipx::get_cores  [-from <arg>] [-regexp] [-nocase] [-filter <arg>] [-quiet] [-verbose] [<patterns>...]`

Returns: 
List of available ipx core objects

| Name     | Req / Opt | Description        
|----------|-----------|-----------
|-from     |  opt | Source of ipx cores to search, should be one of: catalog, project, packager. Default: catalog
|-regexp   |  opt | Patterns are full regular expressions
|-nocase   |  opt | Perform case-insensitive matching
|-filter   |  opt | Filter list with expression
|-quiet    |  opt | Ignore command errors
|-verbose  |  opt | Suspend message limits during command execution
|&lt;patterns&gt;|  opt | Match Cores against patterns. Default: * Values: The default search pattern is the wildcard *, or .* when -regexp is specified.

**Notes**
Running this takes a while. Say 10 seconds. It scans the "installed repositories" on storage and return a thing such as this:
```
ipx::get_cores
INFO: [IP_Flow 19-234] Refreshing IP repositories
INFO: [IP_Flow 19-1704] No user IP repositories specified
INFO: [IP_Flow 19-2313] Loaded Vivado IP repository 'c:/Xilinx/Vivado/2020.2/data/ip'.
ipx::get_cores: Time (s): cpu = 00:00:28 ; elapsed = 00:00:40 . Memory (MB): peak = 1002.246 ; gain = 0.000
component component_2 component component_3 component component_4 component component_5 component component_6 component component_7 component component_8 component component_9 component component_10 component component_11 component component_12 component component_13 component component_14 component component_15 component component_16 component component_17 component component_18 component component_19 component component_20 component component_21 component component_22 component component_23 component component_24 component component_25 component component_26 component component_27 component component_28 component component_29 component 
... snip ...
component_324 component component_325 component component_326 component component_327 component component_328 component component_329 component component_330 component component_331 component component_332 component component_333 component component_334 component component_335 component component_336 component component_337 component component_338 component component_339 component component_340 component component_341 component component_342 component component_343 component component_344 component component_345 component component_346 component compo...
```

Not so useful by itself, the catalog is huge and probably better navigated interactively.

Interestingly,
```
Vivado% ipx::get_cores -from packager

```
But, if you go ahead, define some AXI IP to be packaged - you don't even need to `generate_peripheral`, I take `create_peripheral` is enough:
```
ipx::get_cores -from packager
component component_1
```