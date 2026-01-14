/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 6ECA84EC
/// @DnDComment : This is here because if it is in the Draw GUI$(13_10)the buttons will draw below it.$(13_10)$(13_10)Check if a screenshot exists
/// @DnDArgument : "var" "_sprite_exists"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "sprite_exists"
/// @DnDArgument : "arg" "global.screen_shot_id"
var _sprite_exists = sprite_exists(global.screen_shot_id);

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 48BC9849
/// @DnDComment : If the screensot exists
/// @DnDArgument : "expr" "_sprite_exists"
if(_sprite_exists)
{
	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 4982CC2E
	/// @DnDComment : Draw it
	/// @DnDParent : 48BC9849
	/// @DnDArgument : "sprite" "global.screen_shot_id"
	draw_sprite(global.screen_shot_id, 0, 0, 0);
}

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 5C81CA65
/// @DnDComment : Draw the Sprite
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 5B851366
/// @DnDComment : Set the font
/// @DnDArgument : "font" "ft_game_end_small"
/// @DnDSaveInfo : "font" "ft_game_end_small"
draw_set_font(ft_game_end_small);

/// @DnDAction : YoYo Games.Drawing.Set_Alignment
/// @DnDVersion : 1.1
/// @DnDHash : 69E4E75C
/// @DnDComment : Set the font's alignments
/// @DnDArgument : "halign" "fa_center"
/// @DnDArgument : "valign" "fa_middle"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 01DF2E50
/// @DnDComment : Use our custom function to map an offset for the y value$(13_10)based on the image's xscale. We will subtract this value$(13_10)from the current y position in the next function to $(13_10)move the text as the image scales up.
/// @DnDInput : 5
/// @DnDArgument : "var" "_y"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "map_value"
/// @DnDArgument : "arg" "image_xscale"
/// @DnDArgument : "arg_1" "0"
/// @DnDArgument : "arg_2" "1"
/// @DnDArgument : "arg_3" "0"
/// @DnDArgument : "arg_4" "280"
var _y = map_value(image_xscale, 0, 1, 0, 280);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 0EA5A9DF
/// @DnDComment : Use our custom function to draw the text and the outline
/// @DnDInput : 8
/// @DnDArgument : "function" "draw_text_transformed_outlined"
/// @DnDArgument : "arg" "x"
/// @DnDArgument : "arg_1" "y - _y"
/// @DnDArgument : "arg_2" ""GAME PAUSED""
/// @DnDArgument : "arg_3" "image_xscale"
/// @DnDArgument : "arg_4" "image_yscale"
/// @DnDArgument : "arg_5" "image_angle"
/// @DnDArgument : "arg_6" "#baaa7d"
/// @DnDArgument : "arg_7" "#33261E"
draw_text_transformed_outlined(x, y - _y, "GAME PAUSED", image_xscale, image_yscale, image_angle, #baaa7d, #33261E);