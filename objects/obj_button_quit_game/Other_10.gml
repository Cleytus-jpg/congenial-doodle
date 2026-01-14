/// @DnDAction : YoYo Games.Game.End_Game
/// @DnDVersion : 1
/// @DnDHash : 199B171D
/// @DnDComment : Exit the entire game
game_end();

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 65BB342D
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);