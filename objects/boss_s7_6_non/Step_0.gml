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
			var bubble_wait = 65;
			var bubble_nbr = 17;
			var bubble_spd = 3;
			
			var note_nbr = 6;
			var note_angle_spd = 0.5;
			var note_dist_max = 80;
			
			var boss_wait = 111;
			
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(2,2,1);	
			}
			
			if(step % bubble_wait == 0)
			{
				if(act_dir == 1)
				{
					var col = 1;
				}
				else
				{
					var col = 6;
				}
				var aim = rng(180,false,4);
				var ang = rng(360,false,7);
				for(var i = 0; i < 360; i += 360 / bubble_nbr)
				{
					var bubble = shoot(DAN_BUBBLE,col,obj_boss.x,obj_boss.y,aim + i * act_dir,0,sfx_redirect1,5);
					bubble.x_ref = obj_boss.x;
					bubble.y_ref = obj_boss.y;
					bubble.angle_ref = aim + i * act_dir;
					bubble.dist_ref = 0;
					bubble.x_offscreen = 120;
					bubble.y_offscreen = 160;
					bubble.is_cancelable = false;
					
					for(var j = 0; j < 360; j += 360 / note_nbr)
					{
						var inst = shoot(DAN_MENTOS,col,obj_boss.x,obj_boss.y,ang + j,0,noone,4);
						inst.my_bubble = bubble;
						inst.angle_ref = aim + j;
						inst.dist_ref = 0;
						inst.dir_dan = act_dir;
					}
				}
				
				act_dir *= -1;
			}
			
			//bubble
			with(obj_danmaku5)
			{
				dist_ref += bubble_spd;
				
				x = x_ref + lengthdir_x(dist_ref,angle_ref);
				y = y_ref + lengthdir_y(dist_ref,angle_ref);
			}
			
			
			//note
			with(obj_danmaku4)
			{
				if(instance_exists(my_bubble))
				{
					dist_ref += min(5.5,recursiv(dist_ref,note_dist_max,10,0.1));
					angle_ref += note_angle_spd * dir_dan;
					
					x = my_bubble.x + lengthdir_x(dist_ref,angle_ref);
					y = my_bubble.y + lengthdir_y(dist_ref,angle_ref);
				}
				else
				{
					cancel_bullet(self);
				}
			}
			
		break;
	}
	
}
// Inherit the parent event
event_inherited();

