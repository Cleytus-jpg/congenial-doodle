/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 199CC023
/// @DnDComment : Check if a background screenshot exists
/// @DnDArgument : "expr" "sprite_exists(global.screen_shot_id)"
if(sprite_exists(global.screen_shot_id))
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6C751450
	/// @DnDComment : If one does, delete it.
	/// @DnDParent : 199CC023
	/// @DnDArgument : "function" "sprite_delete"
	/// @DnDArgument : "arg" "global.screen_shot_id"
	sprite_delete(global.screen_shot_id);
}