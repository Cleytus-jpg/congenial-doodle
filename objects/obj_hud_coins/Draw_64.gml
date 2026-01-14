/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 70511EA9
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
/// @DnDHash : 54E5785E
/// @DnDApplyTo : obj_gameplay_manager
with(obj_gameplay_manager) {
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 18E7156E
	/// @DnDComment : _alpha: Overwrite _alpha's default value with money_flash_alpha's value$(13_10)$(13_10)_color: Overwrite _color's default value with money_flash_color's value
	/// @DnDInput : 2
	/// @DnDParent : 54E5785E
	/// @DnDArgument : "var" "_alpha"
	/// @DnDArgument : "value" "money_flash_alpha"
	/// @DnDArgument : "var_1" "_color"
	/// @DnDArgument : "value_1" "money_flash_color"
	var _alpha = money_flash_alpha;
	var _color = money_flash_color;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 66786136
	/// @DnDComment : Check if money_flash_alpha's alpha is greater than zero
	/// @DnDParent : 54E5785E
	/// @DnDArgument : "var" "money_flash_alpha"
	/// @DnDArgument : "op" "2"
	if(money_flash_alpha > 0)
	{
		/// @DnDAction : YoYo Games.Common.Function_Call
		/// @DnDVersion : 1
		/// @DnDHash : 6C1813B7
		/// @DnDComment : If it is, use the custom map_value function to scale the _scale variable
		/// @DnDInput : 5
		/// @DnDParent : 66786136
		/// @DnDArgument : "var" "_scale"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "function" "map_value"
		/// @DnDArgument : "arg" "money_flash_alpha"
		/// @DnDArgument : "arg_1" "1"
		/// @DnDArgument : "arg_2" "0"
		/// @DnDArgument : "arg_3" "1.15"
		/// @DnDArgument : "arg_4" "1"
		var _scale = map_value(money_flash_alpha, 1, 0, 1.15, 1);
	}
}

/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 3E8E41D9
/// @DnDComment : Inherit the parent event
event_inherited();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 242E6964
/// @DnDComment : Save the money number to a variable
/// @DnDArgument : "var" "_money_number"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "get_money"
var _money_number = get_money();

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 03295737
/// @DnDComment : Use our custom function to draw the text and the outline
/// @DnDInput : 8
/// @DnDArgument : "function" "draw_text_transformed_outlined"
/// @DnDArgument : "arg" "x + 50"
/// @DnDArgument : "arg_1" "y + 42"
/// @DnDArgument : "arg_2" "_money_number"
/// @DnDArgument : "arg_3" "_scale"
/// @DnDArgument : "arg_4" "_scale"
/// @DnDArgument : "arg_5" "0"
/// @DnDArgument : "arg_6" "c_black"
/// @DnDArgument : "arg_7" "c_white"
draw_text_transformed_outlined(x + 50, y + 42, _money_number, _scale, _scale, 0, c_black, c_white);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 3380C756
/// @DnDComment : Check if _alpha is greater than zero
/// @DnDArgument : "var" "_alpha"
/// @DnDArgument : "op" "2"
if(_alpha > 0)
{
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 70C95BCD
	/// @DnDComment : Draw the text again using the color and alpha values to change the text's color
	/// @DnDInput : 11
	/// @DnDParent : 3380C756
	/// @DnDArgument : "function" "draw_text_transformed_color"
	/// @DnDArgument : "arg" "x + 50"
	/// @DnDArgument : "arg_1" "y + 42"
	/// @DnDArgument : "arg_2" "_money_number"
	/// @DnDArgument : "arg_3" "_scale"
	/// @DnDArgument : "arg_4" "_scale"
	/// @DnDArgument : "arg_5" "0"
	/// @DnDArgument : "arg_6" "_color"
	/// @DnDArgument : "arg_7" "_color"
	/// @DnDArgument : "arg_8" "_color"
	/// @DnDArgument : "arg_9" "_color"
	/// @DnDArgument : "arg_10" "_alpha"
	draw_text_transformed_color(x + 50, y + 42, _money_number, _scale, _scale, 0, _color, _color, _color, _color, _alpha);
}