/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 02335D07
event_inherited();

/// @DnDAction : YoYo Games.Drawing.Draw_Sprite_Transformed
/// @DnDVersion : 1
/// @DnDHash : 0A309FF9
/// @DnDComment : Draw the arc_on sprite over the base sprite for the charge up$(13_10)Multiply the image_alpha by 0.5 so that the alpha snaps from 0.5 to 1 when it actually fires
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "xscale" "0"
/// @DnDArgument : "xscale_relative" "1"
/// @DnDArgument : "yscale" "0"
/// @DnDArgument : "yscale_relative" "1"
/// @DnDArgument : "rot_relative" "1"
/// @DnDArgument : "alpha" "power_level * 0.5"
/// @DnDArgument : "sprite" "spr_tower_arc_on"
/// @DnDArgument : "frame" "image_index"
/// @DnDSaveInfo : "sprite" "spr_tower_arc_on"
draw_sprite_ext(spr_tower_arc_on, image_index, x + 0, y + 0, image_xscale + 0, image_yscale + 0, image_angle + 0, $FFFFFF & $ffffff, power_level * 0.5);