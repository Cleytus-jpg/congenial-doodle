/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 2F8B135B
/// @DnDComment : Get the current amount of money and save it$(13_10)to a temporary variable
/// @DnDArgument : "var" "_money"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "get_money"
var _money = get_money();

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 38CCCF5C
/// @DnDComment : Check if it is currently in the unconfirmed state and if the player can afford it
/// @DnDInput : 2
/// @DnDArgument : "expr" "confirmed"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "expr_1" "_money >= cost"
if(!(confirmed) && _money >= cost)
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 02681F50
	/// @DnDComment : If it is, then check whether $(13_10)the manager is in the confirmed state
	/// @DnDParent : 38CCCF5C
	/// @DnDArgument : "expr" "my_manager.confirmed"
	if(my_manager.confirmed)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 58772E94
		/// @DnDComment : If it is, unconfirm it
		/// @DnDParent : 02681F50
		/// @DnDArgument : "function" "unconfirm_choice"
		unconfirm_choice();
	}

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 6E4658D3
	/// @DnDComment : Confirm this choice
	/// @DnDParent : 38CCCF5C
	/// @DnDArgument : "function" "confirm_choice"
	confirm_choice();

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 064F506E
	/// @DnDComment : Destroy any instance of the tower range
	/// @DnDApplyTo : obj_tower_range
	/// @DnDParent : 38CCCF5C
	with(obj_tower_range) instance_destroy();

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 5056666F
	/// @DnDComment : Create a new instance of the tower range and save$(13_10)its id to a temporary variable to access later
	/// @DnDParent : 38CCCF5C
	/// @DnDArgument : "xpos" "my_manager.x"
	/// @DnDArgument : "ypos" "my_manager.y - 39"
	/// @DnDArgument : "var" "_inst"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_tower_range"
	/// @DnDArgument : "layer" ""TowerRange""
	/// @DnDSaveInfo : "objectid" "obj_tower_range"
	var _inst = instance_create_layer(my_manager.x, my_manager.y - 39, "TowerRange", obj_tower_range);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 02040424
	/// @DnDApplyTo : _inst
	/// @DnDParent : 38CCCF5C
	with(_inst) {
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 0F3D8CA6
		/// @DnDComment : Scale the x scale by remapping it's range and multiplying its current range by 1.25$(13_10)This is what the range will be after upgrading the tower
		/// @DnDInput : 5
		/// @DnDParent : 02040424
		/// @DnDArgument : "var" "image_xscale"
		/// @DnDArgument : "function" "map_value"
		/// @DnDArgument : "arg" "other.my_manager.my_tower.range * 1.25"
		/// @DnDArgument : "arg_1" "0"
		/// @DnDArgument : "arg_2" "260"
		/// @DnDArgument : "arg_3" "0"
		/// @DnDArgument : "arg_4" "1"
		image_xscale = map_value(other.my_manager.my_tower.range * 1.25, 0, 260, 0, 1);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5242E27B
		/// @DnDComment : Set the yscale to be the same as xscale so we don't have to call map_value twice
		/// @DnDParent : 02040424
		/// @DnDArgument : "expr" "image_xscale"
		/// @DnDArgument : "var" "image_yscale"
		image_yscale = image_xscale;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 1749F958
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 021FA1FF
	/// @DnDComment : If it is confirmed and the manager is confirmed
	/// @DnDInput : 3
	/// @DnDParent : 1749F958
	/// @DnDArgument : "expr" "my_manager.confirmed"
	/// @DnDArgument : "expr_1" "confirmed"
	/// @DnDArgument : "expr_2" "_money >= cost"
	if(my_manager.confirmed && confirmed && _money >= cost)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 27CE801E
		/// @DnDComment : Then use our custom function to increase the player's money
		/// @DnDParent : 021FA1FF
		/// @DnDArgument : "function" "adjust_money"
		/// @DnDArgument : "arg" "-cost"
		adjust_money(-cost);
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 1543403A
		/// @DnDComment : Use with to access the tower that spawned this button
		/// @DnDApplyTo : my_manager.my_tower
		/// @DnDParent : 021FA1FF
		with(my_manager.my_tower) {
			/// @DnDAction : YoYo Games.Instances.Call_User_Event
			/// @DnDVersion : 1
			/// @DnDHash : 7984621C
			/// @DnDParent : 1543403A
			/// @DnDArgument : "event" "1"
			event_user(1);
		}
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 67F89B31
		/// @DnDComment : Use the custom function to close the menu
		/// @DnDParent : 021FA1FF
		/// @DnDArgument : "function" "close_menu"
		close_menu();
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 052A2753
	/// @DnDParent : 1749F958
	else
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 661C21B2
		/// @DnDComment : Otherwise, if the image_index is 1 then the player can't afford this upgrade
		/// @DnDParent : 052A2753
		/// @DnDArgument : "var" "image_index"
		/// @DnDArgument : "value" "1"
		if(image_index == 1)
		{
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 0E69AB1D
			/// @DnDComment : Play the no click sound
			/// @DnDParent : 661C21B2
			/// @DnDArgument : "soundid" "snd_button_no_click"
			/// @DnDSaveInfo : "soundid" "snd_button_no_click"
			audio_play_sound(snd_button_no_click, 0, 0, 1.0, undefined, 1.0);
		}
	}
}