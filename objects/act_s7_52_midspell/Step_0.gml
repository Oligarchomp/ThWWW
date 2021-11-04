/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	switch(spell_wait)
	{
		case 30:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 1:
			boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
		break;
		case 0:
			var bubble_wait = 8;
			var bubble_dist_plus = -2.6;
			var bubble_nbr = 12;
			var bubble_spd = 3;
			var bubble_angle_plus = 0.5;
	
			var wave_lenght = 90;
	
			var aim_wait = 38;
			var aim_ring = 18;
			var aim_spd = 3;
	
			var boss_wait = 260;
	
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(1,0,0);
			}
	
	
			if(step % bubble_wait == 0)
			{
				if(first)
				{
					first = false;
					var dan = DAN_MENTOS;
				}
				else
				{
					var dan = DAN_MENTOS;
				}
				for(var i = 0; i < 360; i += 360 / bubble_nbr)
				{
					var inst = shoot(dan,3.5 - act_dir * 0.5,obj_boss.x,obj_boss.y,angle_shoot + i,0,sfx_shot1,5);
					inst.dist_ref = 0;
					inst.angle_ref = inst.angle;
					inst.x_ref = obj_boss.x;
					inst.y_ref = obj_boss.y;
					inst.dan_dir = act_dir;
			
				}
		
				angle_shoot += bubble_dist_plus * act_dir;
			}
	
	
			if(step % aim_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,3.5 - aim_dir * 0.5,aim_ring,obj_boss.x,obj_boss.y,rng(360,false,7),aim_spd,sfx_redirect1,8);
				aim_dir *= -1;
			}
	
			if(step % wave_lenght == wave_lenght - 1)
			{
				act_dir *= -1;
				angle_shoot = rng(360,false,6);
				first = true;
			}
	
			with(obj_danmaku5)
			{
				dist_ref += bubble_spd;
				angle_ref += bubble_angle_plus * dan_dir;
				x = x_ref + lengthdir_x(dist_ref,angle_ref);
				y = y_ref + lengthdir_y(dist_ref,angle_ref);
		
				if(rot_type == ROT_FOLLOW)
				{
					angle = find_angle(xprevious,yprevious,x,y);	
				}
			}
		break;
	}
}
// Inherit the parent event
event_inherited();

