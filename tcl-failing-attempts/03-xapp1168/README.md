Xilinx XAPP1168 - Packaging Custom AXI IP for Vivado IP Integrator - can easily be downloaded. The documents I found are released on 01-jun-2013.
That's quite some time ago and I have the impression the whole IP integrator thing has changed over time.

It contains a single `source.tcl` file packing a few components into a folder. Not bad at all, until you go find what's inside there.
None come with `.c` driver files and the `component.xml` files I've looked in doesn't seem to even support their generation later as they don't seem to capture any register information at all.

The `.zip` archive files have the same contents.

There is some parameter validation. Parameter validation lists are explicitly provided in TCL.

The workflow is sorta project-based as it calls `create_project`; the whole thing is based on packaging the current project by using `ipx::package_project`.
Leaving aside when I think "project" I think "Vivado project mode" which equals to "pain" in my book, as I wrote *project* is just a sticker and we already used some project structure behind the scenes so let's just adapt XAPP1168 to our uses.

Truth to be told, there's nothing really there: I've [written profusely about it already](../../pseudo-reference/xapp1168); this is just a placeholder and a shrine of broken hope in case you have missed the other document.

I think the lack of support of this method for in-memory tells enough to note it again.

💩💩💩