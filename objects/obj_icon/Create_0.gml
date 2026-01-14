/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 621101EA
/// @DnDComment : This variables tells you whether or not it should be destroyed when done animating
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "finished"
finished = false;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 71FB0A49
/// @DnDComment : Use our custom function to animate this instance using a sequence
/// @DnDInput : 5
/// @DnDArgument : "function" "animate_with_sequence"
/// @DnDArgument : "arg" ""SequencesIcons""
/// @DnDArgument : "arg_1" "x"
/// @DnDArgument : "arg_2" "y"
/// @DnDArgument : "arg_3" "seq_popup_icon_in"
/// @DnDArgument : "arg_4" "obj_icon"
animate_with_sequence("SequencesIcons", x, y, seq_popup_icon_in, obj_icon);