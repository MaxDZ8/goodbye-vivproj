Example command (using `$busAxi` as defined in the example script):
```
set investigate [ ipx::add_bus_parameter WIZ_DATA_WIDTH $busAxi ]
bus_parameter component_1 S00_AXI WIZ_DATA_WIDTH
```

And then investigating the properties as:
```
get_property CLASS                          $investigate
get_property CONFIG_GROUPS                  $investigate
get_property DESCRIPTION                    $investigate
get_property DISPLAY_NAME                   $investigate
get_property ENABLEMENT_DEPENDENCY          $investigate
get_property ENABLEMENT_PRESENCE            $investigate
get_property ENABLEMENT_RESOLVE_TYPE        $investigate
get_property ENABLEMENT_TCL_EXPR            $investigate
get_property ENABLEMENT_TCL_EXPR_ARGUMENTS  $investigate
get_property ENABLEMENT_VALUE               $investigate
get_property IPXACT_ID                      $investigate
get_property NAME                           $investigate
get_property ORDER                          $investigate
get_property PARAMETER_TYPES                $investigate
get_property USAGE                          $investigate
get_property VALUE                          $investigate
get_property VALUE_BIT_STRING_LENGTH        $investigate
get_property VALUE_DEPENDENCY               $investigate
get_property VALUE_FORMAT                   $investigate
get_property VALUE_RESOLVE_TYPE             $investigate
get_property VALUE_SOURCE                   $investigate
get_property VALUE_TCL_EXPR                 $investigate
get_property VALUE_TCL_EXPR_ARGUMENTS       $investigate
get_property VALUE_VALIDATION_LIST          $investigate
get_property VALUE_VALIDATION_PAIRS         $investigate
get_property VALUE_VALIDATION_RANGE_MAXIMUM $investigate
get_property VALUE_VALIDATION_RANGE_MINIMUM $investigate
get_property VALUE_VALIDATION_TYPE          $investigate
```

Produces the following.


| Property                       | Initial value      |
|--------------------------------|--------------------|
| CLASS                          | bus_parameter      |
| CONFIG_GROUPS                  |                    |
| DESCRIPTION                    |                    |
| DISPLAY_NAME                   |                    |
| ENABLEMENT_DEPENDENCY          |                    |
| ENABLEMENT_PRESENCE            | optional           |
| ENABLEMENT_RESOLVE_TYPE        | immediate          |
| ENABLEMENT_TCL_EXPR            |                    |
| ENABLEMENT_TCL_EXPR_ARGUMENTS  |                    |
| ENABLEMENT_VALUE               | 1                  |
| IPXACT_ID                      | BUSIFPARAM_VALUE.S00_AXI.WIZ_DATA_WIDTH      |
| NAME                           | WIZ_DATA_WIDTH     |
| ORDER                          | 0.000              |
| PARAMETER_TYPES                |                    |
| USAGE                          | all                |
| VALUE                          | 32                 |
| VALUE_BIT_STRING_LENGTH        | 0                  |
| VALUE_DEPENDENCY               |                    |
| VALUE_FORMAT                   | long               |
| VALUE_RESOLVE_TYPE             | immediate          |
| VALUE_SOURCE                   | default            |
| VALUE_TCL_EXPR                 |                    |
| VALUE_TCL_EXPR_ARGUMENTS       |                    |
| VALUE_VALIDATION_LIST          | 32                 |
| VALUE_VALIDATION_PAIRS         | 32 32              |
| VALUE_VALIDATION_RANGE_MAXIMUM |                    |
| VALUE_VALIDATION_RANGE_MINIMUM |                    |
| VALUE_VALIDATION_TYPE          | list               |
