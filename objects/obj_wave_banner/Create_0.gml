/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 58231922
/// @DnDComment : Create a temporary variable and set it to false
/// @DnDArgument : "var" "_waves_over"
/// @DnDArgument : "value" "false"
var _waves_over = false;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 315F4B5A
/// @DnDApplyTo : obj_wave_manager
with(obj_wave_manager) {
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6C1EFBB1
	/// @DnDComment : Get the length of the wave_array and store the value$(13_10)in a temporary variable
	/// @DnDParent : 315F4B5A
	/// @DnDArgument : "var" "_length"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "array_length"
	/// @DnDArgument : "arg" "wave_array"
	var _length = array_length(wave_array);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 61F0FB7F
	/// @DnDComment : Check to see whether waves is greater than or equal $(13_10)to the length of the wave array (which means the waves are over)
	/// @DnDParent : 315F4B5A
	/// @DnDArgument : "var" "wave"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "_length"
	if(wave >= _length)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 597E44A7
		/// @DnDComment : Set waves over to true
		/// @DnDParent : 61F0FB7F
		/// @DnDArgument : "var" "_waves_over"
		/// @DnDArgument : "value" "true"
		var _waves_over = true;
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 648F3F45
/// @DnDComment : Set text based on whether it is the last wave$(13_10)Check if the waves are over
/// @DnDArgument : "expr" "_waves_over"
if(_waves_over)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1B5E2E68
	/// @DnDComment : If waves are over, set text to final wave
	/// @DnDParent : 648F3F45
	/// @DnDArgument : "expr" ""FINAL WAVE""
	/// @DnDArgument : "var" "text"
	text = "FINAL WAVE";

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 3C01D92B
	/// @DnDComment : And play the final wave sound
	/// @DnDParent : 648F3F45
	/// @DnDArgument : "soundid" "snd_wave_start_final"
	/// @DnDSaveInfo : "soundid" "snd_wave_start_final"
	audio_play_sound(snd_wave_start_final, 0, 0, 1.0, undefined, 1.0);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 3900E699
/// @DnDComment : If the waves aren't over
else
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3ABC1294
	/// @DnDComment : Get the wave number using our custom function
	/// @DnDParent : 3900E699
	/// @DnDArgument : "var" "_wave_number"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "return_wave_number"
	var _wave_number = return_wave_number();

	/// @DnDAction : YoYo Games.Types.Number_To_String
	/// @DnDVersion : 1
	/// @DnDHash : 0319CF50
	/// @DnDComment : Convert that number to a string
	/// @DnDParent : 3900E699
	/// @DnDArgument : "var" "_wave_number"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "value" "_wave_number"
	var _wave_number = string(_wave_number);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 14E73691
	/// @DnDComment : Set the text to the waver number$(13_10)add the word Wave at the start$(13_10)(you can add to strings together with the plus sign)
	/// @DnDParent : 3900E699
	/// @DnDArgument : "expr" ""Wave " + _wave_number"
	/// @DnDArgument : "var" "text"
	text = "Wave " + _wave_number;

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 70687B5F
	/// @DnDComment : And play the normal wave sound
	/// @DnDParent : 3900E699
	/// @DnDArgument : "soundid" "snd_wave_start"
	/// @DnDSaveInfo : "soundid" "snd_wave_start"
	audio_play_sound(snd_wave_start, 0, 0, 1.0, undefined, 1.0);
}