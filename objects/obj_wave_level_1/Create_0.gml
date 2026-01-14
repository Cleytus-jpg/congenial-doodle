/// @DnDAction : YoYo Games.Instances.Inherit_Event
/// @DnDVersion : 1
/// @DnDHash : 065DA660
event_inherited();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 1F80F2E2
/// @DnDComment : Choose which path to follow
/// @DnDArgument : "expr" "pth_level_1"
/// @DnDArgument : "var" "level_path"
level_path = pth_level_1;

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 22D0006F
/// @DnDComment : Start creating a wave by creating an array and$(13_10)filling it with zombies.
/// @DnDInput : 2
/// @DnDArgument : "var" "enemy_array"
/// @DnDArgument : "function" "array_create"
/// @DnDArgument : "arg" "5"
/// @DnDArgument : "arg_1" "obj_zombie"
enemy_array = array_create(5, obj_zombie);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 48705E71
/// @DnDComment : Go through that new array and replace some zombies$(13_10)with frankensteins (if you want to)
/// @DnDArgument : "expr" "obj_frankenstein"
/// @DnDArgument : "var" "enemy_array[4]"
enemy_array[4] = obj_frankenstein;

/// @DnDAction : YoYo Games.Common.New
/// @DnDVersion : 1
/// @DnDHash : 78F87581
/// @DnDComment : Use are constructor to create a wave struct where$(13_10)the first argument is the enemy array we just created$(13_10)and the second argument is the delay between each enemy spawning
/// @DnDInput : 2
/// @DnDArgument : "var" "_new_wave"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "WaveData"
/// @DnDArgument : "arg" "enemy_array"
/// @DnDArgument : "arg_1" "room_speed * 3"
var _new_wave = new WaveData(enemy_array, room_speed * 3);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 575C6D6C
/// @DnDComment : Push that new wave struct into our wave_array, this will add the $(13_10)new wave to our array of waves. Repeat this process as many times $(13_10)as you want.
/// @DnDInput : 2
/// @DnDArgument : "function" "array_push"
/// @DnDArgument : "arg" "wave_array"
/// @DnDArgument : "arg_1" "_new_wave"
array_push(wave_array, _new_wave);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 03406B53
/// @DnDComment : Start creating a wave by creating an array and$(13_10)filling it with zombies.
/// @DnDInput : 2
/// @DnDArgument : "var" "enemy_array"
/// @DnDArgument : "function" "array_create"
/// @DnDArgument : "arg" "10"
/// @DnDArgument : "arg_1" "obj_zombie"
enemy_array = array_create(10, obj_zombie);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 57FA3077
/// @DnDComment : Go through that new array and replace some zombies$(13_10)with frankensteins (if you want to)
/// @DnDInput : 4
/// @DnDArgument : "expr" "obj_frankenstein"
/// @DnDArgument : "expr_1" "obj_frankenstein"
/// @DnDArgument : "expr_2" "obj_frankenstein"
/// @DnDArgument : "expr_3" "obj_frankenstein"
/// @DnDArgument : "var" "enemy_array[2]"
/// @DnDArgument : "var_1" "enemy_array[7]"
/// @DnDArgument : "var_2" "enemy_array[8]"
/// @DnDArgument : "var_3" "enemy_array[9]"
enemy_array[2] = obj_frankenstein;
enemy_array[7] = obj_frankenstein;
enemy_array[8] = obj_frankenstein;
enemy_array[9] = obj_frankenstein;

