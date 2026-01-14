/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 53AEB8AF
/// @DnDArgument : "code" "/// @description Hud Health$(13_10)$(13_10)$(13_10)var _scale, _alpha, _color;$(13_10)$(13_10)// Set _scale's default value to 1$(13_10)_scale = 1;$(13_10)$(13_10)// Set _alpha's default value to 0$(13_10)_alpha = 0;$(13_10)$(13_10)// Set _color's default value to c_white$(13_10)_color = c_white;$(13_10)$(13_10)// Use with to access the instance variables of obj_gameplay_manager$(13_10)with (obj_gameplay_manager)$(13_10){$(13_10)	// Overwrite _alpha's default value with village_flash_alpha's value$(13_10)	_alpha = village_flash_alpha;$(13_10)	$(13_10)	// Overwrite _color's default value with village_flash_color's value$(13_10)	_color = village_flash_color;$(13_10)	$(13_10)	// Check if village_flash's alpha is greater than zero$(13_10)	if (village_flash_alpha > 0)$(13_10)	{$(13_10)		// If it is, use the custom map_value function to scale the _scale variable$(13_10)		_scale = map_value(village_flash_alpha, 1, 0, 1.15, 1);$(13_10)	}$(13_10)}$(13_10)$(13_10)// Inherit the parent event$(13_10)event_inherited();$(13_10)$(13_10)// Use our custom function to draw the text and the outline $(13_10)draw_text_transformed_outlined(x + 50, y + 42, string(get_village_hp()), _scale, _scale, 0, c_black, c_white);$(13_10)$(13_10)// Check if _alpha is greater than zero$(13_10)if (_alpha > 0)$(13_10){$(13_10)	// Draw the text again using the color and alpha values to change the text's color$(13_10)	draw_text_transformed_color(x + 50, y + 42, string(get_village_hp()), _scale, _scale, 0, _color, _color, _color, _color, _alpha);$(13_10)}$(13_10)"
/// @description Hud Health


var _scale, _alpha, _color;

// Set _scale's default value to 1
_scale = 1;

// Set _alpha's default value to 0
_alpha = 0;

// Set _color's default value to c_white
_color = c_white;

// Use with to access the instance variables of obj_gameplay_manager
with (obj_gameplay_manager)
{
	// Overwrite _alpha's default value with village_flash_alpha's value
	_alpha = village_flash_alpha;
	
	// Overwrite _color's default value with village_flash_color's value
	_color = village_flash_color;
	
	// Check if village_flash's alpha is greater than zero
	if (village_flash_alpha > 0)
	{
		// If it is, use the custom map_value function to scale the _scale variable
		_scale = map_value(village_flash_alpha, 1, 0, 1.15, 1);
	}
}

// Inherit the parent event
event_inherited();

// Use our custom function to draw the text and the outline 
draw_text_transformed_outlined(x + 50, y + 42, string(get_village_hp()), _scale, _scale, 0, c_black, c_white);

// Check if _alpha is greater than zero
if (_alpha > 0)
{
	// Draw the text again using the color and alpha values to change the text's color
	draw_text_transformed_color(x + 50, y + 42, string(get_village_hp()), _scale, _scale, 0, _color, _color, _color, _color, _alpha);
}

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 31AF2321
/// @DnDComment : _scale: Set _scale's default value to 1$(13_10)$(13_10)_alpha: Set _alpha's default value to 0$(13_10)$(13_10)_color: Set _color's default value to c_white
/// @DnDInput : 3
/// @DnDArgument : "var" "_scale"
/// @DnDArgument : "value" "1"
/// @DnDArgument : "var_1" "_alpha"
/// @DnDArgument : "value_1" "0"
/// @DnDArgument : "var_2" "_color"
/// @DnDArgument : "value_2" "c_white"
var _scale = 1;
var _alpha = 0;
var _color = c_white;

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 49A37EB1
/// @DnDApplyTo : obj_gameplay_manager
with(obj_gameplay_manager) {
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 582B302B
	/// @DnDComment : _alpha: Overwrite _alpha's default value with money_flash_alpha's value$(13_10)$(13_10)_color: Overwrite _color's default value with money_flash_color's value
	/// @DnDInput : 2
	/// @DnDParent : 49A37EB1
	/// @DnDArgument : "var" "_alpha"
	/// @DnDArgument : "value" "village_flash_alpha"
	/// @DnDArgument : "var_1" "_color"
	/// @DnDArgument : "value_1" "village_flash_color"
	var _alpha = village_flash_alpha;
	var _color = village_flash_color;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1CBE229A
	/// @DnDComment : Check if money_flash_alpha's alpha is greater than zero
	/// @DnDParent : 49A37EB1
	/// @DnDArgument : "var" "village_flash_alpha"
	/// @DnDArgument : "op" "2"
	if(village_flash_alpha > 0)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 76F12507
		/// @DnDComment : If it is, use the custom map_value function to scale the _scale variable
		/// @DnDInput : 5
		/// @DnDParent : 1CBE229A
		/// @DnDArgument : "var" "_scale"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "map_value"
		/// @DnDArgument : "arg" "village_flash_alpha"
		/// @DnDArgument : "arg_1" "1"
		/// @DnDArgument : "arg_2" "0"
		/// @DnDArgument : "arg_3" "1.15"
		/// @DnDArgument : "arg_4" "1"
		var _scale = map_value(village_flash_alpha, 1, 0, 1.15, 1);
	}
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 091A57BB
/// @DnDComment : Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 7C467615
/// @DnDComment : Save the money number to a variable
/// @DnDArgument : "var" "_village_hp_number"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "get_village_hp"
var _village_hp_number = get_village_hp();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 2B179BC5
/// @DnDComment : Use our custom function to draw the text and the outline
/// @DnDInput : 8
/// @DnDArgument : "function" "draw_text_transformed_outlined"
/// @DnDArgument : "arg" "x + 50"
/// @DnDArgument : "arg_1" "y + 42"
/// @DnDArgument : "arg_2" "_village_hp_number"
/// @DnDArgument : "arg_3" "_scale"
/// @DnDArgument : "arg_4" "_scale"
/// @DnDArgument : "arg_5" "0"
/// @DnDArgument : "arg_6" "c_black"
/// @DnDArgument : "arg_7" "c_white"
draw_text_transformed_outlined(x + 50, y + 42, _village_hp_number, _scale, _scale, 0, c_black, c_white);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 6DAF29DB
/// @DnDComment : Check if _alpha is greater than zero
/// @DnDArgument : "var" "_alpha"
/// @DnDArgument : "op" "2"
if(_alpha > 0)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 4E057E22
	/// @DnDComment : Draw the text again using the color and alpha values to change the text's color
	/// @DnDInput : 11
	/// @DnDParent : 6DAF29DB
	/// @DnDArgument : "function" "draw_text_transformed_color"
	/// @DnDArgument : "arg" "x + 50"
	/// @DnDArgument : "arg_1" "y + 42"
	/// @DnDArgument : "arg_2" "_village_hp_number"
	/// @DnDArgument : "arg_3" "_scale"
	/// @DnDArgument : "arg_4" "_scale"
	/// @DnDArgument : "arg_5" "0"
	/// @DnDArgument : "arg_6" "_color"
	/// @DnDArgument : "arg_7" "_color"
	/// @DnDArgument : "arg_8" "_color"
	/// @DnDArgument : "arg_9" "_color"
	/// @DnDArgument : "arg_10" "_alpha"
	draw_text_transformed_color(x + 50, y + 42, _village_hp_number, _scale, _scale, 0, _color, _color, _color, _color, _alpha);
}