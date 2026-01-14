/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
/// @DnDVersion : 1
/// @DnDHash : 3CC9ABA4
/// @DnDComment : Decrease the image_alpha of the arc
/// @DnDArgument : "alpha" "-0.03"
/// @DnDArgument : "alpha_relative" "1"
image_alpha += -0.03;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 6C68FBDE
/// @DnDComment : Check if the image_alpha is equal to or less than zero
/// @DnDArgument : "var" "image_alpha"
/// @DnDArgument : "op" "3"
if(image_alpha <= 0)
{
	/// @DnDAction : YoYo Games.Random.Choose
	/// @DnDVersion : 1
	/// @DnDHash : 687FB05E
	/// @DnDComment : Choose a random arc attack impact sound
	/// @DnDInput : 2
	/// @DnDParent : 6C68FBDE
	/// @DnDArgument : "var" "_sound"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "option" "snd_impact_arc_01"
	/// @DnDArgument : "option_1" "snd_impact_arc_02"
	var _sound = choose(snd_impact_arc_01, snd_impact_arc_02);

	/// @DnDAction : YoYo Games.Audio.Play_Audio
	/// @DnDVersion : 1.1
	/// @DnDHash : 1626EC2C
	/// @DnDComment : Play a random arc attack impact sound
	/// @DnDParent : 6C68FBDE
	/// @DnDArgument : "soundid" "_sound"
	audio_play_sound(_sound, 0, 0, 1.0, undefined, 1.0);

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 06CF7650
	/// @DnDComment : Destroy this arc
	/// @DnDParent : 6C68FBDE
	instance_destroy();
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 6B1BCBA6
else
{
	/// @DnDAction : YoYo Games.Common.If_Expression
	/// @DnDVersion : 1
	/// @DnDHash : 52AFF625
	/// @DnDInput : 3
	/// @DnDParent : 6B1BCBA6
	/// @DnDArgument : "expr" "image_alpha <= 0.7"
	/// @DnDArgument : "expr_1" "chained"
	/// @DnDArgument : "not_1" "1"
	/// @DnDArgument : "expr_2" "chains_remaining > 0"
	if(image_alpha <= 0.7 && !(chained) && chains_remaining > 0)
	{
		/// @DnDAction : YoYo Games.Common.Temp_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4314FEA1
		/// @DnDInput : 2
		/// @DnDParent : 52AFF625
		/// @DnDArgument : "var" "_lowest"
		/// @DnDArgument : "value" "noone"
		/// @DnDArgument : "var_1" "_lowest_val"
		/// @DnDArgument : "value_1" "infinity"
		var _lowest = noone;
		var _lowest_val = infinity;
	
		/// @DnDAction : YoYo Games.Common.Apply_To
		/// @DnDVersion : 1
		/// @DnDHash : 62BC3E2D
		/// @DnDApplyTo : obj_enemy_parent
		/// @DnDParent : 52AFF625
		with(obj_enemy_parent) {
			/// @DnDAction : YoYo Games.Common.Temp_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 1CC2FDBA
			/// @DnDParent : 62BC3E2D
			/// @DnDArgument : "var" "_prev_target"
			/// @DnDArgument : "value" "false"
			var _prev_target = false;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 466B775F
			/// @DnDParent : 62BC3E2D
			/// @DnDArgument : "var" "_length"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "array_length"
			/// @DnDArgument : "arg" "other.targets_hit_array"
			var _length = array_length(other.targets_hit_array);
		
			/// @DnDAction : YoYo Games.Loops.For_Loop
			/// @DnDVersion : 1
			/// @DnDHash : 2393E1DF
			/// @DnDParent : 62BC3E2D
			/// @DnDArgument : "cond" "i < _length"
			for(i = 0; i < _length; i += 1) {
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 3F00FED8
				/// @DnDParent : 2393E1DF
				/// @DnDArgument : "var" "other.targets_hit_array[i]"
				/// @DnDArgument : "value" "id"
				if(other.targets_hit_array[i] == id)
				{
					/// @DnDAction : YoYo Games.Common.Temp_Variable
					/// @DnDVersion : 1
					/// @DnDHash : 3523AC8F
					/// @DnDParent : 3F00FED8
					/// @DnDArgument : "var" "_prev_target"
					/// @DnDArgument : "value" "true"
					var _prev_target = true;
				
					/// @DnDAction : YoYo Games.Loops.Break
					/// @DnDVersion : 1
					/// @DnDHash : 205689E3
					/// @DnDParent : 3F00FED8
					break;
				}
			}
		
			/// @DnDAction : YoYo Games.Common.If_Expression
			/// @DnDVersion : 1
			/// @DnDHash : 08AB22CF
			/// @DnDParent : 62BC3E2D
			/// @DnDArgument : "expr" "_prev_target"
			/// @DnDArgument : "not" "1"
			if(!(_prev_target))
			{
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 273897AF
				/// @DnDInput : 4
				/// @DnDParent : 08AB22CF
				/// @DnDArgument : "var" "_dist"
				/// @DnDArgument : "var_temp" "1"
				/// @DnDArgument : "function" "point_distance"
				/// @DnDArgument : "arg" "x"
				/// @DnDArgument : "arg_1" "y"
				/// @DnDArgument : "arg_2" "other.target_x"
				/// @DnDArgument : "arg_3" "other.target_y"
				var _dist = point_distance(x, y, other.target_x, other.target_y);
			
				/// @DnDAction : YoYo Games.Common.If_Variable
				/// @DnDVersion : 1
				/// @DnDHash : 10C66E89
				/// @DnDParent : 08AB22CF
				/// @DnDArgument : "var" "_dist"
				/// @DnDArgument : "op" "3"
				/// @DnDArgument : "value" "250"
				if(_dist <= 250)
				{
					/// @DnDAction : YoYo Games.Common.If_Expression
					/// @DnDVersion : 1
					/// @DnDHash : 39F76BF3
					/// @DnDParent : 10C66E89
					/// @DnDArgument : "expr" "(_lowest == noone) || (_dist < _lowest_val) "
					if((_lowest == noone) || (_dist < _lowest_val) )
					{
						/// @DnDAction : YoYo Games.Common.Temp_Variable
						/// @DnDVersion : 1
						/// @DnDHash : 39BD1C6B
						/// @DnDInput : 2
						/// @DnDParent : 39F76BF3
						/// @DnDArgument : "var" "_lowest"
						/// @DnDArgument : "value" "id"
						/// @DnDArgument : "var_1" "_lowest_val"
						/// @DnDArgument : "value_1" "_dist"
						var _lowest = id;
						var _lowest_val = _dist;
					}
				}
			}
		}
	
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 250D05F1
		/// @DnDParent : 52AFF625
		/// @DnDArgument : "var" "_lowest"
		/// @DnDArgument : "not" "1"
		/// @DnDArgument : "value" "noone"
		if(!(_lowest == noone))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 5DFB193D
			/// @DnDInput : 2
			/// @DnDParent : 250D05F1
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "expr_1" "-1"
			/// @DnDArgument : "expr_relative_1" "1"
			/// @DnDArgument : "var" "chained"
			/// @DnDArgument : "var_1" "chains_remaining"
			chained = true;
			chains_remaining += -1;
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 1B2AFA4D
			/// @DnDInput : 2
			/// @DnDParent : 250D05F1
			/// @DnDArgument : "function" "deal_damage"
			/// @DnDArgument : "arg" "_lowest"
			/// @DnDArgument : "arg_1" "2"
			deal_damage(_lowest, 2);
		
			/// @DnDAction : YoYo Games.Common.Function_Call
			/// @DnDVersion : 1
			/// @DnDHash : 010BC681
			/// @DnDInput : 4
			/// @DnDParent : 250D05F1
			/// @DnDArgument : "var" "_inst"
			/// @DnDArgument : "var_temp" "1"
			/// @DnDArgument : "function" "instance_create_depth"
			/// @DnDArgument : "arg" "target_x"
			/// @DnDArgument : "arg_1" "target_y - 125"
			/// @DnDArgument : "arg_2" "target_depth"
			/// @DnDArgument : "arg_3" "obj_arc_chain"
			var _inst = instance_create_depth(target_x, target_y - 125, target_depth, obj_arc_chain);
		
			/// @DnDAction : YoYo Games.Common.Apply_To
			/// @DnDVersion : 1
			/// @DnDHash : 46BC93E4
			/// @DnDApplyTo : _inst
			/// @DnDParent : 250D05F1
			with(_inst) {
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 02105393
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "expr" "_lowest"
				/// @DnDArgument : "var" "target"
				target = _lowest;
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 6D99B25C
				/// @DnDInput : 5
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "function" "array_copy"
				/// @DnDArgument : "arg" "targets_hit_array"
				/// @DnDArgument : "arg_1" "0"
				/// @DnDArgument : "arg_2" "other.targets_hit_array"
				/// @DnDArgument : "arg_3" "0"
				/// @DnDArgument : "arg_4" "array_length(other.targets_hit_array)"
				array_copy(targets_hit_array, 0, other.targets_hit_array, 0, array_length(other.targets_hit_array));
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 6E089B13
				/// @DnDInput : 2
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "function" "array_push"
				/// @DnDArgument : "arg" "targets_hit_array"
				/// @DnDArgument : "arg_1" "target"
				array_push(targets_hit_array, target);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 204CBE33
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "expr" "other.chains_remaining"
				/// @DnDArgument : "var" "chains_remaining"
				chains_remaining = other.chains_remaining;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 72B70D4F
				/// @DnDInput : 3
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "expr" "target.x"
				/// @DnDArgument : "expr_1" "target.y"
				/// @DnDArgument : "expr_2" "target.depth"
				/// @DnDArgument : "var" "target_x"
				/// @DnDArgument : "var_1" "target_y"
				/// @DnDArgument : "var_2" "target_depth"
				target_x = target.x;
				target_y = target.y;
				target_depth = target.depth;
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 474AC28F
				/// @DnDInput : 4
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "var" "image_angle"
				/// @DnDArgument : "function" "point_direction"
				/// @DnDArgument : "arg" "x"
				/// @DnDArgument : "arg_1" "y"
				/// @DnDArgument : "arg_2" "target_x"
				/// @DnDArgument : "arg_3" "target_y - 125"
				image_angle = point_direction(x, y, target_x, target_y - 125);
			
				/// @DnDAction : YoYo Games.Common.Function_Call
				/// @DnDVersion : 1
				/// @DnDHash : 7242A0FF
				/// @DnDInput : 4
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "var" "image_xscale"
				/// @DnDArgument : "function" "point_distance"
				/// @DnDArgument : "arg" "x"
				/// @DnDArgument : "arg_1" "y"
				/// @DnDArgument : "arg_2" "target_x"
				/// @DnDArgument : "arg_3" "target_y - 125"
				image_xscale = point_distance(x, y, target_x, target_y - 125);
			
				/// @DnDAction : YoYo Games.Instances.Sprite_Scale
				/// @DnDVersion : 1
				/// @DnDHash : 7BF0CA67
				/// @DnDParent : 46BC93E4
				/// @DnDArgument : "xscale" "image_xscale / sprite_get_width(sprite_index)"
				image_xscale = image_xscale / sprite_get_width(sprite_index);
				image_yscale = 1;
			}
		}
	}
}