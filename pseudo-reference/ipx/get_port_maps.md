# ipx::get_port_maps
Get all the port map on a bus interface.

Syntax: 
`ipx::get_port_maps  [-regexp <arg>] [-nocase <arg>] [-filter <arg>] -of_objects <args> [-quiet] [-verbose] [<pattern>]`


| Name           | Req / Opt | Description        
|----------------|-----------|-----------
|-regexp         | Opt | Patterns are regular expressions, not simple glob patterns |
|-nocase         | Opt | Matching will be case insensitive |
|-filter         | Opt | Filter matching objects on additional expressions using the object properties |
|-of_objects     | Req | Parent bus interface objects to get port map from |
|-quiet          | Opt | Ignore command errors |
|-verbose        | Opt | Suspend message limits during command execution |
|&lt;pattern&gt; | Opt | Name pattern to look for, either a glob pattern or regular expression. Default: * |

## Notes
A port map "puts" a port (pin/bus) into a "containing" *bus interface*.
