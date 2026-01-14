/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 06E8528F
/// @DnDComment : This is how we animate the village hp text in the HUD$(13_10)If village_flash_alpha is greater than zero
/// @DnDArgument : "var" "village_flash_alpha"
/// @DnDArgument : "op" "2"
if(village_flash_alpha > 0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7D0DD6D8
	/// @DnDComment : Reduce the village_flash_alpha
	/// @DnDParent : 06E8528F
	/// @DnDArgument : "expr" "-0.03"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "village_flash_alpha"
	village_flash_alpha += -0.03;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 021CBD8D
/// @DnDComment : This is how we animate the money text in the HUD$(13_10)If money_flash_alpha is greater than zero
/// @DnDArgument : "var" "money_flash_alpha"
/// @DnDArgument : "op" "2"
if(money_flash_alpha > 0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 142CCBCB
	/// @DnDComment : Reduce the money_flash_alpha
	/// @DnDParent : 021CBD8D
	/// @DnDArgument : "expr" "-0.03"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "money_flash_alpha"
	money_flash_alpha += -0.03;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 2BC39E1A
/// @DnDComment : Check if the game is over, and if so, exit this event
/// @DnDArgument : "expr" "game_over"
if(game_over)
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 43CBF07B
	/// @DnDParent : 2BC39E1A
	exit;
}

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 04CD2D0A
/// @DnDComment : Get the village's hp and save it to a temporary$(13_10)variable so we can check it later
/// @DnDArgument : "var" "_village_hp"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "get_village_hp"
var _village_hp = get_village_hp();

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5E0AF25E
/// @DnDComment : Check if the village's hp is less than zero
/// @DnDArgument : "var" "_village_hp"
/// @DnDArgument : "op" "3"
if(_village_hp <= 0)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 25CAE72B
	/// @DnDComment : Use the custom game over function to turn off variables
	/// @DnDParent : 5E0AF25E
	/// @DnDArgument : "function" "set_game_over"
	set_game_over();

	/// @DnDAction : YoYo Games.Sequences.Sequence_Create
	/// @DnDVersion : 1
	/// @DnDHash : 343B4F7F
	/// @DnDComment : Create the game lost popup using a sequence
	/// @DnDParent : 5E0AF25E
	/// @DnDArgument : "sequenceid" "seq_popup_game_lost"
	/// @DnDArgument : "layer" ""Sequences""
	/// @DnDSaveInfo : "sequenceid" "seq_popup_game_lost"
	variable = layer_sequence_create("Sequences", 0, 0, seq_popup_game_lost);

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 03C84933
	/// @DnDComment : Play the game over music
	/// @DnDParent : 5E0AF25E
	/// @DnDArgument : "soundid" "snd_music_lose"
	/// @DnDSaveInfo : "soundid" "snd_music_lose"
	audio_play_sound(snd_music_lose, 0, 0, 1.0, undefined, 1.0);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 27D04B11
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 0FE9F8A7
	/// @DnDComment : Check if the waves are over and all enemies have been destroyed.$(13_10)If so, the game has been won!
	/// @DnDInput : 2
	/// @DnDParent : 27D04B11
	/// @DnDArgument : "expr" "waves_are_over()"
	/// @DnDArgument : "expr_1" "instance_exists(obj_enemy_parent)"
	/// @DnDArgument : "not_1" "1"
	if(waves_are_over() && !(instance_exists(obj_enemy_parent)))
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 62E55035
		/// @DnDComment : Use the custom game over function to turn off variables
		/// @DnDParent : 0FE9F8A7
		/// @DnDArgument : "function" "set_game_over"
		set_game_over();
	
		/// @DnDAction : YoYo Games.Sequences.Sequence_Create
		/// @DnDVersion : 1
		/// @DnDHash : 1FB072C4
		/// @DnDComment : Create the game won popup using a sequence
		/// @DnDParent : 0FE9F8A7
		/// @DnDArgument : "sequenceid" "seq_popup_game_won"
		/// @DnDArgument : "layer" ""Sequences""
		/// @DnDSaveInfo : "sequenceid" "seq_popup_game_won"
		variable = layer_sequence_create("Sequences", 0, 0, seq_popup_game_won);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 52C0686B
		/// @DnDComment : Play the game won music
		/// @DnDParent : 0FE9F8A7
		/// @DnDArgument : "soundid" "snd_music_win"
		/// @DnDSaveInfo : "soundid" "snd_music_win"
		audio_play_sound(snd_music_win, 0, 0, 1.0, undefined, 1.0);
	}
}