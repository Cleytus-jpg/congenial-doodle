/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
/// @DnDVersion : 1
/// @DnDHash : 4A6A26C0
/// @DnDComment : Draw the tower shadow underneath the tower
/// @DnDArgument : "x" "x"
/// @DnDArgument : "y" "y"
/// @DnDArgument : "sprite" "spr_tower_shadow"
/// @DnDSaveInfo : "sprite" "spr_tower_shadow"
draw_sprite(spr_tower_shadow, 0, x, y);

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 67B35264
/// @DnDComment : Then draw the tower itself
draw_self();

/// @DnDAction : YoYo Games.Loops.For_Loop
/// @DnDVersion : 1
/// @DnDHash : 34245144
/// @DnDComment : Use a for loop to draw the upgrade stars
/// @DnDArgument : "cond" "i < level"
for(i = 0; i < level; i += 1) {
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 39CA3CB3
	/// @DnDComment : The x position should equal the tower's x plus 70 (off to the right)$(13_10)$(13_10)The y position should equal the tower's y minus 150 (up) and$(13_10)we should add space for every iteration of the loop
	/// @DnDInput : 2
	/// @DnDParent : 34245144
	/// @DnDArgument : "var" "_x"
	/// @DnDArgument : "value" "x + 70"
	/// @DnDArgument : "var_1" "_y"
	/// @DnDArgument : "value_1" "(y - 150) + (i * 36)"
	var _x = x + 70;
	var _y = (y - 150) + (i * 36);

	/// @DnDAction : YoYo Games.Drawing.Draw_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 6B8ECAF9
	/// @DnDComment : Draw the upgrade star
	/// @DnDParent : 34245144
	/// @DnDArgument : "x" "_x"
	/// @DnDArgument : "y" "_y"
	/// @DnDArgument : "sprite" "spr_level_star"
	/// @DnDSaveInfo : "sprite" "spr_level_star"
	draw_sprite(spr_level_star, 0, _x, _y);
}