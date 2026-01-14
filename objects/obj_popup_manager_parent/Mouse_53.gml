/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 6FAF3642
/// @DnDComment : This variable will tell us whether the player has $(13_10)clicked on a current part of the menu or on something $(13_10)other than the men or the tower or tower base that created the menu
/// @DnDArgument : "var" "_clicked"
/// @DnDArgument : "value" "false"
var _clicked = false;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 1FEE7DDA
/// @DnDComment : Use with to loop through all interactive objects
/// @DnDApplyTo : obj_interactive_parent
with(obj_interactive_parent) {
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 3C922A52
	/// @DnDComment : Use position_meeting to check for a meeting and $(13_10)save the results to a temporary variable
	/// @DnDInput : 3
	/// @DnDParent : 1FEE7DDA
	/// @DnDArgument : "var" "_meeting"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "position_meeting"
	/// @DnDArgument : "arg" "mouse_x"
	/// @DnDArgument : "arg_1" "mouse_y"
	/// @DnDArgument : "arg_2" "id"
	var _meeting = position_meeting(mouse_x, mouse_y, id);

	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 47A4F684
	/// @DnDComment : Check if there is a meeting. If there is,$(13_10)it means we've clicked on something we could interact with
	/// @DnDParent : 1FEE7DDA
	/// @DnDArgument : "expr" "_meeting"
	if(_meeting)
	{
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6970D9A3
		/// @DnDComment : If the instance id is equal to other.my_tower$(13_10)Then this tower is part of the menu
		/// @DnDParent : 47A4F684
		/// @DnDArgument : "var" "id"
		/// @DnDArgument : "value" "other.my_tower"
		if(id == other.my_tower)
		{
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5873DB01
			/// @DnDComment : Set clicked to false
			/// @DnDParent : 6970D9A3
			/// @DnDArgument : "var" "_clicked"
			/// @DnDArgument : "value" "true"
			var _clicked = true;
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 003025F7
		/// @DnDParent : 47A4F684
		else
		{
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 257EC6BD
			/// @DnDComment : If it is not another tower$(13_10)or another tower base$(13_10)then it has to be a menu button
			/// @DnDInput : 2
			/// @DnDParent : 003025F7
			/// @DnDArgument : "expr" "object_is_ancestor(object_index, obj_tower_parent)"
			/// @DnDArgument : "not" "1"
			/// @DnDArgument : "expr_1" "object_index == obj_tower_base"
			/// @DnDArgument : "not_1" "1"
			if(!(object_is_ancestor(object_index, obj_tower_parent)) && !(object_index == obj_tower_base))
			{
				/// @DnDAction : YoYo Games.Common.Temp_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6104D1AC
				/// @DnDComment : If so set clicked to true
				/// @DnDParent : 257EC6BD
				/// @DnDArgument : "var" "_clicked"
				/// @DnDArgument : "value" "true"
				var _clicked = true;
			}
		}
	}
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 07E06E6A
/// @DnDComment : Check if clicked is false. It will be false if$(13_10)the player clicked on something other than the menu$(13_10)or the tower base or tower that created the menu
/// @DnDArgument : "expr" "_clicked"
/// @DnDArgument : "not" "1"
if(!(_clicked))
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 2499F6EE
	/// @DnDComment : Check if confirmed is true (if it is we want to switch to unconfirm)
	/// @DnDParent : 07E06E6A
	/// @DnDArgument : "expr" "confirmed"
	if(confirmed)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7E889F40
		/// @DnDComment : Set confirmed to false
		/// @DnDParent : 2499F6EE
		/// @DnDArgument : "expr" "false"
		/// @DnDArgument : "var" "confirmed"
		confirmed = false;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 4A320BAF
		/// @DnDComment : Loop through all the menu buttons to find the one that is confirmed
		/// @DnDApplyTo : obj_menu_button_parent
		/// @DnDParent : 2499F6EE
		with(obj_menu_button_parent) {
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 1D9889C2
			/// @DnDComment : Check if it is confirmed
			/// @DnDParent : 4A320BAF
			/// @DnDArgument : "expr" "confirmed"
			if(confirmed)
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 79217DE3
				/// @DnDComment : Set confirmed to false
				/// @DnDParent : 1D9889C2
				/// @DnDArgument : "expr" "false"
				/// @DnDArgument : "var" "confirmed"
				confirmed = false;
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 5BE5D4A7
				/// @DnDComment : Use are custom function to switch the icon
				/// @DnDParent : 1D9889C2
				/// @DnDArgument : "function" "switch_icon"
				switch_icon();
			}
		}
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 43368BB5
	/// @DnDComment : If the menu is not in a confirmed state, we want to close the menu
	/// @DnDParent : 07E06E6A
	else
	{
		/// @DnDAction : YoYo Games.Common.Set_Global
		/// @DnDVersion : 1
		/// @DnDHash : 3D8C89F8
		/// @DnDComment : Set global.popup_menu_exists to false
		/// @DnDParent : 43368BB5
		/// @DnDArgument : "value" "false"
		/// @DnDArgument : "var" "popup_menu_exists"
		global.popup_menu_exists = false;
	
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 6281D3B7
		/// @DnDComment : Destroy this popup_menu
		/// @DnDParent : 43368BB5
		instance_destroy();
	}

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 53E4FF6C
	/// @DnDComment : Destroy the tower range icon if one exists
	/// @DnDApplyTo : obj_tower_range
	/// @DnDParent : 07E06E6A
	with(obj_tower_range) instance_destroy();
}