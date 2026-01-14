/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 41BF6093
/// @DnDComment : Use the draw_self function to draw the sprite $(13_10)which will be the background of the button
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 2C54F9BE
/// @DnDComment : Set the font
/// @DnDArgument : "font" "ft_popup"
draw_set_font(ft_popup);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 2ED6936B
/// @DnDComment : Set the font's color
/// @DnDArgument : "color" "text_color"
/// @DnDArgument : "alpha" "false"
draw_set_colour(text_color & $ffffff);draw_set_alpha(1);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 4F594125
/// @DnDComment : Set the font's alignment
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Drawing.Draw_Value_Transformed
/// @DnDVersion : 1
/// @DnDHash : 7DD6048A
/// @DnDComment : Draw the text
/// @DnDArgument : "x" "-18"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "36"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "xscale" "0"
/// @DnDArgument : "xscale_relative" "1"
/// @DnDArgument : "yscale" "0"
/// @DnDArgument : "yscale_relative" "1"
/// @DnDArgument : "caption" ""
/// @DnDArgument : "text" "cost"
draw_text_transformed(x + -18, y + 36, "" + string(cost), image_xscale + 0, image_yscale + 0, 0);