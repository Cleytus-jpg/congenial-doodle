/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3CAC4527
/// @DnDComment : Set fade out to true
/// @DnDArgument : "expr" "true"
/// @DnDArgument : "var" "fade_out"
fade_out = true;

/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
/// @DnDVersion : 1
/// @DnDHash : 17FA8F9D
/// @DnDComment : Stop the sprite from animating
/// @DnDArgument : "speed" "0"
image_speed = 0;

/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 742D94D5
/// @DnDComment : Set the image index to be the last sprite in the list
/// @DnDArgument : "imageind" "sprite_get_number(sprite_index) - 1"
/// @DnDArgument : "spriteind" "sprite_index"
sprite_index = sprite_index;
image_index = sprite_get_number(sprite_index) - 1;