/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 05CAA9A1
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 28FC3FF6
/// @DnDComment : cost: This variable is the cost of buying an archer tower$(13_10)$(13_10)my_tower: This variable holds which type of tower to create
/// @DnDInput : 2
/// @DnDArgument : "expr" "15"
/// @DnDArgument : "expr_1" "obj_tower_archer"
/// @DnDArgument : "var" "cost"
/// @DnDArgument : "var_1" "my_tower"
cost = 15;
my_tower = obj_tower_archer;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 333F067F
/// @DnDComment : Use our custom function to animate this instance using a sequence
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
/// @DnDHash : 2490B587
/// @DnDComment : Use our custom function to create a new icon and $(13_10)save the instance id to the variable my_icon
/// @DnDInput : 6
/// @DnDArgument : "var" "my_icon"
/// @DnDArgument : "function" "create_icon"
/// @DnDArgument : "arg" "x + 3"
/// @DnDArgument : "arg_1" "y - 27"
/// @DnDArgument : "arg_2" ""SequenceIcons""
/// @DnDArgument : "arg_3" "id"
/// @DnDArgument : "arg_4" "spr_tower_icon_archer"
/// @DnDArgument : "arg_5" "spr_tower_icon_archer"
my_icon = create_icon(x + 3, y - 27, "SequenceIcons", id, spr_tower_icon_archer, spr_tower_icon_archer);