/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 552896FB
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0A6C6FA9
/// @DnDComment : This variable stores the enemies max health $(13_10)and is used to scale the health bar
/// @DnDArgument : "expr" "12"
/// @DnDArgument : "var" "max_hp"
max_hp = 12;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3E37A828
/// @DnDComment : Set the enemies hp to its max hp
/// @DnDArgument : "expr" "max_hp"
/// @DnDArgument : "var" "hp"
hp = max_hp;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5916670C
/// @DnDComment : This variable stores the amount of money the player will get when they defeat it
/// @DnDArgument : "expr" "5"
/// @DnDArgument : "var" "my_value"
my_value = 5;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5D32B3F3
/// @DnDComment : This variable holds the speed for the enemy
/// @DnDArgument : "expr" "1.1"
/// @DnDArgument : "var" "my_speed"
my_speed = 1.1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 66F66E22
/// @DnDComment : This variable holds the speed the enemy should move at when moving vertically
/// @DnDArgument : "expr" "my_speed * 0.7"
/// @DnDArgument : "var" "v_speed"
v_speed = my_speed * 0.7;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 230176B1
/// @DnDComment : These variables hold the sprite to use based on$(13_10)the enemies position.
/// @DnDInput : 5
/// @DnDArgument : "expr" "spr_frankenstein_walk_side"
/// @DnDArgument : "expr_1" "spr_frankenstein_walk_up"
/// @DnDArgument : "expr_2" "spr_frankenstein_walk_down"
/// @DnDArgument : "expr_3" "obj_frankenstein_defeat_side"
/// @DnDArgument : "expr_4" "obj_frankenstein_defeat_down"
/// @DnDArgument : "var" "walk_side_sprite"
/// @DnDArgument : "var_1" "walk_up_sprite"
/// @DnDArgument : "var_2" "walk_down_sprite"
/// @DnDArgument : "var_3" "defeat_side_object"
/// @DnDArgument : "var_4" "defeat_down_object"
walk_side_sprite = spr_frankenstein_walk_side;
walk_up_sprite = spr_frankenstein_walk_up;
walk_down_sprite = spr_frankenstein_walk_down;
defeat_side_object = obj_frankenstein_defeat_side;
defeat_down_object = obj_frankenstein_defeat_down;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1ED53426
/// @DnDArgument : "expr" "-190"
/// @DnDArgument : "var" "health_offset_y"
health_offset_y = -190;