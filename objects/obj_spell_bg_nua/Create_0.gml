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

tide_spd = 50;
tide_mult = 30;

tide_row = 16;


y_list = [];
time_list = [];

for(var i = 0; i < tide_row; i += 1)
{
	array_push(y_list,room_height / (tide_row - 3)  * i); // - so that there is offscreen
	array_push(time_list,(tide_row - i) * 30);
}


