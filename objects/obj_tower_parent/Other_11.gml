/// @DnDAction : YoYo Games.Sequences.Sequence_Create
/// @DnDVersion : 1
/// @DnDHash : 40BC36F7
/// @DnDComment : Create the Upgrade Sequence at the appropriate location
/// @DnDArgument : "xpos" "70"
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos" "(y - 150) + (level * 36)"
/// @DnDArgument : "var" ""
/// @DnDArgument : "sequenceid" "seq_tower_upgrade"
/// @DnDArgument : "layer" ""Sequences""
/// @DnDSaveInfo : "sequenceid" "seq_tower_upgrade"
layer_sequence_create("Sequences", x + 70, (y - 150) + (level * 36), seq_tower_upgrade);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 31E345B9
/// @DnDComment : Increase the level
/// @DnDArgument : "expr" "1"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "level"
level += 1;

/// @DnDAction : YoYo Games.Random.Choose
/// @DnDVersion : 1
/// @DnDHash : 6B459F91
/// @DnDComment : Choose a random tower upgrade sound to play
/// @DnDInput : 2
/// @DnDArgument : "var" "_sound"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "option" "snd_tower_upgrade_01"
/// @DnDArgument : "option_1" "snd_tower_upgrade_02"
var _sound = choose(snd_tower_upgrade_01, snd_tower_upgrade_02);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 68DF4745
/// @DnDComment : Play the random tower upgrade sound to play
/// @DnDArgument : "soundid" "_sound"
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);