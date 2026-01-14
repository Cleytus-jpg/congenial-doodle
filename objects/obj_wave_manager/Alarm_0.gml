/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 399C5EF9
/// @DnDComment : This alarm will spawn the next enemy in the wave and reset itself$(13_10)only if the current position in the wave is less than the length of the enemy_array.$(13_10)$(13_10)Get the length of the current enemy array (stored in the current_wave_struct)$(13_10)and save its length to a temporary variable
/// @DnDArgument : "var" "_length"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "array_length"
/// @DnDArgument : "arg" "current_wave_struct.enemy_array"
var _length = array_length(current_wave_struct.enemy_array);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 2569920F
/// @DnDComment : Check if the current position is less than the length of the enemy array in the current wave
/// @DnDArgument : "var" "position"
/// @DnDArgument : "op" "1"
/// @DnDArgument : "value" "_length"
if(position < _length)
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1E09CCDB
	/// @DnDComment : Get the next enemy in the enemy_array
	/// @DnDParent : 2569920F
	/// @DnDArgument : "var" "_new_enemy"
	/// @DnDArgument : "value" "current_wave_struct.enemy_array[position]"
	var _new_enemy = current_wave_struct.enemy_array[position];

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 028212A7
	/// @DnDComment : Create a new instance of that enemy and save its$(13_10)id to a temporary variable so we can use it later
	/// @DnDParent : 2569920F
	/// @DnDArgument : "xpos" "x"
	/// @DnDArgument : "ypos" "y"
	/// @DnDArgument : "var" "_inst"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "_new_enemy"
	/// @DnDArgument : "layer" "layer"
	var _inst = instance_create_layer(x, y, layer, _new_enemy);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 668F7330
	/// @DnDApplyTo : _inst
	/// @DnDParent : 2569920F
	with(_inst) {
		/// @DnDAction : YoYo Games.Paths.Start_Path
		/// @DnDVersion : 1.1
		/// @DnDHash : 1805A835
		/// @DnDComment : Start the new enemy on the path
		/// @DnDParent : 668F7330
		/// @DnDArgument : "path" "other.level_path"
		/// @DnDArgument : "speed" "my_speed"
		/// @DnDArgument : "relative" "true"
		path_start(other.level_path, my_speed, path_action_stop, true);
	}

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 03FA0B45
	/// @DnDComment : Increase the position variable so that next time we spawn the next enemy
	/// @DnDParent : 2569920F
	/// @DnDArgument : "expr" "1"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "position"
	position += 1;

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 309690B5
	/// @DnDComment : Reset the alarm using the current wave's wave delay
	/// @DnDParent : 2569920F
	/// @DnDArgument : "steps" "current_wave_struct.wave_delay"
	alarm_set(0, current_wave_struct.wave_delay);
}