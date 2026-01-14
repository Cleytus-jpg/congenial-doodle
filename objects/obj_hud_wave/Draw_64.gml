/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 7ABAAE3E
/// @DnDComment : Declare a temporary variable and set it to 1
/// @DnDArgument : "var" "_scale"
/// @DnDArgument : "value" "1"
var _scale = 1;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 59AC2317
/// @DnDApplyTo : obj_wave_manager
with(obj_wave_manager) {
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4AB2206B
	/// @DnDComment : Check if wave_flash_alpha's alpha is greater than zero
	/// @DnDParent : 59AC2317
	/// @DnDArgument : "var" "wave_flash_alpha"
	/// @DnDArgument : "op" "2"
	if(wave_flash_alpha > 0)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 1D32D5DD
		/// @DnDComment : If it is, use the custom map_value function to scale the _scale variable
		/// @DnDInput : 5
		/// @DnDParent : 4AB2206B
		/// @DnDArgument : "var" "_scale"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "map_value"
		/// @DnDArgument : "arg" "wave_flash_alpha"
		/// @DnDArgument : "arg_1" "1"
		/// @DnDArgument : "arg_2" "0"
		/// @DnDArgument : "arg_3" "1.15"
		/// @DnDArgument : "arg_4" "1"
		var _scale = map_value(wave_flash_alpha, 1, 0, 1.15, 1);
	}
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 603EA85C
/// @DnDComment : Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7A00F6A4
/// @DnDComment : Save the wave number to a variable
/// @DnDArgument : "var" "_wave_number"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "return_wave_number"
var _wave_number = return_wave_number();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 78014BBE
/// @DnDComment : Use our custom function to draw the text and the outline
/// @DnDInput : 8
/// @DnDArgument : "function" "draw_text_transformed_outlined"
/// @DnDArgument : "arg" "x + 50"
/// @DnDArgument : "arg_1" "y + 42"
/// @DnDArgument : "arg_2" "_wave_number"
/// @DnDArgument : "arg_3" "_scale"
/// @DnDArgument : "arg_4" "_scale"
/// @DnDArgument : "arg_5" "0"
/// @DnDArgument : "arg_6" "c_black"
/// @DnDArgument : "arg_7" "c_white"
draw_text_transformed_outlined(x + 50, y + 42, _wave_number, _scale, _scale, 0, c_black, c_white);