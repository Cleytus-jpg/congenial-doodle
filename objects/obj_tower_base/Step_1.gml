/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0A84F3AD
/// @DnDComment : If a popup menu exists, exit
/// @DnDArgument : "expr" "global.popup_menu_exists"
if(global.popup_menu_exists)
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 283D867C
	/// @DnDParent : 0A84F3AD
	exit;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 58161C98
/// @DnDComment : Check if the menu is locked
/// @DnDArgument : "expr" "global.menu_lock"
if(global.menu_lock)
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 72709CC0
	/// @DnDComment : If so, set the image to 0 (we don't want to highlight $(13_10)this base if we're in another menu)
	/// @DnDParent : 58161C98
	/// @DnDArgument : "spriteind" "sprite_index"
	sprite_index = sprite_index;
	image_index = 0;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 7D6344BC
else
{
	/// @DnDAction : YoYo Games.Collisions.If_Collision_Point
	/// @DnDVersion : 1
	/// @DnDHash : 524B9117
	/// @DnDComment : Otherwise, check if the mouse is hovering over this instance
	/// @DnDParent : 7D6344BC
	/// @DnDArgument : "x" "mouse_x"
	/// @DnDArgument : "y" "mouse_y"
	/// @DnDArgument : "obj" "id"
	/// @DnDArgument : "notme" "0"
	var l524B9117_0 = collision_point(mouse_x, mouse_y, id, true, 0);
	if((l524B9117_0))
	{
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 51C15000
		/// @DnDComment : Set image_index to 1 (which is the highlighted version of the sprite)
		/// @DnDParent : 524B9117
		/// @DnDArgument : "imageind" "1"
		/// @DnDArgument : "spriteind" "sprite_index"
		sprite_index = sprite_index;
		image_index = 1;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 30E9CA5B
	/// @DnDComment : If the menu isn't locked, and the mouse isn't hovering over this isntance
	/// @DnDParent : 7D6344BC
	else
	{
		/// @DnDAction : YoYo Games.Instances.Set_Sprite
		/// @DnDVersion : 1
		/// @DnDHash : 795AA5FC
		/// @DnDComment : Set image_index to 0 (the unhighlighted version of the sprite)
		/// @DnDParent : 30E9CA5B
		/// @DnDArgument : "spriteind" "sprite_index"
		sprite_index = sprite_index;
		image_index = 0;
	}
}