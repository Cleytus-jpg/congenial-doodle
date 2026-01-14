/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 2E6DA71C
/// @DnDComment : Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 46DED0C6
/// @DnDComment : Set the font
/// @DnDArgument : "font" "ft_wave_banner"
/// @DnDSaveInfo : "font" "ft_wave_banner"
draw_set_font(ft_wave_banner);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 78AE97C5
/// @DnDComment : Set the horizontal and verticle alignment of the text
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7F6C1A47
/// @DnDComment : Use our custom function to draw the text and $(13_10)the outline using the variables we set in the create event
/// @DnDInput : 8
/// @DnDArgument : "function" "draw_text_transformed_outlined"
/// @DnDArgument : "arg" "x - 100"
/// @DnDArgument : "arg_1" "y + 40"
/// @DnDArgument : "arg_2" "text"
/// @DnDArgument : "arg_3" "1"
/// @DnDArgument : "arg_4" "1"
/// @DnDArgument : "arg_5" "0"
/// @DnDArgument : "arg_6" "#baaa7d"
/// @DnDArgument : "arg_7" "c_black"
draw_text_transformed_outlined(x - 100, y + 40, text, 1, 1, 0, #baaa7d, c_black);