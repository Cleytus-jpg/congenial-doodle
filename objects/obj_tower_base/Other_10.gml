/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 1889892E
/// @DnDComment : If a popup menu exists, exit
/// @DnDArgument : "expr" "global.popup_menu_exists"
if(global.popup_menu_exists)
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 2872807E
	/// @DnDParent : 1889892E
	exit;
}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 7D3BC254
/// @DnDComment : Create an instance of the popup manager base and$(13_10)save it's id to a temporary variable
/// @DnDArgument : "xpos" "x"
/// @DnDArgument : "ypos" "y"
/// @DnDArgument : "var" "_inst"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_popup_manager_base"
/// @DnDArgument : "layer" ""SequenceInstance""
/// @DnDSaveInfo : "objectid" "obj_popup_manager_base"
var _inst = instance_create_layer(x, y, "SequenceInstance", obj_popup_manager_base);

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 26FA6A0F
/// @DnDApplyTo : _inst
with(_inst) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 71A0EFD8
	/// @DnDComment : Set my_tower to the instance id of this tower base$(13_10)This instance id will allow the popup menu to refer back $(13_10)to the correct tower base
	/// @DnDParent : 26FA6A0F
	/// @DnDArgument : "expr" "other.id"
	/// @DnDArgument : "var" "my_tower"
	my_tower = other.id;
}

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 7E0684CD
/// @DnDComment : Play the button press sound effect
/// @DnDArgument : "soundid" "snd_button_click"
/// @DnDSaveInfo : "soundid" "snd_button_click"
audio_play_sound(snd_button_click, 0, 0, 1.0, undefined, 1.0);