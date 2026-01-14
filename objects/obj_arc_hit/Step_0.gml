/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
/// @DnDVersion : 1
/// @DnDHash : 31D6EC7B
/// @DnDComment : Decrease the image alpha each frame
/// @DnDArgument : "alpha" "-0.1"
/// @DnDArgument : "alpha_relative" "1"
image_alpha += -0.1;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0D2EEBEC
/// @DnDComment : Check if the image alpha is equal to or less than zero
/// @DnDArgument : "var" "image_alpha"
/// @DnDArgument : "op" "4"
if(image_alpha >= 0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 11EFD617
	/// @DnDComment : If the image alpha is equal to or less $(13_10)than zero destroy this instance
	/// @DnDParent : 0D2EEBEC
	instance_destroy();
}