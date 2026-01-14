/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 2B64E9B8
event_inherited();

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 46EC3D7F
/// @DnDComment : Create a sell popup and save the id$(13_10)to a temporary variable
/// @DnDArgument : "xpos" "x"
/// @DnDArgument : "ypos" "y + 75"
/// @DnDArgument : "var" "_inst"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_button_tower_sell"
/// @DnDArgument : "layer" ""SequenceInstance""
/// @DnDSaveInfo : "objectid" "obj_button_tower_sell"
var _inst = instance_create_layer(x, y + 75, "SequenceInstance", obj_button_tower_sell);

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 1717B2BB
/// @DnDApplyTo : _inst
with(_inst) {
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2A2CF4D8
	/// @DnDComment : Save the id of the instance that$(13_10)created the popup to the my_manager variable
	/// @DnDInput : 2
	/// @DnDParent : 1717B2BB
	/// @DnDArgument : "expr" "other.id"
	/// @DnDArgument : "expr_1" "my_manager.my_tower.cost * (my_manager.my_tower.level + 1)"
	/// @DnDArgument : "var" "my_manager"
	/// @DnDArgument : "var_1" "cost"
	my_manager = other.id;
	cost = my_manager.my_tower.cost * (my_manager.my_tower.level + 1);
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 4DF2712D
/// @DnDComment : Check if the tower is less than max level
/// @DnDArgument : "var" "my_tower.level"
/// @DnDArgument : "op" "1"
/// @DnDArgument : "value" "my_tower.max_level"
if(my_tower.level < my_tower.max_level)
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 69B772A5
	/// @DnDComment : Create a upgrade popup and save the id$(13_10)to a temporary variable
	/// @DnDParent : 4DF2712D
	/// @DnDArgument : "xpos" "x"
	/// @DnDArgument : "ypos" "y - 225"
	/// @DnDArgument : "var" "_inst"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "objectid" "obj_button_upgrade"
	/// @DnDArgument : "layer" ""SequenceInstance""
	/// @DnDSaveInfo : "objectid" "obj_button_upgrade"
	var _inst = instance_create_layer(x, y - 225, "SequenceInstance", obj_button_upgrade);

	/// @DnDAction : YoYo Games.Common.Apply_To
	/// @DnDVersion : 1
	/// @DnDHash : 50730353
	/// @DnDApplyTo : _inst
	/// @DnDParent : 4DF2712D
	with(_inst) {
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0DEA48F7
		/// @DnDComment : Save the id of the instance that$(13_10)created the popup to the my_manager variable
		/// @DnDInput : 2
		/// @DnDParent : 50730353
		/// @DnDArgument : "expr" "other.id"
		/// @DnDArgument : "expr_1" "my_manager.my_tower.cost"
		/// @DnDArgument : "var" "my_manager"
		/// @DnDArgument : "var_1" "cost"
		my_manager = other.id;
		cost = my_manager.my_tower.cost;
	}
}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 63F2244B
/// @DnDComment : Create an obj_tower_range and save $(13_10)the instance id
/// @DnDArgument : "xpos" "x"
/// @DnDArgument : "ypos" "y - 39"
/// @DnDArgument : "var" "_inst"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "objectid" "obj_tower_range"
/// @DnDArgument : "layer" ""TowerRange""
/// @DnDSaveInfo : "objectid" "obj_tower_range"
var _inst = instance_create_layer(x, y - 39, "TowerRange", obj_tower_range);

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 1FE0888F
/// @DnDBreak : 1

/// @DnDApplyTo : _inst
with(_inst) {
	/// @DnDAction : YoYo Games.Common.Function_Call
	/// @DnDVersion : 1
	/// @DnDHash : 0927BF45
	/// @DnDComment : Scale the x scale by remapping it's range
	/// @DnDInput : 5
	/// @DnDParent : 1FE0888F
	/// @DnDArgument : "var" "image_xscale"
	/// @DnDArgument : "function" "map_value"
	/// @DnDArgument : "arg" "other.my_tower.range"
	/// @DnDArgument : "arg_1" "0"
	/// @DnDArgument : "arg_2" "260"
	/// @DnDArgument : "arg_3" "0"
	/// @DnDArgument : "arg_4" "1"
	image_xscale = map_value(other.my_tower.range, 0, 260, 0, 1);

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 07D5E995
	/// @DnDComment : Set the yscale to be the same as xscale $(13_10)so we don't have to call map_value twice
	/// @DnDParent : 1FE0888F
	/// @DnDArgument : "expr" "image_xscale"
	/// @DnDArgument : "var" "image_yscale"
	image_yscale = image_xscale;
}