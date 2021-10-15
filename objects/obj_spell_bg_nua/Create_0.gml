/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


bg_col = $a57420;

width = sprite_get_width(spr_tide);
height = sprite_get_height(spr_tide);

r_width = sprite_get_width(spr_rain);
r_height = sprite_get_height(spr_rain);
r_col = $322205;
x_rain = 0;
y_rain = 0;

rain_mult = 0.5;
x_rain2 = 0;
y_rain2 = 0;


r_hsp = -7;
r_vsp = 20;

hsp = 0.5;
vsp = 0;

tide_spd = 35;
tide_mult = 0.6;

tide_row = 15;
y_list = ds_list_create();
time_list = ds_list_create();

for(var i = 0; i < tide_row; i += 1)
{
	ds_list_add(y_list,room_height / (tide_row - 2)  * i); // -1 so that there is one offscreen
	ds_list_add(time_list,(tide_row - i) * 2 * pi / tide_row * tide_spd);
}