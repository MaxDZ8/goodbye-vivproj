# ipx::current_core
Set or get the currently active component for packaging related commands.
`ipx::current_core  [-quiet] [-verbose] [<comp_ref>]`

| Name           | Req / Opt | Description                                 |
|----------------|-----------|------------
|-quiet          |  opt  | Ignore command errors|
|-verbose        |  opt  | Suspend message limits during command execution|
|&lt;comp_ref&gt;|  opt  | File path or vlnv (: separated) string identifing the component to set.  Leave this blank to simply return an active component|

## Notes
Most useful command ever.
Just add this profusely almost everywhere. Oddly enough, *some* commands basically pull this by themselves while others do not.

It's just a variable the system uses as default in *some* `ipx::` commands. I honestly don't see much of a point in using it in TCL mode besides maybe conforming to an expectation.
