/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

bg_col = c_black;

x = room_width / 2;

vsp = 1;

y_pos = ds_list_create();
scale_list = ds_list_create();

ds_list_add(y_pos,rng(room_height,true,1),rng(room_height,true,2),rng(room_height,true,3));
ds_list_add(scale_list,1,1.5,2);

height = sprite_get_height(spr_yuuto_star);
width = sprite_get_width(spr_yuuto_star);