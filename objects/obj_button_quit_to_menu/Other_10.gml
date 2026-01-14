/// @DnDAction : YoYo Games.Rooms.Go_To_Room
/// @DnDVersion : 1
/// @DnDHash : 047D12C9
/// @DnDComment : Go back to the Menu
/// @DnDArgument : "room" "rm_menu"
/// @DnDSaveInfo : "room" "rm_menu"
room_goto(rm_menu);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 7652E7E2
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
/// @DnDSaveInfo : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);