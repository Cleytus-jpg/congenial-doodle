/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 2C9463DF
/// @DnDComment : Sometimes buttons can overlap allowing you to click on both at the same time.$(13_10)To prevent this, we set an alarm for 1 frame so that the click will finish$(13_10)before this variable is set to false.
/// @DnDArgument : "value" "false"
/// @DnDArgument : "var" "popup_menu_exists"
global.popup_menu_exists = false;