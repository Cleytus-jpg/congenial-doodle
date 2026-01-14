/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 2207AA67
/// @DnDComment : This is the parent object of the two towers.$(13_10)Some of these variables will be overwritten $(13_10)in the child objects.
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3B5D6A88
/// @DnDComment : cost: This variable holds the cost of the tower$(13_10)$(13_10)level: This variable holds the starting level of the tower$(13_10)$(13_10)max_level: This variable holds the max level of the tower$(13_10)$(13_10)range: This variable holds the tower's range
/// @DnDInput : 4
/// @DnDArgument : "expr" "2"
/// @DnDArgument : "expr_2" "3"
/// @DnDArgument : "expr_3" "100"
/// @DnDArgument : "var" "cost"
/// @DnDArgument : "var_1" "level"
/// @DnDArgument : "var_2" "max_level"
/// @DnDArgument : "var_3" "range"
cost = 2;
level = 0;
max_level = 3;
range = 100;

/// @DnDAction : YoYo Games.Random.Choose
/// @DnDVersion : 1
/// @DnDHash : 6A4A2C87
/// @DnDInput : 2
/// @DnDArgument : "var" "_sound"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "option" "snd_tower_build_01"
/// @DnDArgument : "option_1" "snd_tower_build_02"
var _sound = choose(snd_tower_build_01, snd_tower_build_02);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 6878F1F1
/// @DnDArgument : "soundid" "_sound"
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);