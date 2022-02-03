/// @description Insert description here
// You can write your code in this editor


repeat(number)
{
	x += lengthdir_x(dist,angle);
	y += lengthdir_y(dist,angle);
	
	boss_charge_circle(x,y,size);
}

if(x < -size) or (x > room_width + size) or (y < -size) or (y > room_height + size)
{
	instance_destroy();	
}

