/// @description Insert description here
// You can write your code in this editor



if(global.gp_active)
{
	if (spell_wait == 30)
	{
		boss_charge(obj_boss.x,obj_boss.y);
	}
	if(spell_wait == 0)
	{
		
		switch(global.difficulty)
		{
			case 0:
				var move_wait = 150
				
				var ring_wait = 80;
				var ring_nbr = 5;
				var apple_nbr = 2;
				
				var bubble_spd_min = 1.5;
				var bubble_spd_max = 2;
			break;
			case 1:
				var move_wait = 120
				
				var ring_wait = 66;
				var ring_nbr = 7
				var apple_nbr = 3;
				
				var bubble_spd_min = 2;
				var bubble_spd_max = 3;
			break;
			case 2:
				var move_wait = 115
				
				var ring_wait = 56;
				var ring_nbr = 10;
				var apple_nbr = 6;
				
				var bubble_spd_min = 2;
				var bubble_spd_max = 3;
			break;
			case 3:
				var move_wait = 105
				
				var ring_wait = 46;
				var ring_nbr = 11;
				var apple_nbr = 7;
				
				var bubble_spd_min = 2;
				var bubble_spd_max = 3;
			break;
		}
		
		
		
		if(step % move_wait == move_wait - 1)
		{
			boss_movement_random(4,90,10)
			move_time_ref = step;
		}
		
		
		
		if (step % ring_wait == ring_wait - 1)
		{
			shoot_ring(DAN_BUBBLE,4,ring_nbr,obj_boss.x,obj_boss.y,999,bubble_spd_max,sfx_redirect1,3)
			shoot_ring(DAN_BUBBLE,4,ring_nbr,obj_boss.x,obj_boss.y,998,bubble_spd_min,sfx_redirect1,3)
		}
		
		var bubble_spd = 3;
			
		var dist_arrow = -20;
			
		if (step % ring_wait == ring_wait / 2)
		{
			var open = 36;
			
			repeat(apple_nbr)
			{
				var ang = 90 - open + rng(2*open,false,2);
				
				var inst = shoot(DAN_BUBBLE,6,obj_boss.x,obj_boss.y,ang,bubble_spd + rng(3,false,1),sfx_shot1,2);
				inst.pos_type = POS_SP;
				inst.y_grav_accel = 0.08;
				inst.y_grav_max = 10;
				inst.rot = rng(360,true,3);
				inst.rot_spd *= rng(2,true,2) - 1;
				inst.y_offscreen = 70;
				
				var inst2 = shoot(DAN_NOTE,3,obj_boss.x,obj_boss.y,ang,0,noone,1);
				inst2.my_bubble = inst;
				inst2.pos_type = POS_MANUAL;
				inst2.y_offscreen = 70;
				
				var inst2 = shoot(DAN_ARROW,3,obj_boss.x,obj_boss.y,ang,0,noone,1);
				inst2.my_bubble = inst;
				inst2.pos_type = POS_MANUAL;
				inst2.y_offscreen = 70;

			}	
		}
		
		with(obj_danmaku1)
		{
			if (instance_exists(my_bubble))
			{
				angle = my_bubble.rot;
				rot = angle;
				
				if(danmaku_id == DAN_NOTE)
				{
					rot -= 30;
				}
				
				x = my_bubble.x + lengthdir_x(dist_arrow,angle);
				y = my_bubble.y + lengthdir_y(dist_arrow,angle);
			}
			else
			{
				instance_destroy(self);
			}
			
		}
		
	}
}


// Inherit the parent event
event_inherited();
