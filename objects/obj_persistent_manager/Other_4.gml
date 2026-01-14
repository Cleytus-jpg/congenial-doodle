/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5D9021A6
/// @DnDComment : Handle background music based on the room
/// @DnDArgument : "var" "room"
/// @DnDArgument : "value" "rm_menu"
if(room == rm_menu)
{
	/// @DnDAction : YoYo Games.Audio.Stop_Audio
	/// @DnDVersion : 1
	/// @DnDHash : 42BA49AC
	/// @DnDComment : Stop the level's music
	/// @DnDParent : 5D9021A6
	/// @DnDArgument : "soundid" "snd_music_level"
	/// @DnDSaveInfo : "soundid" "snd_music_level"
	audio_stop_sound(snd_music_level);

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 5CCF9674
	/// @DnDComment : Play the menu's music
	/// @DnDParent : 5D9021A6
	/// @DnDArgument : "soundid" "snd_music_menu"
	/// @DnDArgument : "loop" "1"
	/// @DnDSaveInfo : "soundid" "snd_music_menu"
	audio_play_sound(snd_music_menu, 0, 1, 1.0, undefined, 1.0);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 330EA4B3
else
{
	/// @DnDAction : YoYo Games.Audio.Stop_Audio
	/// @DnDVersion : 1
	/// @DnDHash : 131C7EC0
	/// @DnDComment : Stop the menu's music
	/// @DnDParent : 330EA4B3
	/// @DnDArgument : "soundid" "snd_music_menu"
	/// @DnDSaveInfo : "soundid" "snd_music_menu"
	audio_stop_sound(snd_music_menu);

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 2037F2CF
	/// @DnDComment : Play the level's music
	/// @DnDParent : 330EA4B3
	/// @DnDArgument : "soundid" "snd_music_level"
	/// @DnDArgument : "loop" "1"
	/// @DnDSaveInfo : "soundid" "snd_music_level"
	audio_play_sound(snd_music_level, 0, 1, 1.0, undefined, 1.0);
}