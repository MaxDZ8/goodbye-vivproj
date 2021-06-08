# generate_peripheral
Generate output products for peripheral object.

```
generate_peripheral [‑driver] [‑example_design] [‑bfm_example_design]
                    [‑debug_hw_example_design] [‑enable_interrupt] [‑force] [‑quiet]
                    [‑verbose] <peripheral>
```

| Name                     |  Req / Opt  |        Description        | Notes                      |
|--------------------------|-------------|---------------------------|----------------------------|
| -driver                  |     Opt     | Generate driver for peripheral.                        |
| -example_design          |     Opt     | Generate all supported example designs for peripheral. |
| -bfm_example_design      |     Opt     | Generate bfm simulation example design for peripheral. |
| -debug_hw_example_design |     Opt     | Generate debug hardware example design for peripheral. |
| -enable_interrupt        |     Opt     | Generate peripheral with interrupt suppport.           |
| -force                   |     Opt     | Overwrite the existing IP in the repository.           |
| -quiet                   |     Opt     | Ignore command errors                                  |
| -verbose                 |     Opt     | Suspend message limits during command execution        |
| &lt;peripheral&gt;       |     Req     | peripheral object                                      |

## Abstract
Mistificate the process of assembling a bunch of files by putting them into a black box and adding arbitrary magic, except doing more than this.

Just in case you're wondering no, XAPP1168 does not use this and for good reason.

## An attempt at describing the thing
Imagine for a moment your AXI device is ready to go. It comes neatly inside a directory whose structure is kinda like this:
```
your_axi_thing_0.123
|_ bd
|  |_ ...
|_ drivers
|  |_ ...
|_ hdl
|  |_ ...
|_ xgui
|  |_ ...
|_ component.xml 
```

The goal of this command seems to generate the four folders and their contents. This command does **not** generate `component.xml`, that seems to come out of [write_peripheral](./write_peripheral.md).

A reasonable command such as `generate_peripheral -driver $periph` would generate, for our example design:
```
add_some_bitz_0.7
|_ bd
|  |_ bd.tcl
|_ drivers
|  |_ add_some_bitz_v1_0
|     |_ data
|     |  |_ add_some_bitz.mdd
|     |  |_ add_some_bitz.tcl
|     |_ src
|        |_ add_some_bitz.c
|        |_ add_some_bitz.h
|        |_ add_some_bitz_selftest.c
|        |_ Makefile
|_ hdl
|  |_ add_some_bitz_v0_7.v
|  |_ add_some_bitz_v0_7_S00_AXI.v
|_ xgui
|  |_ add_some_bitz_v0_7.tcl
|_ component.xml 
```

The basic form, `generate_peripheral $periph` would not produce the `drivers` subtree.
The cool thing is, this command does not just write to storage as anyone sane would expect. It doesn't even just stop at producing the glue files such as `add_some_bitz_v0_7_S00_AXI.v`, it goes forward and adds stuff to our carefully built peripheral object.

As a start, if you already have the equivalent of `add_some_bitz_v0_7_S00_AXI.v` and `add_some_bitz_v0_7.v` you are screwed: the command doesn't care about it and generates its own way according to magic. 

So, your custom ports? Don't care. HDL parameters? Nope.

If fiddling with files instead of doing interesting work is your thing, you will enjoy there are more details coming. Those two files, as far as I can tell are "constant" in the sense they are meant to provide you with a start canvas where to hook your custom logic.
OFC producing them doesn't make any sense if you have those files already; there's no way to skip this step but in case you're really starting and need those two things you probably want address width to be computed for you.

You might recall from the [typical project-based flow](../typical/README.md) there's a `WIZ_NUM_REG` property to set so if you are a bit more sane than whoever was mentally tortured into giving birth to project-flow, you probably want something like:

```
set_property VALUE 30 [ipx::get_bus_parameters WIZ_NUM_REG -of_objects [ipx::get_bus_interfaces S00_AXI -of_objects $periph]]
```

## On the perils of calling this blindly

I am describing this for the purpose of attempting to understand the mental condition of the poor programmer who was bribed into writing this thing. The cool thing about TCL non-project mode is you're supposed to have control and to me this means having no surprises. 

Let's consider for example a script such as [this](./exploring/generate_peripheral/blindly_generating.tcl). Let's start from the most macro issues. Execute the script and then do this:
```
write_peripheral $periph
start_gui
```
Now, since we started the GUI we can write, in its TCL console,
```
ipx::open_ipxact_file ./add_some_bitz_0.7/component.xml
```
The "usual" Package IP wizard will appear. You probably see there's a yellow exclamation mark on file groups already. Go there and witness this beauty:
![Two "Synthesis" file groups clashing](./exploring/generate_peripheral/clashing_synthesis_groups.png)

That's cute enough already but as I fiddled with the button, here's how the customization panel looks like:
![Attempting to customize a part I never wanted to deal with](./exploring/generate_peripheral/customization_of_unsupported_part.png)

