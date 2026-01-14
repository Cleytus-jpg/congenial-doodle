/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4B6C77F6
/// @DnDComment : Check if hp is greater than zero
/// @DnDArgument : "var" "hp"
/// @DnDArgument : "op" "2"
if(hp > 0)
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 1CA1CE51
	/// @DnDComment : If it is, exit this event. We only want$(13_10)to run this event if the enemy has been$(13_10)destroyed by losing its health.
	/// @DnDParent : 4B6C77F6
	exit;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0302BE5B
/// @DnDComment : Check if the enemy is walking sideways
/// @DnDArgument : "var" "sprite_index"
/// @DnDArgument : "value" "walk_side_sprite"
if(sprite_index == walk_side_sprite)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1FDB92C3
	/// @DnDComment : Create this instance's defeat_side_object$(13_10)and save its id to a temporary variable
	/// @DnDInput : 4
	/// @DnDParent : 0302BE5B
	/// @DnDArgument : "var" "_inst"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "instance_create_depth"
	/// @DnDArgument : "arg" "x"
	/// @DnDArgument : "arg_1" "y"
	/// @DnDArgument : "arg_2" "depth"
	/// @DnDArgument : "arg_3" "defeat_side_object"
	var _inst = instance_create_depth(x, y, depth, defeat_side_object);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 463A7728
	/// @DnDApplyTo : _inst
	/// @DnDParent : 0302BE5B
	with(_inst) {
		/// @DnDAction : YoYo Games.Instances.Sprite_Scale
		/// @DnDVersion : 1
		/// @DnDHash : 03BA5D0C
		/// @DnDComment : Set image_xscale to the xscale of the instance that created it$(13_10)This will make the newly created instance face the right way
		/// @DnDParent : 463A7728
		/// @DnDArgument : "xscale" "other.image_xscale"
		image_xscale = other.image_xscale;
		image_yscale = 1;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 01609645
/// @DnDComment : If it is not walking sideways
else
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3D97993D
	/// @DnDComment : Create this instance's defeat_down_object
	/// @DnDInput : 4
	/// @DnDParent : 01609645
	/// @DnDArgument : "function" "instance_create_depth"
	/// @DnDArgument : "arg" "x"
	/// @DnDArgument : "arg_1" "y"
	/// @DnDArgument : "arg_2" "depth"
	/// @DnDArgument : "arg_3" "defeat_down_object"
	instance_create_depth(x, y, depth, defeat_down_object);
}