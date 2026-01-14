/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 1D340687
event_inherited();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 02783D08
/// @DnDComment : Use our custom function to animate this instance $(13_10)using a sequence
/// @DnDInput : 5
/// @DnDArgument : "function" "animate_with_sequence"
/// @DnDArgument : "arg" ""Sequences""
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y"
/// @DnDArgument : "arg_3" "seq_popup_button"
/// @DnDArgument : "arg_4" "obj_button_tower_buy_parent"
animate_with_sequence("Sequences", x, y, seq_popup_button, obj_button_tower_buy_parent);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 0A41768B
/// @DnDComment : Use our custom function to create a new icon $(13_10)and save the instance id to the variable my_icon
/// @DnDInput : 6
/// @DnDArgument : "var" "my_icon"
/// @DnDArgument : "function" "create_icon"
/// @DnDArgument : "arg" "x + 3"
/// @DnDArgument : "arg_1" "y - 27"
/// @DnDArgument : "arg_2" ""Sequences""
/// @DnDArgument : "arg_3" "id"
/// @DnDArgument : "arg_4" "spr_tower_icon_upgrade"
/// @DnDArgument : "arg_5" "spr_tower_icon_upgrade"
my_icon = create_icon(x + 3, y - 27, "Sequences", id, spr_tower_icon_upgrade, spr_tower_icon_upgrade);