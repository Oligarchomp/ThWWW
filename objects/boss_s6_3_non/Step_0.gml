/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
		case 70:
			instance_create_depth(obj_boss.x,obj_boss.y,0,obj_helm);
		break;
		case 30:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 0:
			switch(global.difficulty)
			{
				case 0:
					var bubble_wait = 35;
					var bubble_ring = 6;
					var bubble_spd = 1.5;
					var bubble_dist = 360 / bubble_ring / 3.2;
					
					var bullet_wait = 14;
					var bullet_spd = 2.5;
					var bullet_ring = 12;
					var bullet_dist = 360 / bullet_ring / 4.2;
				break;
				case 1:
					var bubble_wait = 26;
					var bubble_ring = 10;
					var bubble_spd = 2;
					var bubble_dist = 360 / bubble_ring / 3.2;
					
					var bullet_wait = 10;
					var bullet_spd = 3;
					var bullet_ring = 16;
					var bullet_dist = 360 / bullet_ring / 4.2;
				break;
				case 2:
					var bubble_wait = 22;
					var bubble_ring = 12;
					var bubble_spd = 2.5;
					var bubble_dist = 360 / bubble_ring / 3.2;
					
					var bullet_wait = 8;
					var bullet_spd = 3.5
					var bullet_ring = 20;
					var bullet_dist = 360 / bullet_ring / 4.2;
				break;
				case 3:
					var bubble_wait = 20;
					var bubble_ring = 14;
					var bubble_spd = 2.5;
					var bubble_dist = 360 / bubble_ring / 3.2;
					
					var bullet_wait = 7;
					var bullet_spd = 3.5;
					var bullet_ring = 22;
					var bullet_dist = 360 / bullet_ring / 4.2;
				break;
			}
			
			var boss_wait = 130;
			
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(0.5,1,1);
			}
			
			if(step % bullet_wait == 0)
			{
				shoot_ring(DAN_BULLET,7,bullet_ring,obj_boss.x,obj_boss.y,bullet_angle,bullet_spd,sfx_shot2,3);
				bullet_angle += bullet_dist;
			}
			
			if(step % bubble_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,1,bubble_ring,obj_boss.x,obj_boss.y,-bubble_angle,bubble_spd,sfx_shot1,4);
				bubble_angle += bubble_dist;
			}
			
		break;
	}
}

// Inherit the parent event
event_inherited();

