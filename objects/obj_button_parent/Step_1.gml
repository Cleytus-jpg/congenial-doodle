/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7BEDB331
/// @DnDComment : Here we're getting the X position of the mouse on the GUI layer.$(13_10)The Draw GUI event is used to draw the button, which is a separate layer$(13_10)on top of the game. So input for these buttons must also be taken on the GUI layer.
/// @DnDArgument : "var" "_mouse_gui_x"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "device_mouse_x_to_gui"
/// @DnDArgument : "arg" "0"
var _mouse_gui_x = device_mouse_x_to_gui(0);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 56F9AE17
/// @DnDComment : Get the Y position of the mouse on the GUI layer
/// @DnDArgument : "var" "_mouse_gui_y"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "device_mouse_y_to_gui"
/// @DnDArgument : "arg" "0"
var _mouse_gui_y = device_mouse_y_to_gui(0);

/// @DnDAction : YoYo Games.Collisions.If_Collision_Point
/// @DnDVersion : 1
/// @DnDHash : 1117CEC5
/// @DnDComment : Check if the mouse point is colliding with this instance (using 'id').$(13_10)This means the mouse is hovering on the button.
/// @DnDArgument : "x" "_mouse_gui_x"
/// @DnDArgument : "y" "_mouse_gui_y"
/// @DnDArgument : "obj" "self"
/// @DnDArgument : "notme" "0"
var l1117CEC5_0 = collision_point(_mouse_gui_x, _mouse_gui_y, self, true, 0);
if((l1117CEC5_0))
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 069790C8
	/// @DnDComment : If it is, change the frame to the hover frame (1)
	/// @DnDParent : 1117CEC5
	/// @DnDArgument : "imageind" "1"
	/// @DnDArgument : "spriteind" "sprite_index"
	sprite_index = sprite_index;
	image_index = 1;

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Mouse_Pressed
	/// @DnDVersion : 1.1
	/// @DnDHash : 6411F1D1
	/// @DnDComment : If the left mouse button is pressed,
	/// @DnDParent : 1117CEC5
	var l6411F1D1_0;
	l6411F1D1_0 = mouse_check_button_pressed(mb_left);
	if (l6411F1D1_0)
	{
		/// @DnDAction : YoYo Games.Instances.Sprite_Scale
		/// @DnDVersion : 1
		/// @DnDHash : 2DEE88F2
		/// @DnDComment : Reduce the scale of the instance so it appears smaller while it's pressed
		/// @DnDParent : 6411F1D1
		/// @DnDArgument : "xscale" "0.9"
		/// @DnDArgument : "yscale" "0.9"
		image_xscale = 0.9;
		image_yscale = 0.9;
	}

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Mouse_Released
	/// @DnDVersion : 1.1
	/// @DnDHash : 210A0179
	/// @DnDComment : If the left mouse button is released (which is when we register a click),
	/// @DnDParent : 1117CEC5
	var l210A0179_0;
	l210A0179_0 = mouse_check_button_released(mb_left);
	if (l210A0179_0)
	{
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 2C8FB2F6
		/// @DnDComment : Change the frame to the idle frame (0)
		/// @DnDParent : 210A0179
		/// @DnDArgument : "spriteind" "sprite_index"
		sprite_index = sprite_index;
		image_index = 0;
	
		/// @DnDAction : YoYo Games.Instances.Sprite_Scale
		/// @DnDVersion : 1
		/// @DnDHash : 396E24C6
		/// @DnDComment : Reset the scale so the button appears at its normal size
		/// @DnDParent : 210A0179
		image_xscale = 1;
		image_yscale = 1;
	
		/// @DnDAction : YoYo Games.Instances.Call_User_Event
		/// @DnDVersion : 1
		/// @DnDHash : 4ACEACDD
		/// @DnDComment : Call User Event 0 where the button performs its actions
		/// @DnDParent : 210A0179
		event_user(0);
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 671F2A57
/// @DnDComment : If the mouse is not hovering,
else
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 7775BDC3
	/// @DnDComment : Change the frame to the idle frame (0)
	/// @DnDParent : 671F2A57
	/// @DnDArgument : "spriteind" "sprite_index"
	sprite_index = sprite_index;
	image_index = 0;

	/// @DnDAction : YoYo Games.Instances.Sprite_Scale
	/// @DnDVersion : 1
	/// @DnDHash : 56E2350B
	/// @DnDComment : Reset the scale so the button appears at its normal size
	/// @DnDParent : 671F2A57
	image_xscale = 1;
	image_yscale = 1;
}