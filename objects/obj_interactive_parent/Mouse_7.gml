/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 61D6EA27
/// @DnDComment : Check if the menu is locked
/// @DnDArgument : "expr" "global.menu_lock"
/// @DnDArgument : "not" "1"
if(!(global.menu_lock))
{
	/// @DnDAction : YoYo Games.Instances.Call_User_Event
	/// @DnDVersion : 1
	/// @DnDHash : 63E2CCC4
	/// @DnDComment : If it is not, run event_user(0)
	/// @DnDParent : 61D6EA27
	event_user(0);
}