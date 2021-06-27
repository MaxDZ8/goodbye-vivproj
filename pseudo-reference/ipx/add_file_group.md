# ipx::add_file_group
Add a new file group to a component.
`ipx::add_file_group  [-type <arg>] [-quiet] [-verbose] <name> <component>`
 
| Name     | Req / Opt | Description                                 |
|----------|-----------|------------
|-type     |  opt  | Type of file group, this sets default values for the env_ids,  language, and display_name file_group properties
|-quiet    |  opt  | Ignore command errors
|-verbose  |  opt  | Suspend message limits during command execution
|name      |  req  | Name to initialize the newly added element
|component |  req  | Component object
