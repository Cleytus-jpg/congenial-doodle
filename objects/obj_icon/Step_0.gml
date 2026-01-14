/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 17F89A21
/// @DnDArgument : "obj" "my_button"
/// @DnDArgument : "not" "1"
var l17F89A21_0 = false;
l17F89A21_0 = instance_exists(my_button);
if(!l17F89A21_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 11A74E35
	/// @DnDParent : 17F89A21
	instance_destroy();

	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 054ED7AA
	/// @DnDParent : 17F89A21
	exit;
}

/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 3B96F0AD
/// @DnDArgument : "imageind" "my_button.image_index"
/// @DnDArgument : "spriteind" "sprite_index"
sprite_index = sprite_index;
image_index = my_button.image_index;

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2E9462EF
/// @DnDInput : 2
/// @DnDArgument : "expr" "finished"
/// @DnDArgument : "expr_1" "in_sequence"
/// @DnDArgument : "not_1" "1"
if(finished && !(in_sequence))
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 659A8D6E
	/// @DnDParent : 2E9462EF
	/// @DnDArgument : "var" "sprite_index"
	/// @DnDArgument : "value" "spr_tower_icon_tick"
	if(sprite_index == spr_tower_icon_tick)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4AA21B6C
		/// @DnDParent : 659A8D6E
		/// @DnDArgument : "var" "_spr"
		/// @DnDArgument : "value" "starting_sprite"
		var _spr = starting_sprite;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 085929B5
	/// @DnDParent : 2E9462EF
	else
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 713E75EB
		/// @DnDParent : 085929B5
		/// @DnDArgument : "var" "_spr"
		/// @DnDArgument : "value" "spr_tower_icon_tick"
		var _spr = spr_tower_icon_tick;
	}

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 4E1B2655
	/// @DnDApplyTo : my_button
	/// @DnDParent : 2E9462EF
	with(my_button) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 046268DE
		/// @DnDInput : 6
		/// @DnDParent : 4E1B2655
		/// @DnDArgument : "var" "my_icon"
		/// @DnDArgument : "function" "create_icon"
		/// @DnDArgument : "arg" "x + 3"
		/// @DnDArgument : "arg_1" "y - 27"
		/// @DnDArgument : "arg_2" ""SequenceIcons""
		/// @DnDArgument : "arg_3" "id"
		/// @DnDArgument : "arg_4" "_spr"
		/// @DnDArgument : "arg_5" "other.starting_sprite"
		my_icon = create_icon(x + 3, y - 27, "SequenceIcons", id, _spr, other.starting_sprite);
	}

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 03E151E2
	/// @DnDParent : 2E9462EF
	instance_destroy();
}