/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6A4A520D
/// @DnDComment : Set depth based on its y value
/// @DnDArgument : "expr" "-y"
/// @DnDArgument : "var" "depth"
depth = -y;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 7E56E751
/// @DnDComment : Set the distance calculation a bit up $(13_10)from the base of the sprite
/// @DnDArgument : "var" "_target_y"
/// @DnDArgument : "value" "y - 39"
var _target_y = y - 39;

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 3952BBA8
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
/// @DnDHash : 0C7609D9
/// @DnDComment : Loop through all current enemies
/// @DnDApplyTo : obj_enemy_parent
with(obj_enemy_parent) {
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 34C57B6D
	/// @DnDComment : Create a value based off the ellipse position and the position of the enemy for ellipse equation$(13_10)thats is used to check if the distance x squared divided by the x range squared $(13_10)plus the distance y squared divided by the range y squared is less than 1
	/// @DnDParent : 0C7609D9
	/// @DnDArgument : "var" "_check_ellipse_collision"
	/// @DnDArgument : "value" "(sqr(x - other.x)/sqr(other.range)) + (sqr(y - _target_y)/sqr(other.range * 0.75))"
	var _check_ellipse_collision = (sqr(x - other.x)/sqr(other.range)) + (sqr(y - _target_y)/sqr(other.range * 0.75));

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 58F175E1
	/// @DnDComment : Performs the check to see if the enemy is in range based on the calculated value
	/// @DnDParent : 0C7609D9
	/// @DnDArgument : "var" "_check_ellipse_collision"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "1"
	if(_check_ellipse_collision < 1)
	{
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 530843B6
		/// @DnDComment : Check to see if either this is the first enemy (_farthest == noone) or$(13_10)its farther along the path than the last closest enemy (path_position > _farthest_val)
		/// @DnDParent : 58F175E1
		/// @DnDArgument : "expr" "(_farthest == noone) || (path_position > _farthest_val) "
		if((_farthest == noone) || (path_position > _farthest_val) )
		{
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 421DD12A
			/// @DnDComment : If it is, save its id as _farthest so that it can be compared to the next enemy$(13_10)$(13_10)Save its distance as _farthest_val value so that it can be compared to the next enemy
			/// @DnDInput : 2
			/// @DnDParent : 530843B6
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
/// @DnDHash : 1620B8D3
/// @DnDComment : See if we found an enemy to target (_farthest will contain an instanc id$(13_10)if there was a viable target) and check if we are ready to fire
/// @DnDInput : 2
/// @DnDArgument : "expr" "_farthest != noone"
/// @DnDArgument : "expr_1" "ready_to_fire"
if(_farthest != noone && ready_to_fire)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5FFCDD20
	/// @DnDComment : Start charging up
	/// @DnDParent : 1620B8D3
	/// @DnDArgument : "expr" "power_charge"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "power_level"
	power_level += power_charge;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4DFDD255
	/// @DnDComment : Once the tower is charged, it is ready to fire
	/// @DnDParent : 1620B8D3
	/// @DnDArgument : "var" "power_level"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "1"
	if(power_level >= 1)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 475D0971
		/// @DnDComment : Deal damage immedaitely
		/// @DnDInput : 2
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "function" "deal_damage"
		/// @DnDArgument : "arg" "_farthest"
		/// @DnDArgument : "arg_1" "2"
		deal_damage(_farthest, 2);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 077DEF56
		/// @DnDComment : power_level: Reset power level to 0$(13_10)$(13_10)ready_to_fire: Set ready to fire to false so the tower can't fire again right away
		/// @DnDInput : 2
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "expr_1" "false"
		/// @DnDArgument : "var" "power_level"
		/// @DnDArgument : "var_1" "ready_to_fire"
		power_level = 0;
		ready_to_fire = false;
	
		/// @DnDAction : YoYo Games.Instances.Set_Alarm
		/// @DnDVersion : 1
		/// @DnDHash : 0BBE2F40
		/// @DnDComment : Set alarm zero to the fire_delay
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "steps" "fire_delay"
		alarm_set(0, fire_delay);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 5AFEC162
		/// @DnDComment : Get the direction to the enemy (offsetting the y value)$(13_10)so that it doesn't spawn and target the bottom of the sprites
		/// @DnDInput : 4
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "var" "_dir"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "point_direction"
		/// @DnDArgument : "arg" "x"
		/// @DnDArgument : "arg_1" "y - 122"
		/// @DnDArgument : "arg_2" "_farthest.x"
		/// @DnDArgument : "arg_3" "_farthest.y - 125"
		var _dir = point_direction(x, y - 122, _farthest.x, _farthest.y - 125);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 26FCDF02
		/// @DnDComment : Create a new layer just above this onev
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "var" "_layer"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "layer_create"
		/// @DnDArgument : "arg" "depth - 1"
		var _layer = layer_create(depth - 1);
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Create
		/// @DnDVersion : 1
		/// @DnDHash : 2E19EF65
		/// @DnDComment : Create the fire fade sequence
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "xpos" "x"
		/// @DnDArgument : "ypos" "y "
		/// @DnDArgument : "var" ""
		/// @DnDArgument : "sequenceid" "seq_arc_fire_fade"
		/// @DnDArgument : "layer" "_layer"
		/// @DnDSaveInfo : "sequenceid" "seq_arc_fire_fade"
		layer_sequence_create(_layer, x, y , seq_arc_fire_fade);
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Create
		/// @DnDVersion : 1
		/// @DnDHash : 3D8B5F0B
		/// @DnDComment : Create the fire fade sequence
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "xpos" "x"
		/// @DnDArgument : "ypos" "y - 134"
		/// @DnDArgument : "var" "_seq"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "sequenceid" "seq_arc_fire"
		/// @DnDArgument : "layer" "_layer"
		/// @DnDSaveInfo : "sequenceid" "seq_arc_fire"
		var _seq = layer_sequence_create(_layer, x, y - 134, seq_arc_fire);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1CA76D29
		/// @DnDComment : Set the sequence's angle using the id and direction we just calculated
		/// @DnDInput : 2
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "function" "layer_sequence_angle"
		/// @DnDArgument : "arg" "_seq"
		/// @DnDArgument : "arg_1" "_dir"
		layer_sequence_angle(_seq, _dir);
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 544879ED
		/// @DnDComment : Create a new instance of the arc and save$(13_10)its id to inst so it can be accessed by the next event
		/// @DnDInput : 4
		/// @DnDParent : 4DFDD255
		/// @DnDArgument : "var" "_inst"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "instance_create_depth"
		/// @DnDArgument : "arg" "x"
		/// @DnDArgument : "arg_1" "y - 134"
		/// @DnDArgument : "arg_2" "depth"
		/// @DnDArgument : "arg_3" "obj_arc_new"
		var _inst = instance_create_depth(x, y - 134, depth, obj_arc_new);
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 688D61AF
		/// @DnDApplyTo : _inst
		/// @DnDParent : 4DFDD255
		with(_inst) {
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5514B4F6
			/// @DnDComment : Set the target id to the id of the enemy we're targeting
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "expr" "_farthest"
			/// @DnDArgument : "var" "target"
			target = _farthest;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 0276F3C0
			/// @DnDComment : Push that id onto the targets_hit_array so it can't be targeted again
			/// @DnDInput : 2
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "function" "array_push"
			/// @DnDArgument : "arg" "targets_hit_array"
			/// @DnDArgument : "arg_1" "target"
			array_push(targets_hit_array, target);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 226AF9D6
			/// @DnDComment : Set the amount of chains remaining to the amount $(13_10)of chains remaining of the arc that created it
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "expr" "other.chain_amount"
			/// @DnDArgument : "var" "chains_remaining"
			chains_remaining = other.chain_amount;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 60054D34
			/// @DnDComment : Set the target's x, y, and depth
			/// @DnDInput : 3
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "expr" "target.x"
			/// @DnDArgument : "expr_1" "target.y"
			/// @DnDArgument : "expr_2" "target.depth"
			/// @DnDArgument : "var" "target_x"
			/// @DnDArgument : "var_1" "target_y"
			/// @DnDArgument : "var_2" "target_depth"
			target_x = target.x;
			target_y = target.y;
			target_depth = target.depth;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 2D5799EC
			/// @DnDComment : Have this new arc point towards its target
			/// @DnDInput : 4
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "var" "image_angle"
			/// @DnDArgument : "function" "point_direction"
			/// @DnDArgument : "arg" "x"
			/// @DnDArgument : "arg_1" "y"
			/// @DnDArgument : "arg_2" "target_x"
			/// @DnDArgument : "arg_3" "target_y - 125"
			image_angle = point_direction(x, y, target_x, target_y - 125);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 3679A332
			/// @DnDComment : Get the distance to the target
			/// @DnDInput : 4
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "var" "image_xscale"
			/// @DnDArgument : "function" "point_distance"
			/// @DnDArgument : "arg" "x"
			/// @DnDArgument : "arg_1" "y"
			/// @DnDArgument : "arg_2" "target_x"
			/// @DnDArgument : "arg_3" "target_y - 125"
			image_xscale = point_distance(x, y, target_x, target_y - 125);
		
			/// @DnDAction : YoYo Games.Instances.Sprite_Scale
			/// @DnDVersion : 1
			/// @DnDHash : 694FB106
			/// @DnDComment : Scale the arc by how close it is to its target
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "xscale" "image_xscale / sprite_get_width(sprite_index)"
			image_xscale = image_xscale / sprite_get_width(sprite_index);
			image_yscale = 1;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 0E5A6F55
			/// @DnDComment : Create a new instance of the arc_hit$(13_10)and save its instance id for use with the next event
			/// @DnDInput : 4
			/// @DnDParent : 688D61AF
			/// @DnDArgument : "var" "_inst"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "instance_create_depth"
			/// @DnDArgument : "arg" "_farthest.x"
			/// @DnDArgument : "arg_1" "_farthest.y - 125"
			/// @DnDArgument : "arg_2" "_farthest.depth - 15"
			/// @DnDArgument : "arg_3" "obj_arc_hit"
			var _inst = instance_create_depth(_farthest.x, _farthest.y - 125, _farthest.depth - 15, obj_arc_hit);
		
			/// @DnDAction : YoYo Games.Common.Apply_To
			/// @DnDVersion : 1
			/// @DnDHash : 2AD6CBF1
			/// @DnDApplyTo : _inst
			/// @DnDParent : 688D61AF
			with(_inst) {
				/// @DnDAction : YoYo Games.Common.If_Expression
				/// @DnDVersion : 1
				/// @DnDHash : 60DE2181
				/// @DnDComment : Check if the direction is to the left
				/// @DnDInput : 2
				/// @DnDParent : 2AD6CBF1
				/// @DnDArgument : "expr" "_dir > 90"
				/// @DnDArgument : "expr_1" "_dir < 270"
				if(_dir > 90 && _dir < 270)
				{
					/// @DnDAction : YoYo Games.Instances.Sprite_Scale
					/// @DnDVersion : 1
					/// @DnDHash : 5F0C11EF
					/// @DnDComment : If so, invert the xscale
					/// @DnDParent : 60DE2181
					/// @DnDArgument : "xscale" "-1"
					image_xscale = -1;
					image_yscale = 1;
				}
			}
		}
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 78EEF2F2
/// @DnDComment : If there's no target or we're not ready to fire
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 03616D2B
	/// @DnDComment : Power down
	/// @DnDParent : 78EEF2F2
	/// @DnDArgument : "expr" "-power_charge"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "power_level"
	power_level += -power_charge;
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 58C5CA81
/// @DnDComment : Clamp the power level between 0 and 1
/// @DnDInput : 3
/// @DnDArgument : "var" "power_level"
/// @DnDArgument : "function" "clamp"
/// @DnDArgument : "arg" "power_level"
/// @DnDArgument : "arg_1" "0"
/// @DnDArgument : "arg_2" "1"
power_level = clamp(power_level, 0, 1);