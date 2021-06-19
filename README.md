# Introduction
This repository contains no code. I will be adding TCL snippets to avoid the use of Vivado "Project Mode".

If you are like me, just wanting to take an occasional peek at FPGAs in your spare time, you might want to try something that works but most likely you appreciate getting something done and start by the book. The book by Xilinx will tell you to go by Vivado in "project mode" and since it very looks like anything any decent IDE does, you get on it. After all, it is supposed to be the best for basic use and that's what we do right? What's the point to complicate your life with all the advanced solutions? Sure, people are using them for their advanced projects but we can just afford to take it easy isn't it?

Not quite. You soon find out Vivado has many shortcomings in "Project" mode. Eventually the system goes a way you spend more time fighting it than working on your interests. You even need to consume nonsensical amounts of efforts in trying to understand what should be in source-control and what is byproduct. 

I'm fed enough with that.

Let me clarify a thing: officially "project mode" is when you fiddle with an `.xpr` file. The issue isn't really with this `.xpr` file by itself; it is fairly decent idea in concept. The issue is in how it is built and in its assumptions. The real issue is in all the implicit, taken for granted ideas it brings with it.

The way Vivado and the Synthesis/Implementation works is you always need a project in a broader sense: the `.xpr` is the "official" project but TCL scripts can provide projects as well. This might be shocking if you think in terms of stickers but I don't; for all practical purposes they could call it *bucket mode* and *butterfly mode* and it would make no difference but what's the point?

The point is: you have heard about TCL mode but you are concerned the documentation is sparse and incomplete. You find snippets here and there, but it seems you'll have to string them together into a workflow. The TCL is deemed "complicated" and it's like 1234 pages. In this situation no wonder the official project mode keeps staying alive.

In this repository, I will try to aggregate everything needed to pull up a decent flow with no `.xpr` files. I also ban the use of everything involving the official project mode (many resources I found firstly hook up to creating a project first, and this becomes absolutely opaque real fast).

I will be building lean-and-mean projects by means of basic TCL commands only. No shortcuts allowed. By the time this is finished, I hope we'll all agree there is a kind of project expressed by TCL which is just a better, simpler, idea.

# Proposed flows

Those documents will attempt to build a methodology to produce work in multiple, iterative steps. For the time being I'll be focusing on compute acceleration.

1. At first, you have a need. You analyze the designed algorithm and figure how to interface it.
2. Let's agree to put it as an AXI IP to be later used in a block design
3. You therefore need a *main* project and a *device* project; after creating the second, you'll be working on it most of the time
4. The device project will get source (Verilog and SystemVerilog) and bench sources. We iterate on this project till a "release" (not necessarily production-ready)
5. The device is exported back to the *main* project as means of a component for block design integration. What does this include? Conventional wisdom suggests to include testbenches and several documentation files but I disagree. In most languages, libraries are just code and I will be focusing on that.

The document is divided in a few sections, while all try to build this workflow, none is a direct mapping as this is a work in progress.

# Pseudo-reference

Collects various informations about the [TCL commands](./pseudo-reference/README.md) involved and resulting TCL structure values. Ideally includes information about `ipx::*` and `ipgui::*` commands as well as those reported by UG835 (Vivado Design Suite Tcl Command Reference Guide).

The goal of this section is to be a go-to for details. There's little to no effort in putting things together unless necessary to collect additional usage information. Meant to isolate a minimum amount of commands, in case you think grokking UG835 is a bit scary (1910 pages for 2020.2).

# Officially making a device

Document and examine the flow of creating an AXI device by GUI so I can annotate the TCL and later reproduce the results.

1. [Creating the main project](./canon/01_main_creation/README.md)
2. [Initiating generation of device project](./canon/02_device_creation/README.md)
3. [Customizing the device](./canon/03_device_customization/README.md)
4. [Data dump](./canon/04_dump) of the GUI generated component.