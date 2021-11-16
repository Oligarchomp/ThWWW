/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	hsp = lengthdir_x(spd,angle);
	vsp = lengthdir_y(spd,angle);
	
	
	scale = 1 + cos(step / 6) * 0.1;
	
	x += hsp;
	y += vsp;
	
	with (my_hitbox)
	{
		x = other.x;
		y = other.y;
	}
	

	if (!instance_exists(my_hitbox))// explode
	{
		instance_create_depth(x,y,depth,obj_shot_frog_dust);
		
		
		create_shot_hitbox(x,y,1,spr_shot_frog_collision,1.05,9,false)
		play_sound(sfx_redirect2,1,false);
		instance_destroy();
	}
	
	if (y < -offscreen )
	{
		instance_destroy();
		instance_destroy(my_hitbox);
	}
	
	
	step += 1;
}