/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 47984BB2
/// @DnDComment : Set depth based on its y value
/// @DnDArgument : "expr" "-y"
/// @DnDArgument : "var" "depth"
depth = -y;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 29953D50
/// @DnDComment : This is how we control the hit flash$(13_10)Check if flash_alpha is greater than zero
/// @DnDArgument : "var" "flash_alpha"
/// @DnDArgument : "op" "2"
if(flash_alpha > 0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1EB369FE
	/// @DnDComment : Reduce the flash
	/// @DnDParent : 29953D50
	/// @DnDArgument : "expr" "-0.05"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "flash_alpha"
	flash_alpha += -0.05;
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 6408ACDA
/// @DnDComment : Updates health bar value from hp values as a number between 0 and 100
/// @DnDArgument : "expr" "(hp / max_hp) * 100"
/// @DnDArgument : "var" "health_bar"
health_bar = (hp / max_hp) * 100;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 2F386CD4
/// @DnDComment : Check if this enemies hp is less than or equal to zero
/// @DnDArgument : "var" "hp"
/// @DnDArgument : "op" "3"
if(hp <= 0)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 0C4AECC7
	/// @DnDComment : Give the player some money for destroying the enemey.$(13_10)We do this here, rather than in the destroy event, because we don't want$(13_10)to give any money anytime the enemy is destroyed, only when the enemy is killed.
	/// @DnDParent : 2F386CD4
	/// @DnDArgument : "function" "adjust_money"
	/// @DnDArgument : "arg" "my_value"
	adjust_money(my_value);

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 0BDE75A3
	/// @DnDComment : Destroy this enemy
	/// @DnDParent : 2F386CD4
	instance_destroy();
}