/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

width = sprite_get_width(spr_grid_reverence);
height = sprite_get_height(spr_grid_reverence);


x_list = ds_list_create();
y_list = ds_list_create();

hsp_list = ds_list_create();
vsp_list = ds_list_create();

col_list = ds_list_create();


ds_list_add(x_list,0,0);
ds_list_add(y_list,0,0);

ds_list_add(hsp_list,1.5,-1);
ds_list_add(vsp_list,1,1.5);

ds_list_add(col_list,$a8571d,$1010ae)

alpha = 0.2;