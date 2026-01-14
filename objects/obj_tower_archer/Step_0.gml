/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 138B6736
/// @DnDComment : Set depth based on its y value
/// @DnDArgument : "expr" "-y"
/// @DnDArgument : "var" "depth"
depth = -y;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 7EB0ACB1
/// @DnDComment : Set the distance calculation a bit up $(13_10)from the base of the sprite
/// @DnDArgument : "var" "_target_y"
/// @DnDArgument : "value" "y - 39"
var _target_y = y - 39;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 1C466684
/// @DnDComment : Declare the temporary variables$(13_10)$(13_10)_farthest: This variable stores the id of the next correct enemy to target$(13_10)$(13_10)_farthest_val: This variable stores the distance to the farthest enemy, defaulted to 0
/// @DnDInput : 2
/// @DnDArgument : "var" "_farthest"
/// @DnDArgument : "value" "noone"
/// @DnDArgument : "var_1" "_farthest_val"
/// @DnDArgument : "value_1" "0"
var _farthest = noone;
var _farthest_val = 0;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 388DACB7
/// @DnDComment : Loop through all current enemies
/// @DnDApplyTo : obj_enemy_parent
with(obj_enemy_parent) {
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4F4A01B1
	/// @DnDComment : Create a value based off the ellipse position and the position of the enemy for ellipse equation$(13_10)thats is used to check if the distance x squared divided by the x range squared $(13_10)plus the distance y squared divided by the range y squared is less than 1
	/// @DnDParent : 388DACB7
	/// @DnDArgument : "var" "_check_ellipse_collision"
	/// @DnDArgument : "value" "(sqr(x - other.x)/sqr(other.range)) + (sqr(y - _target_y)/sqr(other.range * 0.75))"
	var _check_ellipse_collision = (sqr(x - other.x)/sqr(other.range)) + (sqr(y - _target_y)/sqr(other.range * 0.75));

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2F10A0A3
	/// @DnDComment : Performs the check to see if the enemy is in range based on the calculated value
	/// @DnDParent : 388DACB7
	/// @DnDArgument : "var" "_check_ellipse_collision"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "1"
	if(_check_ellipse_collision < 1)
	{
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 5629A12C
		/// @DnDComment : Check to see if either this is the first enemy (_farthest == noone) or$(13_10)its farther along the path than the last closest enemy (path_position > _farthest_val)
		/// @DnDParent : 2F10A0A3
		/// @DnDArgument : "expr" "(_farthest == noone) || (path_position > _farthest_val) "
		if((_farthest == noone) || (path_position > _farthest_val) )
		{
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 415CB73B
			/// @DnDComment : If it is, save its id as _farthest so that it can be compared to the next enemy$(13_10)$(13_10)Save its distance as _farthest_val value so that it can be compared to the next enemy
			/// @DnDInput : 2
			/// @DnDParent : 5629A12C
			/// @DnDArgument : "var" "_farthest"
			/// @DnDArgument : "value" "id"
			/// @DnDArgument : "var_1" "_farthest_val"
			/// @DnDArgument : "value_1" "path_position"
			var _farthest = id;
			var _farthest_val = path_position;
		}
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 7A7B3A96
/// @DnDComment : See if we found an enemy to target (_farthest will contain an instanc id$(13_10)if there was a viable target) and check if we are ready to fire
/// @DnDInput : 2
/// @DnDArgument : "expr" "_farthest != noone"
/// @DnDArgument : "expr_1" "ready_to_fire"
if(_farthest != noone && ready_to_fire)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 59D1C3F1
	/// @DnDComment : Create an instance of obj_arrow and $(13_10)save its instance id to use with the next event
	/// @DnDInput : 4
	/// @DnDParent : 7A7B3A96
	/// @DnDArgument : "var" "_inst"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "instance_create_depth"
	/// @DnDArgument : "arg" "x"
	/// @DnDArgument : "arg_1" "y - 100"
	/// @DnDArgument : "arg_2" "depth"
	/// @DnDArgument : "arg_3" "obj_arrow"
	var _inst = instance_create_depth(x, y - 100, depth, obj_arrow);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 081D7640
	/// @DnDApplyTo : _inst
	/// @DnDParent : 7A7B3A96
	with(_inst) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6D2A1734
		/// @DnDComment : Set image_angle using point_direction to get the direction to the target $(13_10)We are offsetting the target's y value because we don't want to shoot at the target's feet
		/// @DnDInput : 4
		/// @DnDParent : 081D7640
		/// @DnDArgument : "var" "image_angle"
		/// @DnDArgument : "function" "point_direction"
		/// @DnDArgument : "arg" "x"
		/// @DnDArgument : "arg_1" "y"
		/// @DnDArgument : "arg_2" "_farthest.x"
		/// @DnDArgument : "arg_3" "_farthest.y - 125"
		image_angle = point_direction(x, y, _farthest.x, _farthest.y - 125);
	
		/// @DnDAction : YoYo Games.Movement.Set_Direction_Free
		/// @DnDVersion : 1
		/// @DnDHash : 3C70DA16
		/// @DnDComment : Set the direction to be the same as the image_angle
		/// @DnDParent : 081D7640
		/// @DnDArgument : "direction" "image_angle"
		direction = image_angle;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 3C8B6178
		/// @DnDComment : Create a layer for our arrow fire sequence so it will be at the right depth
		/// @DnDParent : 081D7640
		/// @DnDArgument : "var" "_layer"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "layer_create"
		/// @DnDArgument : "arg" "-(y + 105)"
		var _layer = layer_create(-(y + 105));
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Create
		/// @DnDVersion : 1
		/// @DnDHash : 2DE3C4CF
		/// @DnDComment : Create a sequence on that layer
		/// @DnDParent : 081D7640
		/// @DnDArgument : "xpos" "x"
		/// @DnDArgument : "ypos" "y"
		/// @DnDArgument : "var" "_seq"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "sequenceid" "seq_arrow_fire"
		/// @DnDArgument : "layer" "_layer"
		/// @DnDSaveInfo : "sequenceid" "seq_arrow_fire"
		var _seq = layer_sequence_create(_layer, x, y, seq_arrow_fire);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 4A54BE51
		/// @DnDComment : Set the sequence's angle to be the same as the arrows
		/// @DnDInput : 2
		/// @DnDParent : 081D7640
		/// @DnDArgument : "function" "layer_sequence_angle"
		/// @DnDArgument : "arg" "_seq"
		/// @DnDArgument : "arg_1" "image_angle"
		layer_sequence_angle(_seq, image_angle);
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1FBBDB0F
	/// @DnDComment : Set ready to fire to false so the tower can't fire again right away
	/// @DnDParent : 7A7B3A96
	/// @DnDArgument : "expr" "false"
	/// @DnDArgument : "var" "ready_to_fire"
	ready_to_fire = false;

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 69B3E8AB
	/// @DnDComment : Set alarm zero to the fire_delay
	/// @DnDParent : 7A7B3A96
	/// @DnDArgument : "steps" "fire_delay"
	alarm_set(0, fire_delay);
}