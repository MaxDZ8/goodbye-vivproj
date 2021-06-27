file mkdir ip_repo

create_project -part {xc7z020clg400-1} -force dummyProjectName garbageDir 
add_files -norecurse {
    rtl/add_some_bitz_v1_0.v
    rtl/add_some_bitz_v1_0_S00_AXI.sv
    rtl/mdz_custom_logic.sv
}
import_files -force -norecurse
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project 
set_property library {user} [ipx::current_core]
set_property vendor_display_name {YourCompanyName} [ipx::current_core]
set_property company_url {www.YourCompanyName.com} [ipx::current_core]
set_property company_url {http://www.YourCompanyName.com} [ipx::current_core]
set_property vendor {YourCompanyName.com} [ipx::current_core]
set_property supported_families {{zynq} {Pre-Production}} [ipx::current_core]
set_property taxonomy {{/Embedded_Processing/AXI_Infrastructure}} [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::archive_core {ip_repo/YourCompanyName.com_example_thing.zip} [ipx::current_core]
close_project
