/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5C803770
/// @DnDComment : This is the enemy parent. We set up some default variables here,$(13_10)but many of them will be overridden in the child's create event.$(13_10)$(13_10)This variable stores the enemies max health and is used to scale the health bar
/// @DnDArgument : "expr" "3"
/// @DnDArgument : "var" "max_hp"
max_hp = 3;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0ECD0ED4
/// @DnDComment : Set the enemies hp to its max hp
/// @DnDArgument : "expr" "max_hp"
/// @DnDArgument : "var" "hp"
hp = max_hp;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1BC16331
/// @DnDComment : Sets the object health bar to the enemy hp variable as a value between 0 and 100
/// @DnDArgument : "expr" "(hp / max_hp) * 100"
/// @DnDArgument : "var" "health_bar"
health_bar = (hp / max_hp) * 100;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 265D375D
/// @DnDComment : // These variables store the offset positions for the enemy healthbars
/// @DnDInput : 2
/// @DnDArgument : "expr" "-40"
/// @DnDArgument : "var" "health_offset_x"
/// @DnDArgument : "var_1" "health_offset_y"
health_offset_x = -40;
health_offset_y = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7C91F84E
/// @DnDComment : This variable stores the amount of money the player will get when they defeat it
/// @DnDArgument : "expr" "2"
/// @DnDArgument : "var" "my_value"
my_value = 2;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0BB44268
/// @DnDComment : This variable holds the speed for the enemy
/// @DnDArgument : "expr" "1"
/// @DnDArgument : "var" "my_speed"
my_speed = 1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4E6EAE5C
/// @DnDComment : This variable is used for the enemy's hit flash.$(13_10)It is set to 1 when the enemy is hit by something
/// @DnDArgument : "var" "flash_alpha"
flash_alpha = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4CE6F00B
/// @DnDComment : This variable store the color of the enemy's hit flash
/// @DnDArgument : "expr" "c_white"
/// @DnDArgument : "var" "flash_color"
flash_color = c_white;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 48C5EC91
/// @DnDComment : These variables hold the enemy's past x and y position $(13_10)which are used to get the enemies direction
/// @DnDInput : 2
/// @DnDArgument : "expr" "x"
/// @DnDArgument : "expr_1" "y"
/// @DnDArgument : "var" "x_previous"
/// @DnDArgument : "var_1" "y_previous"
x_previous = x;
y_previous = y;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 510F3921
/// @DnDComment : This variable holds the speed the enemy should move at when moving vertically
/// @DnDArgument : "expr" "my_speed * 0.6"
/// @DnDArgument : "var" "v_speed"
v_speed = my_speed * 0.6;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0EFE87B9
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