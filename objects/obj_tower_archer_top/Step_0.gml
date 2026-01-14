/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 7E8E2D7F
/// @DnDComment : Check if an instance of my_base exists
/// @DnDArgument : "obj" "my_base"
/// @DnDArgument : "not" "1"
var l7E8E2D7F_0 = false;
l7E8E2D7F_0 = instance_exists(my_base);
if(!l7E8E2D7F_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 7CDC3D62
	/// @DnDComment : If no instance does, destroy this tower top
	/// @DnDParent : 7E8E2D7F
	instance_destroy();
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 339C6FB0
/// @DnDComment : If an instance of my base does exist
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4F4A85B8
	/// @DnDComment : Set the depth of this tower top relative to its y value + 150 $(13_10)(this decreases its depth so it will appear above the tower)$(13_10)$(13_10)Update its image index based on its base's image index$(13_10)This will highlight the tower top if the base is highlighted
	/// @DnDInput : 2
	/// @DnDParent : 339C6FB0
	/// @DnDArgument : "expr" "-(y + 150)"
	/// @DnDArgument : "expr_1" "my_base.image_index"
	/// @DnDArgument : "var" "depth"
	/// @DnDArgument : "var_1" "image_index"
	depth = -(y + 150);
	image_index = my_base.image_index;
}