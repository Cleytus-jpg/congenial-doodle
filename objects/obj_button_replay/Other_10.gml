/// @DnDAction : YoYo Games.Rooms.Restart_Room
/// @DnDVersion : 1
/// @DnDHash : 19429918
/// @DnDComment : Restart the Room
room_restart();

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 47A64A95
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
/// @DnDSaveInfo : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);