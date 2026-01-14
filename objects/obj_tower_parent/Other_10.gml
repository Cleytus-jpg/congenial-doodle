/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 165ABB5E
/// @DnDComment : If a popup menu exists, exit
/// @DnDArgument : "expr" "global.popup_menu_exists"
if(global.popup_menu_exists)
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 1DFE71AC
	/// @DnDParent : 165ABB5E
	exit;
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 126228BF
/// @DnDComment : Create an instance of the popup manager base and$(13_10)save it's id to a temporary variable
/// @DnDInput : 5
/// @DnDArgument : "function" "instance_create_layer"
/// @DnDArgument : "arg" "x"
/// @DnDArgument : "arg_1" "y"
/// @DnDArgument : "arg_2" ""SequenceInstance""
/// @DnDArgument : "arg_3" "obj_popup_manager_tower"
/// @DnDArgument : "arg_4" "{my_tower : other.id}"
instance_create_layer(x, y, "SequenceInstance", obj_popup_manager_tower, {my_tower : other.id});

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 3D239994
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
/// @DnDSaveInfo : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);