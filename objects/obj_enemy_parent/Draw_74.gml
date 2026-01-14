/// @DnDAction : YoYo Games.Drawing.Draw_Healthbar
/// @DnDVersion : 1
/// @DnDHash : 095BA68F
/// @DnDComment : Draws health bar at set location
/// @DnDArgument : "x1" "x + health_offset_x"
/// @DnDArgument : "y1" "y + health_offset_y"
/// @DnDArgument : "x2" " x + health_offset_x + 69"
/// @DnDArgument : "y2" "y + health_offset_y + 6"
/// @DnDArgument : "value" "health_bar"
/// @DnDArgument : "backcol" "$FF0000FF"
/// @DnDArgument : "barcol" "$FF000000"
/// @DnDArgument : "mincol" "$FF00FF00"
/// @DnDArgument : "maxcol" "$FF00FF00"
draw_healthbar(x + health_offset_x, y + health_offset_y,  x + health_offset_x + 69, y + health_offset_y + 6, health_bar, $FF0000FF & $FFFFFF, $FF00FF00 & $FFFFFF, $FF00FF00 & $FFFFFF, 0, (($FF0000FF>>24) != 0), (($FF000000>>24) != 0));