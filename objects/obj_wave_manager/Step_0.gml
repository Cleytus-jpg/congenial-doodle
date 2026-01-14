/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 03F28A52
/// @DnDComment : This is how we animate the wave number text in the HUD$(13_10)If wave_flash_alpha is greater than zero
/// @DnDArgument : "var" "wave_flash_alpha"
/// @DnDArgument : "op" "2"
if(wave_flash_alpha > 0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 697C2FE6
	/// @DnDComment : Reduce the wave_flash alpha
	/// @DnDParent : 03F28A52
	/// @DnDArgument : "expr" "-0.03"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "wave_flash_alpha"
	wave_flash_alpha += -0.03;
}

/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 71DF052D
/// @DnDArgument : "expr" "wave_running"
if(wave_running)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 2B429612
	/// @DnDComment : Get the length of the current enemy array$(13_10)and save that length to a temporary variable
	/// @DnDParent : 71DF052D
	/// @DnDArgument : "var" "_length"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "function" "array_length"
	/// @DnDArgument : "arg" "current_wave_struct.enemy_array"
	var _length = array_length(current_wave_struct.enemy_array);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 0923C33D
	/// @DnDComment : If position is greater or equal to the length of the enemy_array,$(13_10)then we have spawned all the enemies for that wave.
	/// @DnDParent : 71DF052D
	/// @DnDArgument : "var" "position"
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "_length"
	if(position >= _length)
	{
		/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
		/// @DnDVersion : 1
		/// @DnDHash : 20292514
		/// @DnDComment : This checks whether all enemies have been destroyed
		/// @DnDParent : 0923C33D
		/// @DnDArgument : "obj" "obj_enemy_parent"
		/// @DnDArgument : "not" "1"
		/// @DnDSaveInfo : "obj" "obj_enemy_parent"
		var l20292514_0 = false;
		l20292514_0 = instance_exists(obj_enemy_parent);
		if(!l20292514_0)
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 29E3A1C1
			/// @DnDComment : wave_running: Set wave running to false since the wave is over$(13_10)$(13_10)wave: Increase the wave number$(13_10)$(13_10)wave_flash_alpha: Set the wave_flash_alpha to 1 so it will animate
			/// @DnDInput : 3
			/// @DnDParent : 20292514
			/// @DnDArgument : "expr" "false"
			/// @DnDArgument : "expr_1" "1"
			/// @DnDArgument : "expr_relative_1" "1"
			/// @DnDArgument : "expr_2" "1"
			/// @DnDArgument : "var" "wave_running"
			/// @DnDArgument : "var_1" "wave"
			/// @DnDArgument : "var_2" "wave_flash_alpha"
			wave_running = false;
			wave += 1;
			wave_flash_alpha = 1;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 1E05A1A7
			/// @DnDComment : If not, get the length of the current wave array$(13_10)and save that length to a temporary variable
			/// @DnDParent : 20292514
			/// @DnDArgument : "var" "_length"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "array_length"
			/// @DnDArgument : "arg" "wave_array"
			var _length = array_length(wave_array);
		
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0971681A
			/// @DnDComment : Check if there are any additional waves using wave - 1 because$(13_10)wave starts at one but arrays start at zero.
			/// @DnDParent : 20292514
			/// @DnDArgument : "var" "wave - 1"
			/// @DnDArgument : "op" "1"
			/// @DnDArgument : "value" "_length"
			if(wave - 1 < _length)
			{
				/// @DnDAction : YoYo Games.Sequences.Sequence_Create
				/// @DnDVersion : 1
				/// @DnDHash : 1BDFF8C8
				/// @DnDComment : Spawn the wave start button
				/// @DnDParent : 0971681A
				/// @DnDArgument : "var" ""
				/// @DnDArgument : "sequenceid" "seq_wave_start_button"
				/// @DnDArgument : "layer" ""Sequences""
				/// @DnDSaveInfo : "sequenceid" "seq_wave_start_button"
				layer_sequence_create("Sequences", 0, 0, seq_wave_start_button);
			
				/// @DnDAction : YoYo Games.Instances.Destroy_Instance
				/// @DnDVersion : 1
				/// @DnDHash : 2E8F9CA5
				/// @DnDComment : Destroy the wave skip button if it exists since it is no longer needed
				/// @DnDApplyTo : obj_button_wave_skip
				/// @DnDParent : 0971681A
				with(obj_button_wave_skip) instance_destroy();
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 509DA6B3
			/// @DnDComment : If all waves have been completed
			/// @DnDParent : 20292514
			else
			{
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 1ED3BB8E
				/// @DnDComment : Set waves_over to true
				/// @DnDParent : 509DA6B3
				/// @DnDArgument : "expr" "true"
				/// @DnDArgument : "var" "waves_over"
				waves_over = true;
			}
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 74602190
		/// @DnDParent : 0923C33D
		else
		{
			/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
			/// @DnDVersion : 1
			/// @DnDHash : 1530052F
			/// @DnDComment : Check if there is already an instance of the$(13_10)wave skip button.
			/// @DnDParent : 74602190
			/// @DnDArgument : "obj" "obj_button_wave_skip"
			/// @DnDArgument : "not" "1"
			/// @DnDSaveInfo : "obj" "obj_button_wave_skip"
			var l1530052F_0 = false;
			l1530052F_0 = instance_exists(obj_button_wave_skip);
			if(!l1530052F_0)
			{
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 7E5F858D
				/// @DnDComment : If not, get the length of the current wave array$(13_10)and save that length to a temporary variable
				/// @DnDParent : 1530052F
				/// @DnDArgument : "var" "_length"
				/// @DnDArgument : "var_temp" "1"
				/// @DnDArgument : "function" "array_length"
				/// @DnDArgument : "arg" "wave_array"
				var _length = array_length(wave_array);
			
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 6C8F76A7
				/// @DnDComment : Check whether or not the current wave is less than the$(13_10)length of the wave array. If it is, then there are still$(13_10)more waves and we should create the skip button.
				/// @DnDParent : 1530052F
				/// @DnDArgument : "var" "wave"
				/// @DnDArgument : "op" "1"
				/// @DnDArgument : "value" "_length"
				if(wave < _length)
				{
					/// @DnDAction : YoYo Games.Sequences.Sequence_Create
					/// @DnDVersion : 1
					/// @DnDHash : 7EF00E26
					/// @DnDComment : This creates a sequence which creates the wave skip button.
					/// @DnDParent : 6C8F76A7
					/// @DnDArgument : "var" ""
					/// @DnDArgument : "sequenceid" "seq_wave_skip_button"
					/// @DnDArgument : "layer" ""Sequences""
					/// @DnDSaveInfo : "sequenceid" "seq_wave_skip_button"
					layer_sequence_create("Sequences", 0, 0, seq_wave_skip_button);
				}
			}
		}
	}
}