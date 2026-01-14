/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 39A8607B
/// @DnDComment : Deal damage to the enemy
/// @DnDInput : 2
/// @DnDArgument : "function" "deal_damage"
/// @DnDArgument : "arg" "other"
/// @DnDArgument : "arg_1" "1"
deal_damage(other, 1);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 3856B4F0
/// @DnDComment : Destroy this arrow
instance_destroy();

/// @DnDAction : YoYo Games.Random.Choose
/// @DnDVersion : 1
/// @DnDHash : 54F414A9
/// @DnDComment : Pick a random arrow impact sound$(13_10)and save the sound to a temporary variable
/// @DnDInput : 3
/// @DnDArgument : "var" "_sound"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "option" "snd_impact_archer_01"
/// @DnDArgument : "option_1" "snd_impact_archer_02"
/// @DnDArgument : "option_2" "snd_impact_archer_03"
var _sound = choose(snd_impact_archer_01, snd_impact_archer_02, snd_impact_archer_03);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 249E963C
/// @DnDComment : Play a random arrow impact sound
/// @DnDArgument : "soundid" "_sound"
audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);