/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 7909D2F1
event_inherited();

/// @DnDAction : YoYo Games.Random.Choose
/// @DnDVersion : 1
/// @DnDHash : 7BC7DA32
/// @DnDComment : Choose a random death sound
/// @DnDInput : 3
/// @DnDArgument : "var" "_sound"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "option" "snd_death_zombie_01"
/// @DnDArgument : "option_1" "snd_death_zombie_02"
/// @DnDArgument : "option_2" "snd_death_zombie_03"
var _sound = choose(snd_death_zombie_01, snd_death_zombie_02, snd_death_zombie_03);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 68DA3129
/// @DnDComment : Play the death sound
/// @DnDArgument : "soundid" "_sound"
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);