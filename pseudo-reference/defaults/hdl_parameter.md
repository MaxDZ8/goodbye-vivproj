Example command (using `$busAxi` as defined in the example script):
```
set investigate [ ipx::add_hdl_parameter TEST $periph ]
hdl_parameter component_1 TEST
list_property $investigate
CLASS CONFIG_GROUPS DATA_TYPE DESCRIPTION DISPLAY_NAME ENABLEMENT_DEPENDENCY ENABLEMENT_PRESENCE ENABLEMENT_RESOLVE_TYPE ENABLEMENT_TCL_EXPR ENABLEMENT_TCL_EXPR_ARGUMENTS ENABLEMENT_VALUE IPXACT_ID NAME ORDER PARAMETER_TYPES USAGE VALUE VALUE_BIT_STRING_LENGTH VALUE_DEPENDENCY VALUE_FORMAT VALUE_RESOLVE_TYPE VALUE_SOURCE VALUE_TCL_EXPR VALUE_TCL_EXPR_ARGUMENTS VALUE_VALIDATION_LIST VALUE_VALIDATION_PAIRS VALUE_VALIDATION_RANGE_MAXIMUM VALUE_VALIDATION_RANGE_MINIMUM VALUE_VALIDATION_TYPE
```

Compared to the bus interface parameter it seems to have one extra `DATA_TYPE` field.

And then investigating the properties as:
```
get_property CLASS                          $investigate
get_property CONFIG_GROUPS                  $investigate
get_property DATA_TYPE                      $investigate
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

Produces the following values.


| Property                       | Initial value      |
|--------------------------------|--------------------|
| CLASS                          | hdl_parameter      |
| CONFIG_GROUPS                  |                    |
| DATA_TYPE                      |                    |
| DESCRIPTION                    |                    |
| DISPLAY_NAME                   |                    |
| ENABLEMENT_DEPENDENCY          |                    |
| ENABLEMENT_PRESENCE            | optional           |
| ENABLEMENT_RESOLVE_TYPE        | immediate          |
| ENABLEMENT_TCL_EXPR            |                    |
| ENABLEMENT_TCL_EXPR_ARGUMENTS  |                    |
| ENABLEMENT_VALUE               | 1                  |
| IPXACT_ID                      | MODELPARAM_VALUE.TEST |
| NAME                           | TEST               |
| ORDER                          | 0.000              |
| PARAMETER_TYPES                |                    |
| USAGE                          | all                |
| VALUE                          |                    |
| VALUE_BIT_STRING_LENGTH        | 0                  |
| VALUE_DEPENDENCY               |                    |
| VALUE_FORMAT                   | string             |
| VALUE_RESOLVE_TYPE             | immediate          |
| VALUE_SOURCE                   | default            |
| VALUE_TCL_EXPR                 |                    |
| VALUE_TCL_EXPR_ARGUMENTS       |                    |
| VALUE_VALIDATION_LIST          |                    |
| VALUE_VALIDATION_PAIRS         |                    |
| VALUE_VALIDATION_RANGE_MAXIMUM |                    |
| VALUE_VALIDATION_RANGE_MINIMUM |                    |
| VALUE_VALIDATION_TYPE          | none               |