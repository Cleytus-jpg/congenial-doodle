/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3E847734
/// @DnDComment : Set the enemy's speed$(13_10)Because the enemy is on path, we need to use path_speed instead of speed
/// @DnDArgument : "expr" "my_speed"
/// @DnDArgument : "var" "path_speed"
path_speed = my_speed;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 7A1AF269
/// @DnDComment : Check if the enemies position on the path is greater than or equal to 1$(13_10)which means that it is at the end of the path
/// @DnDArgument : "var" "path_position"
/// @DnDArgument : "op" "4"
/// @DnDArgument : "value" "1"
if(path_position >= 1)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 765E1FA4
	/// @DnDComment : If the enemy is at the end of the path, then it has reached the village,$(13_10)so we should reduce the village hp.
	/// @DnDParent : 7A1AF269
	/// @DnDArgument : "function" "reduce_village_hp"
	/// @DnDArgument : "arg" "1"
	reduce_village_hp(1);

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 41F1B2A0
	/// @DnDComment : Destroy this enemy
	/// @DnDParent : 7A1AF269
	instance_destroy();
}