/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

act_set_time(200,200);

instance_create_depth(room_width / 2, 100, 0, obj_stageclear);
instance_create_depth(room_width / 2, 240, 0, obj_gameclear);

obj_player.cant_shoot = true;