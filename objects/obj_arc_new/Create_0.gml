/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5B0F32FE
/// @DnDComment : target: This variable stores the instance id of its target$(13_10)$(13_10)chains_remaining: This variable stores how many more times $(13_10)the arc can chain to a new enemy$(13_10)$(13_10)targets_hit_array: This variable stores the instance ids of enemies the arc$(13_10)has already hit so that it doesn't hit them again$(13_10)$(13_10)chained: This variable says whether or not the arc has already chained
/// @DnDInput : 4
/// @DnDArgument : "expr" "noone"
/// @DnDArgument : "expr_2" "[]"
/// @DnDArgument : "expr_3" "false"
/// @DnDArgument : "var" "target"
/// @DnDArgument : "var_1" "chains_remaining"
/// @DnDArgument : "var_2" "targets_hit_array"
/// @DnDArgument : "var_3" "chained"
target = noone;
chains_remaining = 0;
targets_hit_array = [];
chained = false;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6D3599FC
/// @DnDComment : These variables stores the target's x, y, and depth
/// @DnDInput : 3
/// @DnDArgument : "expr" "x"
/// @DnDArgument : "expr_1" "y"
/// @DnDArgument : "expr_2" "depth"
/// @DnDArgument : "var" "target_x"
/// @DnDArgument : "var_1" "target_y"
/// @DnDArgument : "var_2" "target_depth"
target_x = x;
target_y = y;
target_depth = depth;

/// @DnDAction : YoYo Games.Random.Choose
/// @DnDVersion : 1
/// @DnDHash : 4ED764BA
/// @DnDComment : Choose a random arc attack sound
/// @DnDInput : 3
/// @DnDArgument : "var" "_sound"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "option" "snd_attack_arc_01"
/// @DnDArgument : "option_1" "snd_attack_arc_02"
/// @DnDArgument : "option_2" "snd_attack_arc_03"
var _sound = choose(snd_attack_arc_01, snd_attack_arc_02, snd_attack_arc_03);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 093F319A
/// @DnDComment : Play a random arc attack sound
/// @DnDArgument : "soundid" "_sound"
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);