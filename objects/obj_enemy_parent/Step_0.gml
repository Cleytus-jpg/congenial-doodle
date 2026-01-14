/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 27754024
/// @DnDComment : Get the direction the enemy is moving
/// @DnDInput : 4
/// @DnDArgument : "var" "_dir"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "point_direction"
/// @DnDArgument : "arg" "x_previous"
/// @DnDArgument : "arg_1" "y_previous"
/// @DnDArgument : "arg_2" "x"
/// @DnDArgument : "arg_3" "y"
var _dir = point_direction(x_previous, y_previous, x, y);

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 22A454CE
/// @DnDComment : If that direction is pointed up
/// @DnDInput : 2
/// @DnDArgument : "expr" "_dir < 135"
/// @DnDArgument : "expr_1" "_dir > 45"
if(_dir < 135 && _dir > 45)
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 32C46F14
	/// @DnDComment : Set the sprite to the walk up sprite$(13_10)(make sure the frame is relative to its current frame)
	/// @DnDParent : 22A454CE
	/// @DnDArgument : "imageind_relative" "1"
	/// @DnDArgument : "spriteind" "walk_up_sprite"
	sprite_index = walk_up_sprite;
	image_index += 0;

	/// @DnDAction : YoYo Games.Paths.Path_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 6C12884A
	/// @DnDComment : Use the vertical path speed
	/// @DnDParent : 22A454CE
	/// @DnDArgument : "speed" "v_speed"
	path_speed = v_speed;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 083A7D0F
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 76E90E73
	/// @DnDComment : If that direction is pointed down
	/// @DnDInput : 2
	/// @DnDParent : 083A7D0F
	/// @DnDArgument : "expr" "_dir > 235"
	/// @DnDArgument : "expr_1" "_dir < 315"
	if(_dir > 235 && _dir < 315)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 08933B53
		/// @DnDComment : Set the sprite to the walk down sprite$(13_10)(make sure the frame is relative to its current frame)
		/// @DnDParent : 76E90E73
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "walk_down_sprite"
		sprite_index = walk_down_sprite;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Paths.Path_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 4FF802C3
		/// @DnDComment : Use the vertical path speed
		/// @DnDParent : 76E90E73
		/// @DnDArgument : "speed" "v_speed"
		path_speed = v_speed;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 7F1E9806
	/// @DnDComment : Otherwise the enemy is moving sideways
	/// @DnDParent : 083A7D0F
	else
	{
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 2D19ABF0
		/// @DnDComment : Set the sprite to the sideways sprite$(13_10)(make sure the frame is relative to its current frame)
		/// @DnDParent : 7F1E9806
		/// @DnDArgument : "imageind_relative" "1"
		/// @DnDArgument : "spriteind" "walk_side_sprite"
		sprite_index = walk_side_sprite;
		image_index += 0;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1501A97A
		/// @DnDComment : Get the sprite's direction
		/// @DnDParent : 7F1E9806
		/// @DnDArgument : "var" "_x_scale"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "sign"
		/// @DnDArgument : "arg" "x - x_previous"
		var _x_scale = sign(x - x_previous);
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Scale
		/// @DnDVersion : 1
		/// @DnDHash : 3406F85D
		/// @DnDComment : Set the sprite's direction
		/// @DnDParent : 7F1E9806
		/// @DnDArgument : "xscale" "_x_scale"
		image_xscale = _x_scale;
		image_yscale = 1;
	
		/// @DnDAction : YoYo Games.Paths.Path_Speed
		/// @DnDVersion : 1
		/// @DnDHash : 1B36BE21
		/// @DnDComment : Set path speed to normal speed
		/// @DnDParent : 7F1E9806
		/// @DnDArgument : "speed" "my_speed"
		path_speed = my_speed;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 44DC4F7C
	/// @DnDComment : Save it's current x and y
	/// @DnDInput : 2
	/// @DnDParent : 083A7D0F
	/// @DnDArgument : "expr" "x"
	/// @DnDArgument : "expr_1" "y"
	/// @DnDArgument : "var" "x_previous"
	/// @DnDArgument : "var_1" "y_previous"
	x_previous = x;
	y_previous = y;
}