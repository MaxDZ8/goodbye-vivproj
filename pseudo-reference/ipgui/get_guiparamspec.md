# ipgui::get_guiparamspec
Get parameter object by name
`ipgui::get_guiparamspec  [-of <arg>] [-component <arg>] [-quiet] [-verbose] <name>`

| Name       | Req / Opt | Description                                 |
|------------|-------|-------------------------------------------------|
| -of        |  opt  | IP Instance object<br>Default: nullptr          |
| -component |  opt  | IP Component on which group to be added<br>Default: nullptr |
| -quiet     |  opt  | Ignore command errors                           |
| -verbose   |  opt  | Suspend message limits during command execution |
| name       |  req  | Name of the parameter                           |

## Notes
Maybe there's hope in this one. The wording seems to suggest this can be used to add/generate new paramspecs, and this is basically what stumped me initially.