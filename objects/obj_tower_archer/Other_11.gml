/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 206956EF
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 37EE5E54
/// @DnDComment : Increase the range by 125%$(13_10)$(13_10)Decrease the fire delay
/// @DnDInput : 2
/// @DnDArgument : "expr" "range * 1.25"
/// @DnDArgument : "expr_1" "fire_delay * 0.95"
/// @DnDArgument : "var" "range"
/// @DnDArgument : "var_1" "fire_delay"
range = range * 1.25;
fire_delay = fire_delay * 0.95;