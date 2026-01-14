/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 44227BEE
/// @DnDComment : Start the next wave using our custom function
/// @DnDArgument : "function" "start_next_wave"
start_next_wave();

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 7B2342AC
/// @DnDComment : Destroy this button
instance_destroy();

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 6B0FE98F
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
/// @DnDSaveInfo : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);