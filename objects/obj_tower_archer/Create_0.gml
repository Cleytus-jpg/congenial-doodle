/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 217567EE
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 28BF3BFC
/// @DnDComment : cost: This variable holds the cost of the tower$(13_10)$(13_10)range: This variable holds the tower's range$(13_10)$(13_10)ready_to_fire: This variable says whether or not the tower is ready to fire$(13_10)$(13_10)fire_delay: This variable stores the amount of frames to wait between firing
/// @DnDInput : 4
/// @DnDArgument : "expr" "15"
/// @DnDArgument : "expr_1" "260"
/// @DnDArgument : "expr_2" "false"
/// @DnDArgument : "expr_3" "room_speed * 2"
/// @DnDArgument : "var" "cost"
/// @DnDArgument : "var_1" "range"
/// @DnDArgument : "var_2" "ready_to_fire"
/// @DnDArgument : "var_3" "fire_delay"
cost = 15;
range = 260;
ready_to_fire = false;
fire_delay = room_speed * 2;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 5ACA9A76
/// @DnDComment : Set alarm 0 to the fire delay (alarm 0 sets ready_to_fire to true)
/// @DnDArgument : "steps" "fire_delay"
alarm_set(0, fire_delay);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 29447604
/// @DnDComment : Create an instance of obj_archer_top and $(13_10)save the id for use with the next event
/// @DnDInput : 4
/// @DnDArgument : "var" "_inst"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "instance_create_depth"
/// @DnDArgument : "arg" "x"
/// @DnDArgument : "arg_1" "y"
/// @DnDArgument : "arg_2" "depth"
/// @DnDArgument : "arg_3" "obj_tower_archer_top"
var _inst = instance_create_depth(x, y, depth, obj_tower_archer_top);

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 2C4A5AEB
/// @DnDApplyTo : _inst
with(_inst) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 28106B28
	/// @DnDComment : Set my_base to the id of the instance that created it
	/// @DnDParent : 2C4A5AEB
	/// @DnDArgument : "expr" "other.id"
	/// @DnDArgument : "var" "my_base"
	my_base = other.id;
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 21F78F89
/// @DnDComment : Create a new layer with the proper depth$(13_10)for our sequence
/// @DnDArgument : "var" "_layer"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "layer_create"
/// @DnDArgument : "arg" "depth"
var _layer = layer_create(depth);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 24C99329
/// @DnDComment : Use our custom function to animate this instance using a sequence
/// @DnDInput : 5
/// @DnDArgument : "function" "animate_with_sequence"
/// @DnDArgument : "arg" "_layer"
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y"
/// @DnDArgument : "arg_3" "seq_tower_build"
/// @DnDArgument : "arg_4" "obj_tower_archer_dummy"
animate_with_sequence(_layer, x, y, seq_tower_build, obj_tower_archer_dummy);