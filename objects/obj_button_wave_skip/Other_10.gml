/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 4FAF826D
/// @DnDComment : Uses "Apply To" to access the instance of obj_wave_manager.$(13_10)"Apply To" only works if an instance of the object exists.
/// @DnDApplyTo : {obj_wave_manager}
with(obj_wave_manager) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 14D5A6DB
	/// @DnDComment : Increase the wave number
	/// @DnDParent : 4FAF826D
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "wave"
	wave += 1;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5247717B
	/// @DnDComment : Set the wave_flash_alpha to 1 so it will animate
	/// @DnDParent : 4FAF826D
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "var" "wave_flash_alpha"
	wave_flash_alpha = 1;
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 296571FA
/// @DnDComment : Start the next wave using our custom function
/// @DnDArgument : "function" "start_next_wave"
start_next_wave();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 2FFC83F8
/// @DnDComment : Destroy this button
instance_destroy();

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 1B41F48F
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
/// @DnDSaveInfo : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);