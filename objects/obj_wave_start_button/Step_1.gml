/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 37524877
/// @DnDComment : Prevent clicking on this button while a popup menu is active
/// @DnDArgument : "expr" "global.popup_menu_exists"
if(global.popup_menu_exists)
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 07E14F5F
	/// @DnDParent : 37524877
	exit;
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 19C04DA3
/// @DnDComment : Inherit the parent event
event_inherited();