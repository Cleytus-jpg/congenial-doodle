/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 77340CDF
/// @DnDComment : This function is a constructor that creates a struct $(13_10)that contains data for a wave
/// @DnDInput : 2
/// @DnDArgument : "funcName" "WaveData"
/// @DnDArgument : "arg" "_enemy_array"
/// @DnDArgument : "arg_1" "_wave_delay"
/// @DnDArgument : "constructor" "1"
function WaveData(_enemy_array, _wave_delay) constructor
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2E2F7050
	/// @DnDComment : enemy_array: should be an array of GameMaker Objects$(13_10)$(13_10)wave_delay: should be the amount of time in frames you want to wait before spawning a new enemy
	/// @DnDInput : 2
	/// @DnDParent : 77340CDF
	/// @DnDArgument : "expr" "_enemy_array"
	/// @DnDArgument : "expr_1" "_wave_delay"
	/// @DnDArgument : "var" "enemy_array"
	/// @DnDArgument : "var_1" "wave_delay"
	enemy_array = _enemy_array;
	wave_delay = _wave_delay;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 4750406A
/// @DnDComment : Start the next wave
/// @DnDArgument : "funcName" "start_next_wave"
function start_next_wave() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 24E5D615
	/// @DnDApplyTo : obj_wave_manager
	/// @DnDParent : 4750406A
	with(obj_wave_manager) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 01A5BFDB
		/// @DnDComment : current_wave_struct: Assing the next wave struct to the current_wave_struct.$(13_10)The position is wave - 1 because the waves start counting at 1, but arrays are zero indexed.$(13_10)$(13_10)position: This variable marks the current position in the enemy array$(13_10)and will be increased each time an enemy is spawned$(13_10)$(13_10)wave_running: This variable tells whether a wave is currently running
		/// @DnDInput : 3
		/// @DnDParent : 24E5D615
		/// @DnDArgument : "expr" "wave_array[wave - 1]"
		/// @DnDArgument : "expr_2" "true"
		/// @DnDArgument : "var" "current_wave_struct"
		/// @DnDArgument : "var_1" "position"
		/// @DnDArgument : "var_2" "wave_running"
		current_wave_struct = wave_array[wave - 1];
		position = 0;
		wave_running = true;
	
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6D5E6810
		/// @DnDComment : Spawn the first enemy in the wave
		/// @DnDInput : 2
		/// @DnDParent : 24E5D615
		/// @DnDArgument : "function" "event_perform"
		/// @DnDArgument : "arg" "ev_alarm"
		/// @DnDArgument : "arg_1" "0"
		event_perform(ev_alarm, 0);
	}

	/// @DnDAction : YoYo Games.Sequences.Sequence_Create
	/// @DnDVersion : 1
	/// @DnDHash : 2D09B5A0
	/// @DnDParent : 4750406A
	/// @DnDArgument : "var" ""
	/// @DnDArgument : "sequenceid" "seq_wave_start_banner"
	/// @DnDArgument : "layer" ""Sequences""
	/// @DnDSaveInfo : "sequenceid" "seq_wave_start_banner"
	layer_sequence_create("Sequences", 0, 0, seq_wave_start_banner);
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3120A7F6
/// @DnDComment : Returns true if the wave is currently running, otherwise returns false
/// @DnDArgument : "funcName" "wave_is_running"
function wave_is_running() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 52F4F7CA
	/// @DnDApplyTo : obj_wave_manager
	/// @DnDParent : 3120A7F6
	with(obj_wave_manager) {
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 43E90BCA
		/// @DnDComment : Return the boolean value stored in the wave_running variable of obj_wave_manager.$(13_10)return will end the function
		/// @DnDParent : 52F4F7CA
		/// @DnDArgument : "value" "wave_running"
		return wave_running;
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 5A0D3987
	/// @DnDComment : If we make it here, then there is no instance of obj_wave_manager to check,$(13_10)so we will return false instead.
	/// @DnDParent : 3120A7F6
	/// @DnDArgument : "value" "false"
	return false;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 3B821805
/// @DnDComment : Returns true if the waves are over, otherwise returns false
/// @DnDArgument : "funcName" "waves_are_over"
function waves_are_over() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 3C7283C5
	/// @DnDApplyTo : obj_wave_manager
	/// @DnDParent : 3B821805
	with(obj_wave_manager) {
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 54CBA6BD
		/// @DnDComment : Return the boolean value stored in the waves_over variable of obj_wave_manager.$(13_10)return will end the function
		/// @DnDParent : 3C7283C5
		/// @DnDArgument : "value" "waves_over"
		return waves_over;
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 1CD33DB7
	/// @DnDComment : If we make it here, then there is no instance of obj_wave_manager to check,$(13_10)so we will return false instead.
	/// @DnDParent : 3B821805
	/// @DnDArgument : "value" "false"
	return false;
}

/// @DnDAction : YoYo Games.Common.Function
/// @DnDVersion : 1
/// @DnDHash : 6B1C7B49
/// @DnDArgument : "funcName" "return_wave_number"
function return_wave_number() 
{
	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 623BBC7D
	/// @DnDApplyTo : obj_wave_manager
	/// @DnDParent : 6B1C7B49
	with(obj_wave_manager) {
		/// @DnDAction : YoYo Games.Common.Return
		/// @DnDVersion : 1
		/// @DnDHash : 2E7F592B
		/// @DnDComment : Return the number stored in the wave variable of obj_wave_manager.$(13_10) return will end the function
		/// @DnDParent : 623BBC7D
		/// @DnDArgument : "value" "wave"
		return wave;
	}

	/// @DnDAction : YoYo Games.Common.Return
	/// @DnDVersion : 1
	/// @DnDHash : 69255DB0
	/// @DnDComment : If we make it here, then there is no instance of obj_wave_manager to check,$(13_10)so we will return -1 instead.
	/// @DnDParent : 6B1C7B49
	/// @DnDArgument : "value" "-1"
	return -1;
}