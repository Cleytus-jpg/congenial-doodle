/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 575EA5DB
/// @DnDComment : Check whether or not a popup menu exists
/// @DnDArgument : "expr" "global.popup_menu_exists"
/// @DnDArgument : "not" "1"
if(!(global.popup_menu_exists))
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 3CA8411C
	/// @DnDComment : If none exist, destroy this menu button
	/// @DnDParent : 575EA5DB
	instance_destroy();
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 530064D8
/// @DnDComment : Check how much money the player has and save the result$(13_10)to a temporary variable
/// @DnDArgument : "var" "_money"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "get_money"
var _money = get_money();

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7FCE1F57
/// @DnDComment : Check whether the current money is less than what this item costs
/// @DnDArgument : "var" "_money"
/// @DnDArgument : "op" "1"
/// @DnDArgument : "value" "cost"
if(_money < cost)
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 41FE83CA
	/// @DnDComment : If so, then use image_index 1, the grey version
	/// @DnDParent : 7FCE1F57
	/// @DnDArgument : "imageind" "1"
	/// @DnDArgument : "spriteind" "sprite_index"
	sprite_index = sprite_index;
	image_index = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 7243ECFA
else
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 76BC8F79
	/// @DnDComment : If not, use image_index 0, the colorized version.
	/// @DnDParent : 7243ECFA
	/// @DnDArgument : "spriteind" "sprite_index"
	sprite_index = sprite_index;
	image_index = 0;
}