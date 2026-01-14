/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 09A9BCE7
/// @DnDComment : Check if fade out is true $(13_10)(this is set in the Animation End event)
/// @DnDArgument : "expr" "fade_out"
if(fade_out)
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
	/// @DnDVersion : 1
	/// @DnDHash : 79E762AE
	/// @DnDComment : Decrease the image_alpha
	/// @DnDParent : 09A9BCE7
	/// @DnDArgument : "alpha" "-0.2"
	/// @DnDArgument : "alpha_relative" "1"
	image_alpha += -0.2;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 51870E9F
	/// @DnDComment : Check if the image_alpha is less than or equal to zero
	/// @DnDParent : 09A9BCE7
	/// @DnDArgument : "var" "image_alpha"
	/// @DnDArgument : "op" "3"
	if(image_alpha <= 0)
	{
		/// @DnDAction : YoYo Games.Instances.Destroy_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 72CD0255
		/// @DnDComment : Destroy this instance
		/// @DnDParent : 51870E9F
		instance_destroy();
	}
}