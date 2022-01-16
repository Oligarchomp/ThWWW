/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = 6;

max_spd = 8;

acc = 0.5;


if (!instance_exists(parent_enemy))
{
	angle = -90;

	hsp = 0;
	vsp = -max_spd;
}
else
{
	var target = instance_nearest(x,y,parent_enemy);
	angle = find_angle(x,y,target.x,target.y);
	angle = target.mask_index == spr_nothing ? 90 : angle;
	
	hsp = lengthdir_x(max_spd,angle);
	vsp = lengthdir_y(max_spd,angle);
}

rot = 0;
alpha = 0.3;



homming_time = 100;

offscreen = 30;

my_hitbox = create_shot_hitbox(x,y,0,spr_shot_base_collision,1.1,1000,false);

