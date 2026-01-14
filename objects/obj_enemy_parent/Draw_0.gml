/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 057B26C8
/// @DnDComment : Draw the enemy itself
draw_self();

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 54A83463
/// @DnDComment : Check if flash_alpha is greater than zero $(13_10)(which means the enemy has been hit and we should draw the hit flash)
/// @DnDArgument : "var" "flash_alpha"
/// @DnDArgument : "op" "2"
if(flash_alpha > 0)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 1C868CFD
	/// @DnDComment : Set the shader to our custom hit flash shader
	/// @DnDParent : 54A83463
	/// @DnDArgument : "function" "shader_set"
	/// @DnDArgument : "arg" "sh_hit_flash"
	shader_set(sh_hit_flash);

	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
	/// @DnDVersion : 1
	/// @DnDHash : 4F852F1F
	/// @DnDComment : Draw the sprite using our flash color and alpha
	/// @DnDParent : 54A83463
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "xscale" "0"
	/// @DnDArgument : "xscale_relative" "1"
	/// @DnDArgument : "yscale" "0"
	/// @DnDArgument : "yscale_relative" "1"
	/// @DnDArgument : "rot_relative" "1"
	/// @DnDArgument : "alpha" "flash_alpha"
	/// @DnDArgument : "sprite" "sprite_index"
	/// @DnDArgument : "frame" "image_index"
	/// @DnDArgument : "col" "flash_color"
	draw_sprite_ext(sprite_index, image_index, x + 0, y + 0, image_xscale + 0, image_yscale + 0, image_angle + 0, flash_color & $ffffff, flash_alpha);

	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 0B83F5BF
	/// @DnDComment : Reset the shader back to the basic shader
	/// @DnDParent : 54A83463
	/// @DnDArgument : "function" "shader_reset"
	shader_reset();
}