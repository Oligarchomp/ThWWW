/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

rot = rng(360,false,3);

vsp = 0;

scale = 1;

image_index = rng(5,true,1);
if(image_index > 1)
{
	image_index = 1;
}

depth += image_index;

alpha = 0.7 - image_index * 0.4;