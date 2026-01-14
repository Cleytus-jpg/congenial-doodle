/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 1B5525EE
event_inherited();

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 4A6A099F
/// @DnDComment : Check if the prev_target (an instance) still exists
/// @DnDArgument : "obj" "prev_taget"
var l4A6A099F_0 = false;
l4A6A099F_0 = instance_exists(prev_taget);
if(l4A6A099F_0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7BE143C9
	/// @DnDComment : If it does, update this isntance's x adn y$(13_10)$(13_10)We offset the y value. Otherwise, the arc $(13_10)would track the enemies feet
	/// @DnDInput : 2
	/// @DnDParent : 4A6A099F
	/// @DnDArgument : "expr" "prev_taget.x"
	/// @DnDArgument : "expr_1" "prev_taget.y - 125"
	/// @DnDArgument : "var" "x"
	/// @DnDArgument : "var_1" "y"
	x = prev_taget.x;
	y = prev_taget.y - 125;
}