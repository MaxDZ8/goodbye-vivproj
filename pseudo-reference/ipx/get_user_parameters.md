# ipx::get_user_parameters
Get all the user parameters on a component.

```
ipx::get_user_parameters  [-regexp <arg>] [-nocase <arg>] [-filter <arg>]
                          [-of_objects <args>] [-quiet] [-verbose] [<pattern>]
```

| Name           | Opt / Req | Description          |
|----------------|-----------|----------------------|
| [-regexp]      |    Opt    | Patterns are regular expressions, not simple glob patterns |
| [-nocase]      |    Opt    | Matching will be case insensitive |
| [-filter]      |    Opt    | Filter matching objects on additional expressions using the  object properties |
| [-of_objects]  |    Opt    | Parent component objects to get user parameters from |
| [-quiet]       |    Opt    | Ignore command errors |
| [-verbose]     |    Opt    | Suspend message limits during command execution |
| [<pattern>]    |    Opt    | Name pattern to look for, either a glob pattern or regular expression<br>Default: * |
