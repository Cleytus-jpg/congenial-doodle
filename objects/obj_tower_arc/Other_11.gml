/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 311F36ED
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 74C94DDF
/// @DnDComment : Increase the range by 125%$(13_10)$(13_10)Decrease the fire delay$(13_10)$(13_10)Increase the amount of chains the arc can make
/// @DnDInput : 3
/// @DnDArgument : "expr" "range * 1.25"
/// @DnDArgument : "expr_1" "fire_delay * 0.95"
/// @DnDArgument : "expr_2" "1"
/// @DnDArgument : "expr_relative_2" "1"
/// @DnDArgument : "var" "range"
/// @DnDArgument : "var_1" "fire_delay"
/// @DnDArgument : "var_2" "chain_amount"
range = range * 1.25;
fire_delay = fire_delay * 0.95;
chain_amount += 1;