/// @DnDAction : YoYo Games.Common.New
/// @DnDVersion : 1
/// @DnDHash : 41FC296E
/// @DnDComment : Use are constructor to create a wave struct where$(13_10)the first argument is the enemy array we just created$(13_10)and the second argument is the delay between each enemy spawning
/// @DnDInput : 2
/// @DnDArgument : "var" "_new_wave"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "WaveData"
/// @DnDArgument : "arg" "enemy_array"
/// @DnDArgument : "arg_1" "room_speed * 1.75"
var _new_wave = new WaveData(enemy_array, room_speed * 1.75);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 1515EB0A
/// @DnDComment : Push that new wave struct into our wave_array, this will add the $(13_10)new wave to our array of waves. Repeat this process as many times $(13_10)as you want.
/// @DnDInput : 2
/// @DnDArgument : "function" "array_push"
/// @DnDArgument : "arg" "wave_array"
/// @DnDArgument : "arg_1" "_new_wave"
array_push(wave_array, _new_wave);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 09BE1234
/// @DnDComment : Start creating a wave by creating an array and$(13_10)filling it with zombies.
/// @DnDInput : 2
/// @DnDArgument : "var" "enemy_array"
/// @DnDArgument : "function" "array_create"
/// @DnDArgument : "arg" "20"
/// @DnDArgument : "arg_1" "obj_zombie"
enemy_array = array_create(20, obj_zombie);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 298F939F
/// @DnDComment : Go through that new array and replace some zombies$(13_10)with frankensteins (if you want to)
/// @DnDInput : 9
/// @DnDArgument : "expr" "obj_frankenstein"
/// @DnDArgument : "expr_1" "obj_frankenstein"
/// @DnDArgument : "expr_2" "obj_frankenstein"
/// @DnDArgument : "expr_3" "obj_frankenstein"
/// @DnDArgument : "expr_4" "obj_frankenstein"
/// @DnDArgument : "expr_5" "obj_frankenstein"
/// @DnDArgument : "expr_6" "obj_frankenstein"
/// @DnDArgument : "expr_7" "obj_frankenstein"
/// @DnDArgument : "expr_8" "obj_frankenstein"
/// @DnDArgument : "var" "enemy_array[2]"
/// @DnDArgument : "var_1" "enemy_array[7]"
/// @DnDArgument : "var_2" "enemy_array[8]"
/// @DnDArgument : "var_3" "enemy_array[9]"
/// @DnDArgument : "var_4" "enemy_array[15]"
/// @DnDArgument : "var_5" "enemy_array[16]"
/// @DnDArgument : "var_6" "enemy_array[17]"
/// @DnDArgument : "var_7" "enemy_array[18]"
/// @DnDArgument : "var_8" "enemy_array[19]"
enemy_array[2] = obj_frankenstein;
enemy_array[7] = obj_frankenstein;
enemy_array[8] = obj_frankenstein;
enemy_array[9] = obj_frankenstein;
enemy_array[15] = obj_frankenstein;
enemy_array[16] = obj_frankenstein;
enemy_array[17] = obj_frankenstein;
enemy_array[18] = obj_frankenstein;
enemy_array[19] = obj_frankenstein;

/// @DnDAction : YoYo Games.Common.New
/// @DnDVersion : 1
/// @DnDHash : 4787D807
/// @DnDComment : Use are constructor to create a wave struct where$(13_10)the first argument is the enemy array we just created$(13_10)and the second argument is the delay between each enemy spawning
/// @DnDInput : 2
/// @DnDArgument : "var" "_new_wave"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "function" "WaveData"
/// @DnDArgument : "arg" "enemy_array"
/// @DnDArgument : "arg_1" "room_speed * 1.55"
var _new_wave = new WaveData(enemy_array, room_speed * 1.55);

/// @DnDAction : YoYo Games.Common.Function_Call
/// @DnDVersion : 1
/// @DnDHash : 4357B91D
/// @DnDComment : Push that new wave struct into our wave_array, this will add the $(13_10)new wave to our array of waves. Repeat this process as many times $(13_10)as you want.
/// @DnDInput : 2
/// @DnDArgument : "function" "array_push"
/// @DnDArgument : "arg" "wave_array"
/// @DnDArgument : "arg_1" "_new_wave"
array_push(wave_array, _new_wave);