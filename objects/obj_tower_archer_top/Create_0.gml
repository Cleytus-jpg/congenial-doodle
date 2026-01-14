/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 032C922F
/// @DnDComment : This variable holds the instance id of the archer tower that created it$(13_10) so that it can track that tower
/// @DnDArgument : "expr" "noone"
/// @DnDArgument : "var" "my_base"
my_base = noone;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 172C877B
/// @DnDComment : Use our custom function to animate this instance using a sequence
/// @DnDInput : 5
/// @DnDArgument : "function" "animate_with_sequence"
/// @DnDArgument : "arg" ""Sequences""
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y"
/// @DnDArgument : "arg_3" "seq_tower_build_archer_top"
/// @DnDArgument : "arg_4" "obj_tower_archer_top_dummy"
animate_with_sequence("Sequences", x, y, seq_tower_build_archer_top, obj_tower_archer_top_dummy);