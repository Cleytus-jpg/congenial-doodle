/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 37F9FB28
/// @DnDComment : This variable tells you whether or not a popup menu currently exists
/// @DnDArgument : "value" "false"
/// @DnDArgument : "var" "popup_menu_exists"
global.popup_menu_exists = false;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 71F7D0A4
/// @DnDComment : This variable tells you whether or not the menu is locked.$(13_10)If this variable is true, it prevents you from interacting with instances
/// @DnDArgument : "value" "false"
/// @DnDArgument : "var" "menu_lock"
global.menu_lock = false;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 0B0EC15F
/// @DnDComment : This variable stores the current screenshot id if one exists. Otherwise, it will store -1.
/// @DnDArgument : "value" "-1"
/// @DnDArgument : "var" "screen_shot_id"
global.screen_shot_id = -1;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 60CF0F1F
/// @DnDComment : Turn off drawing the default cursor
/// @DnDArgument : "function" "window_set_cursor"
/// @DnDArgument : "arg" "cr_none"
window_set_cursor(cr_none);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 57FCAAB5
/// @DnDComment : Give the cursor a sprite
/// @DnDArgument : "expr" "spr_cursor"
/// @DnDArgument : "var" "cursor_sprite"
cursor_sprite = spr_cursor;