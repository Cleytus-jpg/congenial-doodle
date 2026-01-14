/// @DnDAction : YoYo Games.Movement.Set_Speed
/// @DnDVersion : 1
/// @DnDHash : 63BE56FE
/// @DnDComment : Set the arrow's speed (direction is set when the arrow is created)
/// @DnDArgument : "speed" "20"
speed = 20;

/// @DnDAction : YoYo Games.Random.Choose
/// @DnDVersion : 1
/// @DnDHash : 2D3F2066
/// @DnDComment : Choose a random arrow attack sound
/// @DnDInput : 2
/// @DnDArgument : "var" "_sound"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "option" "snd_attack_archer_01"
/// @DnDArgument : "option_1" "snd_attack_archer_02"
var _sound = choose(snd_attack_archer_01, snd_attack_archer_02);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 4BE47398
/// @DnDComment : Play a random arrow attack sound
/// @DnDArgument : "soundid" "_sound"
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);