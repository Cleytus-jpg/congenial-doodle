/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 736A05DE
/// @DnDComment : Inherit the Draw Self Event from obj_button_parent
event_inherited();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 5FEA1C75
/// @DnDComment : Set the font
/// @DnDArgument : "font" "ft_button"
/// @DnDSaveInfo : "font" "ft_button"
draw_set_font(ft_button);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 5452CB60
/// @DnDComment : Set the horizontal and verticle alignment of the text
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 5FBA88F1
/// @DnDComment : Set the alpha of the text
/// @DnDArgument : "alpha" "image_alpha"
draw_set_alpha(image_alpha);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 6C1BF77F
/// @DnDComment : Use our custom function to draw the text and the outline $(13_10)using the variables we set in the create event.$(13_10)$(13_10)Note, we are using string(text) to convert the text to a string if necessary.
/// @DnDInput : 8
/// @DnDArgument : "function" "draw_text_transformed_outlined"
/// @DnDArgument : "arg" "x"
/// @DnDArgument : "arg_1" "y"
/// @DnDArgument : "arg_2" "string(text)"
/// @DnDArgument : "arg_3" "image_xscale"
/// @DnDArgument : "arg_4" "image_yscale"
/// @DnDArgument : "arg_5" "0"
/// @DnDArgument : "arg_6" "text_outline_color"
/// @DnDArgument : "arg_7" "text_color"
draw_text_transformed_outlined(x, y, string(text), image_xscale, image_yscale, 0, text_outline_color, text_color);

/// @DnDAction : YoYo Games.Drawing.Set_Alpha
/// @DnDVersion : 1
/// @DnDHash : 6D5DD75C
/// @DnDComment : Reset the Alpha
draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 33C4BD99
/// @DnDComment : Reset the Draw Color
/// @DnDArgument : "color" "c_white"
/// @DnDArgument : "alpha" "false"
draw_set_colour(c_white & $ffffff);draw_set_alpha(1);