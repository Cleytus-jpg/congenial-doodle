/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 0071091E
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 591548DD
/// @DnDComment : cost: This variable holds the cost of the tower$(13_10)$(13_10)range: This variable holds the tower's range$(13_10)$(13_10)ready_to_fire: This variable says whether or not the tower is ready to fire$(13_10)$(13_10)fire_delay: This variable stores the amount of frames to wait between firing$(13_10)$(13_10)chain_amount: This variable holds how often the arc can chain$(13_10)$(13_10)power_level: This variable holds the arc tower's power leve. It can fire when it reaches 1$(13_10)$(13_10)power_charge: This variable controls how fast the power_level is charged up
/// @DnDInput : 7
/// @DnDArgument : "expr" "30"
/// @DnDArgument : "expr_1" "260"
/// @DnDArgument : "expr_2" "false"
/// @DnDArgument : "expr_3" "room_speed * 2.5"
/// @DnDArgument : "expr_6" "0.02"
/// @DnDArgument : "var" "cost"
/// @DnDArgument : "var_1" "range"
/// @DnDArgument : "var_2" "ready_to_fire"
/// @DnDArgument : "var_3" "fire_delay"
/// @DnDArgument : "var_4" "chain_amount"
/// @DnDArgument : "var_5" "power_level"
/// @DnDArgument : "var_6" "power_charge"
cost = 30;
range = 260;
ready_to_fire = false;
fire_delay = room_speed * 2.5;
chain_amount = 0;
power_level = 0;
power_charge = 0.02;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 6F1528F5
/// @DnDComment : Set alarm 0 to the fire delay (alarm 0 sets ready_to_fire to true)
/// @DnDArgument : "steps" "fire_delay"
alarm_set(0, fire_delay);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 6B3A4BD1
/// @DnDComment : Create a new layer with the proper depth$(13_10)for our sequence
/// @DnDArgument : "var" "_layer"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "layer_create"
/// @DnDArgument : "arg" "depth"
var _layer = layer_create(depth);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 5E811EFA
/// @DnDComment : Use our custom function to animate this instance using a sequence
/// @DnDInput : 5
/// @DnDArgument : "function" "animate_with_sequence"
/// @DnDArgument : "arg" "_layer"
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y"
/// @DnDArgument : "arg_3" "seq_tower_build"
/// @DnDArgument : "arg_4" "obj_tower_archer_dummy"
animate_with_sequence(_layer, x, y, seq_tower_build, obj_tower_archer_dummy);