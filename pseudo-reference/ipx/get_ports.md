# ipx::get_ports
Get all the port on a component.

Syntax: 
`ipx::get_ports  [-regexp <arg>] [-nocase <arg>] [-filter <arg>] [-of_objects <args>] [-quiet] [-verbose] [<pattern>]`

| Name     | Req / Opt | Description        
|----------|-----------|-----------
| -regexp          | opt | Patterns are regular expressions, not simple glob patterns |
| -nocase          | opt | Matching will be case insensitive |
| -filter          | opt | Filter matching objects on additional expressions using the object properties |
| -of_objects      | opt | Parent component objects to get port from |
| -quiet           | opt | Ignore command errors |
| -verbose         | opt | Suspend message limits during command execution |
| &lt;pattern&gt;  | opt | Name pattern to look for, either a glob pattern or regular expression. Default: `*` |

## Notes
By default pulls ports from `ipx::current_core`, if you are like me you probably want to store the ~~peripheral~~ ~~component~~ AXI device you are building in something more sane such as `$periph`. In those cases it is necessary to use `-of_objects`.
