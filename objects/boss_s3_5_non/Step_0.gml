/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(spell_wait)
	{
		case 40:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 0:
			switch(global.difficulty)
			{
				case 0:
					var bubble_nbr = 9;
					var bubble_spd = 2;
	
					var bubble_wait = 55;
			
					var arrow_nbr = 6;
					var arrow_spd = 3.8;
			
					var arrow_wait = 20;
					var arrow_dist = 10;
				break;
				case 1:
					var bubble_nbr = 16;
					var bubble_spd = 3;
	
					var bubble_wait = 45;
			
					var arrow_nbr = 6;
					var arrow_spd = 4.5;
			
					var arrow_wait = 12;
					var arrow_dist = 5;
				break;
				case 2:
					var bubble_nbr = 20;
					var bubble_spd = 3;
	
					var bubble_wait = 40;
			
					var arrow_nbr = 8;
					var arrow_spd = 5;
			
					var arrow_wait = 10;
					var arrow_dist = 180 / arrow_nbr / 4 ;
				break;
				case 3:
					var bubble_nbr = 24;
					var bubble_spd = 3;
	
					var bubble_wait = 30;
			
					var arrow_nbr = 10;
					var arrow_spd = 5;
			
					var arrow_wait = 8;
					var arrow_dist = 3;
				break;
			}
			var wait_move = 136;
	
			if(step % wait_move == 0)
			{
				boss_movement_random(4,6,2);
			}
			if(step % bubble_wait == 0)
			{
				var ang = rng(360,false,2);
				shoot_ring(DAN_BUBBLE,4,bubble_nbr,obj_boss.x,obj_boss.y,ang,bubble_spd,sfx_shot1,2);
				//shoot_ring(DAN_BUBBLE,7,bubble_nbr,obj_boss.x,obj_boss.y,-angle_shoot,bubble_spd,sfx_shot1,2);
			
		
				//angle_shoot += bubble_dist;
			}
	
			if(step % arrow_wait == 0)
			{
				shoot_ring(DAN_ARROWHEAD,3,arrow_nbr,obj_boss.x,obj_boss.y,angle_shoot2,arrow_spd,sfx_shot3,1);
				shoot_ring(DAN_ARROWHEAD,3,arrow_nbr,obj_boss.x,obj_boss.y,-angle_shoot2 - 180 / arrow_nbr,arrow_spd,sfx_shot3,1);
		
		
				angle_shoot2 += arrow_dist;
			}
	
		break;
	}
}
// Inherit the parent event
event_inherited();

