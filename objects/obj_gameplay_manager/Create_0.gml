/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 47CD7B1B
/// @DnDComment : money: This variable stores the amount of money currently available to spend$(13_10)$(13_10)money_flash_alpha: This variable stores the money_flash_alpha number, $(13_10)and is how we animate the money text in the HUD.$(13_10)$(13_10)money_flash_color: This variable stores the color we want the money to flash in the hud
/// @DnDInput : 3
/// @DnDArgument : "expr" "150"
/// @DnDArgument : "expr_2" "#E5D110"
/// @DnDArgument : "var" "money"
/// @DnDArgument : "var_1" "money_flash_alpha"
/// @DnDArgument : "var_2" "money_flash_color"
money = 150;
money_flash_alpha = 0;
money_flash_color = #E5D110;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 28B9BEA2
/// @DnDComment : village_hp: This variable stores the amount of health the village has$(13_10)$(13_10)village_flash_alpha: This variable stores the village_flash_alpha number,$(13_10)and is how we animate the village hp text in the HUD.$(13_10)$(13_10)village_flash_color: This variable stores the color we want the village hp to flash in the hud
/// @DnDInput : 3
/// @DnDArgument : "expr" "10"
/// @DnDArgument : "expr_2" "c_red"
/// @DnDArgument : "var" "village_hp"
/// @DnDArgument : "var_1" "village_flash_alpha"
/// @DnDArgument : "var_2" "village_flash_color"
village_hp = 10;
village_flash_alpha = 0;
village_flash_color = c_red;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6C4B5CFB
/// @DnDComment : paused: This variable tells whether the game is currently paused.$(13_10)$(13_10)pause_sequence: -1
/// @DnDInput : 2
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "expr_1" "-1"
/// @DnDArgument : "var" "paused"
/// @DnDArgument : "var_1" "pause_sequence"
paused = false;
pause_sequence = -1;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4F96F1B7
/// @DnDComment : This variable tells whether the game is currently over
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "game_over"
game_over = false;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 7414427C
/// @DnDComment : global.menu_lock: This variable tells you whether or not the menu is locked.$(13_10)It is set to false when the gameplay starts$(13_10)$(13_10)global.screen_shot_id: This variable stores the current screenshot id if one exists. $(13_10)Otherwise, it will store -1. It is initialized in obj_persistent_manager, but reset here.
/// @DnDInput : 2
/// @DnDArgument : "value" "false"
/// @DnDArgument : "value_1" "-1"
/// @DnDArgument : "var" "menu_lock"
/// @DnDArgument : "var_1" "screen_shot_id"
global.menu_lock = false;
global.screen_shot_id = -1;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 524A7CFF
/// @DnDComment : Set alarm 0 to go off in 3 seconds
/// @DnDArgument : "steps" "room_speed * 3"
alarm_set(0, room_speed * 3);