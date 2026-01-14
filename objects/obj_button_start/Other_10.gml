/// @DnDAction : YoYo Games.Rooms.Go_To_Room
/// @DnDVersion : 1
/// @DnDHash : 05CB830B
/// @DnDComment : Go to the level
/// @DnDArgument : "room" "rm_level_1"
/// @DnDSaveInfo : "room" "rm_level_1"
room_goto(rm_level_1);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 0E8B6324
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
/// @DnDSaveInfo : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);