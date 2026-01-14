/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 5FF5B7CB
/// @DnDComment : Since this is the sell button, we want to overwrite$(13_10)the normal step event, because we don't need to do the cost check.$(13_10)$(13_10)Check whether or not a popup menu exists
/// @DnDArgument : "expr" "global.popup_menu_exists"
/// @DnDArgument : "not" "1"
if(!(global.popup_menu_exists))
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 65B7F1F6
	/// @DnDComment : If none exist, destroy this menu button
	/// @DnDParent : 5FF5B7CB
	instance_destroy();
}