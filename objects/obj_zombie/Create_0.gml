/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 0712DACE
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 08B61038
/// @DnDComment : This variable stores the enemies max health $(13_10)and is used to scale the health bar
/// @DnDArgument : "expr" "4"
/// @DnDArgument : "var" "max_hp"
max_hp = 4;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 19D49163
/// @DnDComment : Set the enemies hp to its max hp
/// @DnDArgument : "expr" "max_hp"
/// @DnDArgument : "var" "hp"
hp = max_hp;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 38F9274B
/// @DnDComment : This variable stores the amount of money the player will get when they defeat it
/// @DnDArgument : "expr" "3"
/// @DnDArgument : "var" "my_value"
my_value = 3;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 772C6F10
/// @DnDComment : This variable holds the speed for the enemy
/// @DnDArgument : "expr" "1.3"
/// @DnDArgument : "var" "my_speed"
my_speed = 1.3;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 37BF554E
/// @DnDComment : This variable holds the speed the enemy should move at when moving vertically
/// @DnDArgument : "expr" "my_speed * 0.6"
/// @DnDArgument : "var" "v_speed"
v_speed = my_speed * 0.6;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7885EF83
/// @DnDComment : These variables hold the sprite to use based on$(13_10)the enemies position.
/// @DnDInput : 5
/// @DnDArgument : "expr" "spr_zombie_walk_side"
/// @DnDArgument : "expr_1" "spr_zombie_walk_up"
/// @DnDArgument : "expr_2" "spr_zombie_walk_down"
/// @DnDArgument : "expr_3" "obj_zombie_defeat_side"
/// @DnDArgument : "expr_4" "obj_zombie_defeat_down"
/// @DnDArgument : "var" "walk_side_sprite"
/// @DnDArgument : "var_1" "walk_up_sprite"
/// @DnDArgument : "var_2" "walk_down_sprite"
/// @DnDArgument : "var_3" "defeat_side_object"
/// @DnDArgument : "var_4" "defeat_down_object"
walk_side_sprite = spr_zombie_walk_side;
walk_up_sprite = spr_zombie_walk_up;
walk_down_sprite = spr_zombie_walk_down;
defeat_side_object = obj_zombie_defeat_side;
defeat_down_object = obj_zombie_defeat_down;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1A232419
/// @DnDArgument : "expr" "-170"
/// @DnDArgument : "var" "health_offset_y"
health_offset_y = -170;