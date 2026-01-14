/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 5E0F0D09
event_inherited();

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 35CAF745
/// @DnDComment : Create a buy archer popup and save $(13_10)the instance id
/// @DnDArgument : "xpos" "x - 80"
/// @DnDArgument : "ypos" "y - 150"
/// @DnDArgument : "var" "_inst"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_button_tower_buy_archer"
/// @DnDArgument : "layer" ""SequenceInstance""
/// @DnDSaveInfo : "objectid" "obj_button_tower_buy_archer"
var _inst = instance_create_layer(x - 80, y - 150, "SequenceInstance", obj_button_tower_buy_archer);

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 4447B217
/// @DnDApplyTo : _inst
with(_inst) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2409FD4B
	/// @DnDComment : Save the id of the instance that$(13_10)created the popup to the my_manager variable
	/// @DnDParent : 4447B217
	/// @DnDArgument : "expr" "other.id"
	/// @DnDArgument : "var" "my_manager"
	my_manager = other.id;
}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 1F2ACB74
/// @DnDComment : Create a buy arc popup
/// @DnDArgument : "xpos" "x + 80"
/// @DnDArgument : "ypos" "y - 150"
/// @DnDArgument : "var" "_inst"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_button_tower_buy_arc"
/// @DnDArgument : "layer" ""SequenceInstance""
/// @DnDSaveInfo : "objectid" "obj_button_tower_buy_arc"
var _inst = instance_create_layer(x + 80, y - 150, "SequenceInstance", obj_button_tower_buy_arc);

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 531CA52A
/// @DnDApplyTo : _inst
with(_inst) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 4BEF80EA
	/// @DnDComment : Save the id of the instance that$(13_10)created the popup to the my_manager variable
	/// @DnDParent : 531CA52A
	/// @DnDArgument : "expr" "other.id"
	/// @DnDArgument : "var" "my_manager"
	my_manager = other.id;
}