/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0FAD1A61
/// @DnDComment : Returns the current amount of money
/// @DnDArgument : "funcName" "get_money"
function get_money() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 166FF4F7
	/// @DnDApplyTo : obj_gameplay_manager
	/// @DnDParent : 0FAD1A61
	with(obj_gameplay_manager) {
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 6EFD0E1B
		/// @DnDComment : Return the number stored in the money variable of obj_gameplay_manager.$(13_10)return will end the function
		/// @DnDParent : 166FF4F7
		/// @DnDArgument : "value" "money"
		return money;
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 0A1484B3
	/// @DnDComment : If we make it here, then there is no instance of obj_gameplay_manager to check,$(13_10)so we will return -1 instead.
	/// @DnDParent : 0FAD1A61
	/// @DnDArgument : "value" "-1"
	return -1;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 38C4DF14
/// @DnDComment : Adjusts the amount of money available
/// @DnDArgument : "funcName" "adjust_money"
/// @DnDArgument : "arg" "_amount"
function adjust_money(_amount) 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 5ED3D586
	/// @DnDApplyTo : obj_gameplay_manager
	/// @DnDParent : 38C4DF14
	with(obj_gameplay_manager) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 27835350
		/// @DnDComment : Adjust the amount of money
		/// @DnDParent : 5ED3D586
		/// @DnDArgument : "expr" "_amount"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "money"
		money += _amount;
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4666F7C4
		/// @DnDComment : If the amount is a positive number
		/// @DnDParent : 5ED3D586
		/// @DnDArgument : "var" "_amount"
		/// @DnDArgument : "op" "2"
		if(_amount > 0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 27DBD94C
			/// @DnDComment : Set this value to 1 in order to animate the HUD Text
			/// @DnDParent : 4666F7C4
			/// @DnDArgument : "expr" "1"
			/// @DnDArgument : "var" "money_flash_alpha"
			money_flash_alpha = 1;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 5557FD69
/// @DnDComment : Returns the current amount of village health points
/// @DnDArgument : "funcName" "get_village_hp"
function get_village_hp() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 7487F91E
	/// @DnDApplyTo : obj_gameplay_manager
	/// @DnDParent : 5557FD69
	with(obj_gameplay_manager) {
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 24D74AAE
		/// @DnDComment : Return the number stored in the money variable of obj_gameplay_manager.$(13_10)return will end the function
		/// @DnDParent : 7487F91E
		/// @DnDArgument : "value" "village_hp"
		return village_hp;
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 35AC0F29
	/// @DnDComment : If we make it here, then there is no instance of obj_gameplay_manager to check,$(13_10)so we will return -1 instead.
	/// @DnDParent : 5557FD69
	/// @DnDArgument : "value" "-1"
	return -1;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 40305424
/// @DnDComment : Reduces the amount of village health points
/// @DnDArgument : "funcName" "reduce_village_hp"
/// @DnDArgument : "arg" "_amount"
function reduce_village_hp(_amount) 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 695A7347
	/// @DnDApplyTo : obj_gameplay_manager
	/// @DnDParent : 40305424
	with(obj_gameplay_manager) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 79C0CDC7
		/// @DnDComment : If the village hp is already at zero, then stop the function
		/// @DnDParent : 695A7347
		/// @DnDArgument : "var" "village_hp"
		/// @DnDArgument : "op" "3"
		if(village_hp <= 0)
		{
			/// @DnDAction : YoYo Games.Common.Return
			/// @DnDVersion : 1
			/// @DnDHash : 6491ABAC
			/// @DnDParent : 79C0CDC7
			return;
		}
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 77ED2904
		/// @DnDComment : village_hp: Reduce the village hp by the amount provided$(13_10)$(13_10)village_flash_alpha: Set this value to 1 in order to animate the HUD Text
		/// @DnDInput : 2
		/// @DnDParent : 695A7347
		/// @DnDArgument : "expr" "-_amount"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "expr_1" "1"
		/// @DnDArgument : "var" "village_hp"
		/// @DnDArgument : "var_1" "village_flash_alpha"
		village_hp += -_amount;
		village_flash_alpha = 1;
	
		/// @DnDAction : YoYo Games.Random.Choose
		/// @DnDVersion : 1
		/// @DnDHash : 1A11C469
		/// @DnDComment : Choose a random villager death sound and save$(13_10)that sound to a temporary variable
		/// @DnDInput : 6
		/// @DnDParent : 695A7347
		/// @DnDArgument : "var" "_sound"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "option" "snd_villager_death_01"
		/// @DnDArgument : "option_1" "snd_villager_death_02"
		/// @DnDArgument : "option_2" "snd_villager_death_03"
		/// @DnDArgument : "option_3" "snd_villager_death_04"
		/// @DnDArgument : "option_4" "snd_villager_death_05"
		/// @DnDArgument : "option_5" "snd_villager_death_06"
		var _sound = choose(snd_villager_death_01, snd_villager_death_02, snd_villager_death_03, snd_villager_death_04, snd_villager_death_05, snd_villager_death_06);
	
		/// @DnDAction : YoYo Games.Audio.Play_Audio
		/// @DnDVersion : 1.1
		/// @DnDHash : 069A60A0
		/// @DnDComment : Play the random sound
		/// @DnDParent : 695A7347
		/// @DnDArgument : "soundid" "_sound"
		audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 07550B36
/// @DnDComment : Deal damage to an enemy
/// @DnDInput : 2
/// @DnDArgument : "funcName" "deal_damage"
/// @DnDArgument : "arg" "_id"
/// @DnDArgument : "arg_1" "_amount"
function deal_damage(_id, _amount) 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 159033B3
	/// @DnDComment : Reduce the enemies hp by the amount that was passed in and $(13_10)set the enemy flash_alpha to 1 so that the hit flash will activate
	/// @DnDInput : 2
	/// @DnDParent : 07550B36
	/// @DnDArgument : "expr" "-_amount"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "expr_1" "1"
	/// @DnDArgument : "var" "_id.hp"
	/// @DnDArgument : "var_1" "_id.flash_alpha"
	_id.hp += -_amount;
	_id.flash_alpha = 1;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 575DE335
	/// @DnDComment : Check if the enemy still has hp left
	/// @DnDParent : 07550B36
	/// @DnDArgument : "var" "_id.hp"
	/// @DnDArgument : "op" "2"
	if(_id.hp > 0)
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0B423736
		/// @DnDComment : Check if the enemy is a zombie
		/// @DnDParent : 575DE335
		/// @DnDArgument : "var" "_id.object_index"
		/// @DnDArgument : "value" "obj_zombie"
		if(_id.object_index == obj_zombie)
		{
			/// @DnDAction : YoYo Games.Random.Choose
			/// @DnDVersion : 1
			/// @DnDHash : 31F1CBAF
			/// @DnDComment : Pick a random zombie groan
			/// @DnDInput : 3
			/// @DnDParent : 0B423736
			/// @DnDArgument : "var" "_sound"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "option" "snd_zombie_groan_01"
			/// @DnDArgument : "option_1" "snd_zombie_groan_02"
			/// @DnDArgument : "option_2" "snd_zombie_groan_03"
			var _sound = choose(snd_zombie_groan_01, snd_zombie_groan_02, snd_zombie_groan_03);
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 6B0BA0D3
			/// @DnDComment : Play the sound
			/// @DnDParent : 0B423736
			/// @DnDArgument : "soundid" "_sound"
			audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 148D745F
		/// @DnDComment : Otherwise check if the enemy is a frankenstein
		/// @DnDParent : 575DE335
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1535F110
			/// @DnDParent : 148D745F
			/// @DnDArgument : "var" "_id.object_index"
			/// @DnDArgument : "value" "obj_frankenstein"
			if(_id.object_index == obj_frankenstein)
			{
				/// @DnDAction : YoYo Games.Random.Choose
				/// @DnDVersion : 1
				/// @DnDHash : 65DE2BDE
				/// @DnDComment : Pick a random frankenstein ground
				/// @DnDInput : 3
				/// @DnDParent : 1535F110
				/// @DnDArgument : "var" "_sound"
				/// @DnDArgument : "var_temp" "1"
				/// @DnDArgument : "option" "snd_frankenstein_groan_01"
				/// @DnDArgument : "option_1" "snd_frankenstein_groan_02"
				/// @DnDArgument : "option_2" "snd_frankenstein_groan_03"
				var _sound = choose(snd_frankenstein_groan_01, snd_frankenstein_groan_02, snd_frankenstein_groan_03);
			
				/// @DnDAction : YoYo Games.Audio.Play_Audio
				/// @DnDVersion : 1.1
				/// @DnDHash : 2423C133
				/// @DnDComment : Play the sound
				/// @DnDParent : 1535F110
				/// @DnDArgument : "soundid" "_sound"
				audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
			}
		}
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 601647B5
/// @DnDComment : Creates an icon for the popup menu
/// @DnDInput : 6
/// @DnDArgument : "funcName" "create_icon"
/// @DnDArgument : "arg" "_x	"
/// @DnDArgument : "arg_1" "_y"
/// @DnDArgument : "arg_2" "_layer"
/// @DnDArgument : "arg_3" "_id"
/// @DnDArgument : "arg_4" "_spr"
/// @DnDArgument : "arg_5" "_starting_sprite"
function create_icon(_x	, _y, _layer, _id, _spr, _starting_sprite) 
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 5DD6D89C
	/// @DnDComment : Create an instance of obj_icon and save its instance id$(13_10)to a temporary variable
	/// @DnDParent : 601647B5
	/// @DnDArgument : "xpos" "_x	"
	/// @DnDArgument : "ypos" "_y"
	/// @DnDArgument : "var" "_inst"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_icon"
	/// @DnDArgument : "layer" "_layer"
	/// @DnDSaveInfo : "objectid" "obj_icon"
	var _inst = instance_create_layer(_x	, _y, _layer, obj_icon);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 221AB2CA
	/// @DnDApplyTo : _inst
	/// @DnDParent : 601647B5
	with(_inst) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 66DF7993
		/// @DnDComment : my_button: Set the variable to the id of the instance that created this obj_icon$(13_10)$(13_10)sprite_index: Set the sprite index to the sprite passed in$(13_10)$(13_10)starting_sprite: Set the starting_sprite to be the _starting_sprite $(13_10)passed in (this will not necessarily be the same as _spr)
		/// @DnDInput : 3
		/// @DnDParent : 221AB2CA
		/// @DnDArgument : "expr" "_id"
		/// @DnDArgument : "expr_1" "_spr"
		/// @DnDArgument : "expr_2" "_starting_sprite"
		/// @DnDArgument : "var" "my_button"
		/// @DnDArgument : "var_1" "sprite_index	"
		/// @DnDArgument : "var_2" "starting_sprite"
		my_button = _id;
		sprite_index	 = _spr;
		starting_sprite = _starting_sprite;
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 4FA2CF04
	/// @DnDComment : Return the newly create instance id
	/// @DnDParent : 601647B5
	/// @DnDArgument : "value" "_inst"
	return _inst;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 201BC388
/// @DnDComment : Animate an instance of obj_icon using a sequence
/// @DnDArgument : "funcName" "switch_icon"
function switch_icon() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 15851761
	/// @DnDApplyTo : my_icon
	/// @DnDParent : 201BC388
	with(my_icon) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 4274434C
		/// @DnDComment : Use our custom function to override this instance $(13_10)with a sequence
		/// @DnDInput : 5
		/// @DnDParent : 15851761
		/// @DnDArgument : "function" "animate_with_sequence"
		/// @DnDArgument : "arg" ""SequencesIcons""
		/// @DnDArgument : "arg_1" "x"
		/// @DnDArgument : "arg_2" "y"
		/// @DnDArgument : "arg_3" "seq_popup_icon_out"
		/// @DnDArgument : "arg_4" "obj_icon"
		animate_with_sequence("SequencesIcons", x, y, seq_popup_icon_out, obj_icon);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 06393FE0
		/// @DnDComment : Set finished to true. This variable use used $(13_10)in the icon step event so the icon can destroy itself after animating
		/// @DnDParent : 15851761
		/// @DnDArgument : "expr" "true"
		/// @DnDArgument : "var" "finished"
		finished = true;
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 6B84F7ED
/// @DnDComment : Draw text with an outline
/// @DnDInput : 8
/// @DnDArgument : "funcName" "draw_text_transformed_outlined"
/// @DnDArgument : "arg" "_x"
/// @DnDArgument : "arg_1" "_y"
/// @DnDArgument : "arg_2" "_string"
/// @DnDArgument : "arg_3" "_xscale"
/// @DnDArgument : "arg_4" "_yscale"
/// @DnDArgument : "arg_5" "_angle"
/// @DnDArgument : "arg_6" "_outline_color"
/// @DnDArgument : "arg_7" "_string_color"
function draw_text_transformed_outlined(_x, _y, _string, _xscale, _yscale, _angle, _outline_color, _string_color) 
{
	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 3BD4EE2E
	/// @DnDComment : Set the color for the outline first
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "color" "_outline_color"
	/// @DnDArgument : "alpha" "false"
	draw_set_colour(_outline_color & $ffffff);draw_set_alpha(1);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 3B936E9A
	/// @DnDComment : Draw the text 8 times with an offset of one pixel
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x + 1"
	/// @DnDArgument : "y" "_y + 1"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x + 1, _y + 1, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 0D32A8B4
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x - 1"
	/// @DnDArgument : "y" "_y - 1"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x - 1, _y - 1, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 263A9F6D
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x"
	/// @DnDArgument : "y" "_y + 1"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x, _y + 1, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 5DEF9697
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x + 1"
	/// @DnDArgument : "y" "_y"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x + 1, _y, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 71559BEF
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x"
	/// @DnDArgument : "y" "_y - 1"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x, _y - 1, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 4462125C
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x - 1"
	/// @DnDArgument : "y" "_y"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x - 1, _y, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 70AABCC3
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x - 1"
	/// @DnDArgument : "y" "_y + 1"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x - 1, _y + 1, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 45A2B2F1
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x + 1"
	/// @DnDArgument : "y" "_y - 1"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x + 1, _y - 1, string(_string) + "", _xscale, _yscale, _angle);

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 1F1E8D82
	/// @DnDComment : Set the color for the text itself
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "color" "_string_color"
	/// @DnDArgument : "alpha" "false"
	draw_set_colour(_string_color & $ffffff);draw_set_alpha(1);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 4A5686AD
	/// @DnDComment : Draw the text on top
	/// @DnDParent : 6B84F7ED
	/// @DnDArgument : "x" "_x"
	/// @DnDArgument : "y" "_y"
	/// @DnDArgument : "xscale" "_xscale"
	/// @DnDArgument : "yscale" "_yscale"
	/// @DnDArgument : "caption" "_string"
	/// @DnDArgument : "angle" "_angle"
	draw_text_transformed(_x, _y, string(_string) + "", _xscale, _yscale, _angle);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 47AAA9B9
/// @DnDComment : Pause the game if unpaused, otherwise if paused, unpause the game
/// @DnDArgument : "funcName" "pause_or_unpause_game"
function pause_or_unpause_game() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 34696CB3
	/// @DnDApplyTo : obj_gameplay_manager
	/// @DnDParent : 47AAA9B9
	with(obj_gameplay_manager) {
		/// @DnDAction : YoYo Games.Common.If_Expression
		/// @DnDVersion : 1
		/// @DnDHash : 2E85830D
		/// @DnDComment : If the game is not paused, we want to pause it
		/// @DnDParent : 34696CB3
		/// @DnDArgument : "expr" "paused"
		/// @DnDArgument : "not" "1"
		if(!(paused))
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 22DFF635
			/// @DnDComment : Check to see if a background screenshot already exists
			/// @DnDParent : 2E85830D
			/// @DnDArgument : "expr" "sprite_exists(global.screen_shot_id)"
			/// @DnDArgument : "not" "1"
			if(!(sprite_exists(global.screen_shot_id)))
			{
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 3584C5F3
				/// @DnDComment : If not, create one from the application_surface
				/// @DnDInput : 9
				/// @DnDParent : 22DFF635
				/// @DnDArgument : "var" " global.screen_shot_id"
				/// @DnDArgument : "function" "sprite_create_from_surface"
				/// @DnDArgument : "arg" "application_surface"
				/// @DnDArgument : "arg_1" "0"
				/// @DnDArgument : "arg_2" "0"
				/// @DnDArgument : "arg_3" "1920"
				/// @DnDArgument : "arg_4" "1080"
				/// @DnDArgument : "arg_5" "false"
				/// @DnDArgument : "arg_6" "false"
				/// @DnDArgument : "arg_7" "0"
				/// @DnDArgument : "arg_8" "0"
				 global.screen_shot_id = sprite_create_from_surface(application_surface, 0, 0, 1920, 1080, false, false, 0, 0);
			}
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 375E7242
			/// @DnDComment : Deactivate and pause everything
			/// @DnDParent : 2E85830D
			/// @DnDArgument : "function" "instance_deactivate_all"
			/// @DnDArgument : "arg" "true"
			instance_deactivate_all(true);
		
			/// @DnDAction : YoYo Games.Sequences.Sequence_Create
			/// @DnDVersion : 1
			/// @DnDHash : 73A762AC
			/// @DnDComment : Create the pause sequence and save the sequence element id
			/// @DnDParent : 2E85830D
			/// @DnDArgument : "var" "pause_sequence"
			/// @DnDArgument : "sequenceid" "seq_popup_pause"
			/// @DnDArgument : "layer" ""Sequences""
			/// @DnDSaveInfo : "sequenceid" "seq_popup_pause"
			pause_sequence = layer_sequence_create("Sequences", 0, 0, seq_popup_pause);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 7E04BCFF
			/// @DnDComment : Set paused to true
			/// @DnDParent : 2E85830D
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "var" "paused"
			paused = true;
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 39867ACE
		/// @DnDComment : The game is paused
		/// @DnDParent : 34696CB3
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 05904DB6
			/// @DnDComment : Check if the background sprite exists
			/// @DnDParent : 39867ACE
			/// @DnDArgument : "expr" "sprite_exists(global.screen_shot_id)"
			if(sprite_exists(global.screen_shot_id))
			{
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 30F6CDB6
				/// @DnDComment : If it does, delete it
				/// @DnDParent : 05904DB6
				/// @DnDArgument : "function" "sprite_delete"
				/// @DnDArgument : "arg" "global.screen_shot_id"
				sprite_delete(global.screen_shot_id);
			}
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 0833B4F7
			/// @DnDComment : Reactivate all instances
			/// @DnDParent : 39867ACE
			/// @DnDArgument : "function" "instance_activate_all"
			instance_activate_all();
		
			/// @DnDAction : YoYo Games.Sequences.Sequence_Destroy
			/// @DnDVersion : 1
			/// @DnDHash : 48ACF2EA
			/// @DnDComment : Destroy the pause sequence using the sequence element id we saved earlier
			/// @DnDParent : 39867ACE
			/// @DnDArgument : "var" "pause_sequence"
			layer_sequence_destroy(pause_sequence);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 04F8382C
			/// @DnDComment : Set paused to false
			/// @DnDParent : 39867ACE
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "var" "paused"
			paused = false;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 216C4DE6
/// @DnDComment : Is used by a sequence to lock the menu
/// @DnDArgument : "funcName" "menu_lock_on"
function menu_lock_on() 
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 4B1568E5
	/// @DnDComment : Set the global.menu_lock to true in order $(13_10)to prevent interacting with certain objects
	/// @DnDParent : 216C4DE6
	/// @DnDArgument : "value" "true"
	/// @DnDArgument : "var" "menu_lock"
	global.menu_lock = true;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0396A835
/// @DnDArgument : "funcName" "menu_lock_off"
function menu_lock_off() 
{
	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 2CDADC83
	/// @DnDParent : 0396A835
	/// @DnDArgument : "value" "false"
	/// @DnDArgument : "var" "menu_lock"
	global.menu_lock = false;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4DD7572C
/// @DnDComment : Create a Sequence and using sequence_instance_override to animate an object
/// @DnDInput : 5
/// @DnDArgument : "funcName" "animate_with_sequence"
/// @DnDArgument : "arg" "_layer_id"
/// @DnDArgument : "arg_1" "_x"
/// @DnDArgument : "arg_2" "_y"
/// @DnDArgument : "arg_3" "_sequence_id"
/// @DnDArgument : "arg_4" "_object"
function animate_with_sequence(_layer_id, _x, _y, _sequence_id, _object) 
{
	/// @DnDAction : YoYo Games.Sequences.Sequence_Create
	/// @DnDVersion : 1
	/// @DnDHash : 4D8108E5
	/// @DnDComment : Create the sequence and save its element id to a variable
	/// @DnDParent : 4DD7572C
	/// @DnDArgument : "xpos" "_x"
	/// @DnDArgument : "ypos" "_y"
	/// @DnDArgument : "var" "_seq_elem"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "sequenceid" "_sequence_id"
	/// @DnDArgument : "layer" "_layer_id"
	var _seq_elem = layer_sequence_create(_layer_id, _x, _y, _sequence_id);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 5BCF4370
	/// @DnDComment : Use the sequence element id to get the the sequence id
	/// @DnDParent : 4DD7572C
	/// @DnDArgument : "var" "_seq_inst"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "layer_sequence_get_instance"
	/// @DnDArgument : "arg" "_seq_elem"
	var _seq_inst = layer_sequence_get_instance(_seq_elem);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2F78F0D1
	/// @DnDComment : Override the current instance using the sequence id and the object id we passed in
	/// @DnDInput : 3
	/// @DnDParent : 4DD7572C
	/// @DnDArgument : "function" "sequence_instance_override_object"
	/// @DnDArgument : "arg" "_seq_inst"
	/// @DnDArgument : "arg_1" "_object"
	/// @DnDArgument : "arg_2" "id"
	sequence_instance_override_object(_seq_inst, _object, id);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 6DC1C8D6
/// @DnDComment : Do a group of things we want to do whenever the game ends
/// @DnDArgument : "funcName" "set_game_over"
function set_game_over() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 6BAA9EE7
	/// @DnDApplyTo : obj_wave_manager
	/// @DnDParent : 6DC1C8D6
	with(obj_wave_manager) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 17E92A93
		/// @DnDComment : Set wave_running to false$(13_10)$(13_10)Set waves_over to true
		/// @DnDInput : 2
		/// @DnDParent : 6BAA9EE7
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "expr_1" "true"
		/// @DnDArgument : "var" "wave_running"
		/// @DnDArgument : "var_1" "waves_over"
		wave_running = false;
		waves_over = true;
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 005AF04A
	/// @DnDComment : Set game_over to true
	/// @DnDParent : 6DC1C8D6
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "game_over"
	game_over = true;

	/// @DnDAction : YoYo Games.Common.Set_Global
	/// @DnDVersion : 1
	/// @DnDHash : 575271EA
	/// @DnDComment : Lock the menu so we can't interact with the game any more
	/// @DnDParent : 6DC1C8D6
	/// @DnDArgument : "value" "true"
	/// @DnDArgument : "var" "menu_lock"
	global.menu_lock = true;

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 7B0B523A
	/// @DnDComment : Destroy any current buttons
	/// @DnDApplyTo : obj_button_parent
	/// @DnDParent : 6DC1C8D6
	with(obj_button_parent) instance_destroy();

	/// @DnDAction : YoYo Games.Audio.Stop_Audio
	/// @DnDVersion : 1
	/// @DnDHash : 54C582DA
	/// @DnDComment : Stop the level's music
	/// @DnDParent : 6DC1C8D6
	/// @DnDArgument : "soundid" "snd_music_level"
	/// @DnDSaveInfo : "soundid" "snd_music_level"
	audio_stop_sound(snd_music_level);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 0113F67C
/// @DnDInput : 5
/// @DnDArgument : "funcName" "map_value"
/// @DnDArgument : "arg" "_value"
/// @DnDArgument : "arg_1" "_current_lower_bound"
/// @DnDArgument : "arg_2" "_current_upper_bound"
/// @DnDArgument : "arg_3" "_desired_lowered_bound"
/// @DnDArgument : "arg_4" "_desired_upper_bound"
function map_value(_value, _current_lower_bound, _current_upper_bound, _desired_lowered_bound, _desired_upper_bound) 
{
	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 2903A64E
	/// @DnDComment : Re-maps a number from one range to another$(13_10)For example, the inputs 5, 0, 10, 0, 100 would return 50
	/// @DnDParent : 0113F67C
	/// @DnDArgument : "value" "(((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound"
	return (((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound;
}