Some panels are way more complicated than others and require their own pages.

# Identification panel

![IpPackager, first panel](./01_ip_pckgr_identification_annotated.png)

1. `get_property vendor [ ipx::current_core ]`
2. `get_property library [ ipx::current_core ]`
3. `get_property name [ ipx::current_core ]`
4. `get_property version [ ipx::current_core ]`
5. `get_property display_name [ ipx::current_core ]`
6. `get_property description [ ipx::current_core ]`
7. `get_property vendor_display_name [ ipx::current_core ]`
8. `get_property company_url [ ipx::current_core ]`
9. Will pop a window where you can enable "categories", see [available taxonomies](../pseudo-reference/taxonomies.md)
10. Enabled when you click a category aka taxonomy
11. Move up a selected non-first category in the graphic list. Oddly, it doesn't seem to really change the `taxonomy` field.
12. Move down non-last, see above.

You might be interested in knowing [properties of an AXI component](../pseudo-reference/axi-component-properties.md)   

