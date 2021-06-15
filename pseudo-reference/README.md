# Wannabe TCL command reference

Also check the [`ipx` namespace](./ipx/README.md).

Vivado Design Suite Tcl Command Reference Guide (UG835) further notes other commands: in the *CreatePeripheral* and *IpFlow* category but to build the project (as in the sense of TCL script-based-project) additional commands are needed.
Some of the useful commands include:

| Command                                               | Description                                                       |
|-------------------------------------------------------|-------------------------------------------------------------------|
| [generate_peripheral](./ug835/generate_peripheral.md) | Pretend to "generate output products for peripheral object" while delivering headaches. |

Commands are a thing, but their parameters and properties are another.

1. Available [taxonomies](./taxonomies.md) (aka "categories", in their dialog).
2. [Properties](./axi-component-properties.md) of an AXI component.
3. [Bus interfaces](./bus-interfaces.md) of a component created by the regular project-based flow. Bus interface parameters included.
4. [Ports](./io-ports.md) of a component created by the regular project-based flow **and** supporting some custom ports for the lulz (I usually just drive feedback LEDs or throw them away).
5. [Port maps](./port-maps.md), putting ports into bus interfaces.

If you need to write TCL you probably want to know a starting point.
1. Default value of a [bus interface parameter](./defaults/bus-interface-parameter.md)