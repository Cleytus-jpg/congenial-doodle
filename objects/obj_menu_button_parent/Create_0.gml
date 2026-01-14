/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 67739211
/// @DnDComment : cost: This variable stores the cost of the item. $(13_10)It will be overwritten in the child objects$(13_10)$(13_10)text_color: This variable stores the color to draw the text in$(13_10)$(13_10)confirmed: This variable says whether this instance is in the $(13_10)confirmed state or not. It should start in false.
/// @DnDInput : 3
/// @DnDArgument : "expr" "2"
/// @DnDArgument : "expr_1" "c_white"
/// @DnDArgument : "expr_2" "false"
/// @DnDArgument : "var" "cost"
/// @DnDArgument : "var_1" "text_color"
/// @DnDArgument : "var_2" "confirmed"
cost = 2;
text_color = c_white;
confirmed = false;

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 72FBCDFC
/// @DnDComment : This function unconfirms any other confirmed buttons$(13_10)It is only called when there is a confirmed button
/// @DnDArgument : "funcName" "unconfirm_choice"
function unconfirm_choice() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 16BD1540
	/// @DnDComment : Use with to loop through all menu buttons
	/// @DnDApplyTo : obj_menu_button_parent
	/// @DnDParent : 72FBCDFC
	with(obj_menu_button_parent) {
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 66443B1B
		/// @DnDComment : Don't act on the button itself
		/// @DnDParent : 16BD1540
		/// @DnDArgument : "var" "id"
		/// @DnDArgument : "not" "1"
		/// @DnDArgument : "value" "other.id"
		if(!(id == other.id))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 549EC5DF
			/// @DnDComment : For all other buttons, set confirmed to false
			/// @DnDParent : 66443B1B
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "var" "confirmed"
			confirmed = false;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 5C165713
			/// @DnDComment : Use our custom function switch the icon
			/// @DnDParent : 66443B1B
			/// @DnDArgument : "function" "switch_icon"
			switch_icon();
		}
	}
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 6B8074A3
/// @DnDComment : This function sets both the managers and this buttons confirm state to true
/// @DnDArgument : "funcName" "confirm_choice"
function confirm_choice() 
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3831E0B1
	/// @DnDComment : Set the manager's confirmed state to true
	/// @DnDParent : 6B8074A3
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "my_manager.confirmed"
	my_manager.confirmed = true;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 32FB0A5E
	/// @DnDComment : Set this button's confirmed state to true
	/// @DnDParent : 6B8074A3
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "confirmed"
	confirmed = true;

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2C73A7EC
	/// @DnDComment : Use our custom function to switch the icon
	/// @DnDParent : 6B8074A3
	/// @DnDArgument : "function" "switch_icon"
	switch_icon();

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 53118732
	/// @DnDComment : Play the button click sound
	/// @DnDParent : 6B8074A3
	/// @DnDArgument : "soundid" "snd_popup_click"
	audio_play_sound(snd_popup_click, 0, 0, 1.0, undefined, 1.0);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 05F1D300
/// @DnDComment : This function closes out the whole menu
/// @DnDArgument : "funcName" "close_menu"
function close_menu() 
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 4ED3B38A
	/// @DnDComment : Destroy the Popup Manager
	/// @DnDApplyTo : obj_popup_manager_parent
	/// @DnDParent : 05F1D300
	with(obj_popup_manager_parent) instance_destroy();

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 4DFC4E33
	/// @DnDComment : Destroy the tower range
	/// @DnDApplyTo : obj_tower_range
	/// @DnDParent : 05F1D300
	with(obj_tower_range) instance_destroy();

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 6945132D
	/// @DnDApplyTo : obj_gameplay_manager
	/// @DnDParent : 05F1D300
	with(obj_gameplay_manager) {
		/// @DnDAction : YoYo Games.Instances.Set_Alarm
		/// @DnDVersion : 1
		/// @DnDHash : 6936C0EB
		/// @DnDComment : Set alarm[1] to 1 frame. This will turn off the global menu exists flag$(13_10)one frame later so that you can't accidentally click on something at the$(13_10)same time as closing something else
		/// @DnDParent : 6945132D
		/// @DnDArgument : "steps" "1"
		/// @DnDArgument : "alarm" "1"
		alarm_set(1, 1);
	}
}