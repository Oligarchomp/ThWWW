/// @description Insert description here
// You can write your code in this editor

image_angle = 0;

spd = 40;

y_scale = 1;

alpha = 1;

play_sound(sfx_isoterica,1,false);


inst_nbr = instance_number(obj_isoterica) % 2;

col_step = inst_nbr * 40;

col = make_color_hsv(col_step % 255,100,255);

activated = false;
activated_time = 0;
step = 0;
