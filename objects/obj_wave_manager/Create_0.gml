/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6ABFD524
/// @DnDComment : wave_running: This variable tells whether the wave is currently running$(13_10)$(13_10)waves_over: This variable tells whether all the waves have been completed $(13_10)$(13_10)wave: This variable stores the wave number$(13_10)$(13_10)wave_array: This variable stores all the wave struct data$(13_10)$(13_10)current_wave_struct: This variable stores the current wave struct$(13_10)$(13_10)position: This variable stores the index to the current wave struct's array of enemies.$(13_10)It is used to spawn the next enemy in the wave.
/// @DnDInput : 6
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "expr_1" "false"
/// @DnDArgument : "expr_2" "1"
/// @DnDArgument : "expr_3" "[]"
/// @DnDArgument : "expr_4" "noone"
/// @DnDArgument : "var" "wave_running"
/// @DnDArgument : "var_1" "waves_over"
/// @DnDArgument : "var_2" "wave"
/// @DnDArgument : "var_3" "wave_array"
/// @DnDArgument : "var_4" "current_wave_struct"
/// @DnDArgument : "var_5" "position"
wave_running = false;
waves_over = false;
wave = 1;
wave_array = [];
current_wave_struct = noone;
position = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 46EC8841
/// @DnDComment : This variable is used to animate the wave number displayed in the HUD
/// @DnDArgument : "var" "wave_flash_alpha"
wave_flash_alpha = 0;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5D7EF4DC
/// @DnDComment : This variable holds the path to use for the enemies that spawn$(13_10)It should be overwritten in the child object
/// @DnDArgument : "expr" "pth_level_1"
/// @DnDArgument : "var" "level_path"
level_path = pth_level_1;

/// @DnDAction : YoYo Games.Sequences.Sequence_Create
/// @DnDVersion : 1
/// @DnDHash : 7FFE5722
/// @DnDComment : Create start wave button for first wave
/// @DnDArgument : "var" ""
/// @DnDArgument : "sequenceid" "seq_wave_start_button"
/// @DnDArgument : "layer" ""Sequences""
/// @DnDSaveInfo : "sequenceid" "seq_wave_start_button"
layer_sequence_create("Sequences", 0, 0, seq_wave_start_button);