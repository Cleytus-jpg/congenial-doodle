/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0AC88AFE
/// @DnDComment : This is the parent object for environment objects.$(13_10)We need to control the depth of each instance of an object in the room$(13_10)so that it appears properly behind or in front of other instances.	$(13_10)Environment objects don't need to move, so we can do this once in the create event.$(13_10)$(13_10)Set the depth of the instance relative to is y position
/// @DnDArgument : "expr" "-y"
/// @DnDArgument : "var" "depth"
depth = -y;