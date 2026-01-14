/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 4594F268
/// @DnDComment : Check if the wave is running and save$(13_10)the result to a variable
/// @DnDArgument : "var" "_wave_is_running"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "wave_is_running"
var _wave_is_running = wave_is_running();

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 64756A3A
/// @DnDComment : If the wave is running
/// @DnDArgument : "expr" "_wave_is_running"
if(_wave_is_running)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 357F4383
	/// @DnDComment : Increase the amount of money the player has to spend
	/// @DnDParent : 64756A3A
	/// @DnDArgument : "function" "adjust_money"
	/// @DnDArgument : "arg" "1"
	adjust_money(1);
}

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 1A4784A4
/// @DnDComment : Reset the alarm for three seconds
/// @DnDArgument : "steps" "room_speed * 3"
alarm_set(0, room_speed * 3);