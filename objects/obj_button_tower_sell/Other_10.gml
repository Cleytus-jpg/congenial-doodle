/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 7DAB5D4D
/// @DnDComment : Check if it is currently in the unconfirmed state
/// @DnDArgument : "expr" "confirmed"
/// @DnDArgument : "not" "1"
if(!(confirmed))
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 15CF18D6
	/// @DnDComment : If it is, then check whether $(13_10)the manager is in the confirmed state
	/// @DnDParent : 7DAB5D4D
	/// @DnDArgument : "expr" "my_manager.confirmed"
	if(my_manager.confirmed)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 64E78BB8
		/// @DnDComment : If it is, unconfirm it
		/// @DnDParent : 15CF18D6
		/// @DnDArgument : "function" "unconfirm_choice"
		unconfirm_choice();
	}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 71C4875F
	/// @DnDComment : Confirm this choice
	/// @DnDParent : 7DAB5D4D
	/// @DnDArgument : "function" "confirm_choice"
	confirm_choice();
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 20995FBB
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 64DBCC4F
	/// @DnDComment : If it is confirmed and the manager is confirmed
	/// @DnDInput : 2
	/// @DnDParent : 20995FBB
	/// @DnDArgument : "expr" "my_manager.confirmed"
	/// @DnDArgument : "expr_1" "confirmed"
	if(my_manager.confirmed && confirmed)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 4A5DE115
		/// @DnDComment : Then use our custom function to increase the player's money
		/// @DnDParent : 64DBCC4F
		/// @DnDArgument : "function" "adjust_money"
		/// @DnDArgument : "arg" "cost"
		adjust_money(cost);
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 6E57A0C6
		/// @DnDComment : Use with to access the tower that spawned this button
		/// @DnDApplyTo : my_manager.my_tower
		/// @DnDParent : 64DBCC4F
		with(my_manager.my_tower) {
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 19DFAEA2
			/// @DnDComment : Create a new tower base where this tower is located
			/// @DnDParent : 6E57A0C6
			/// @DnDArgument : "xpos" "x"
			/// @DnDArgument : "ypos" "y"
			/// @DnDArgument : "objectid" "obj_tower_base"
			instance_create_layer(x, y, "Instances", obj_tower_base);
		
			/// @DnDAction : YoYo Games.Instances.Destroy_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 7D6F5522
			/// @DnDComment : Destroy this tower
			/// @DnDParent : 6E57A0C6
			instance_destroy();
		
			/// @DnDAction : YoYo Games.Sequences.Sequence_Create
			/// @DnDVersion : 1
			/// @DnDHash : 66625B91
			/// @DnDComment : Create an instance of the sell sequence
			/// @DnDParent : 6E57A0C6
			/// @DnDArgument : "xpos" "x"
			/// @DnDArgument : "ypos" "y"
			/// @DnDArgument : "var" ""
			/// @DnDArgument : "sequenceid" "seq_tower_sell"
			/// @DnDArgument : "layer" ""Sequences""
			layer_sequence_create("Sequences", x, y, seq_tower_sell);
		
			/// @DnDAction : YoYo Games.Random.Choose
			/// @DnDVersion : 1
			/// @DnDHash : 54E56A35
			/// @DnDComment : Choose a random tower sell sound
			/// @DnDInput : 3
			/// @DnDParent : 6E57A0C6
			/// @DnDArgument : "var" "_sound"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "option" "snd_tower_sell_01"
			/// @DnDArgument : "option_1" "snd_tower_sell_02"
			/// @DnDArgument : "option_2" "snd_tower_sell_03"
			var _sound = choose(snd_tower_sell_01, snd_tower_sell_02, snd_tower_sell_03);
		
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 14505444
			/// @DnDComment : Play the random tower sell sound
			/// @DnDParent : 6E57A0C6
			/// @DnDArgument : "soundid" "_sound"
			audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);
		}
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 7231B30C
		/// @DnDComment : Use the custom function to close the menu
		/// @DnDParent : 64DBCC4F
		/// @DnDArgument : "function" "close_menu"
		close_menu();
	}
}