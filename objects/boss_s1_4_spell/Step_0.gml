/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	if(!spell_wait)
	{
		
		switch(global.difficulty)
		{
			case 0:
				var ring_spd = 3;
				var ring_nbr = 8;
				
				var bubble_arc = 2;
				var bubble_spd = 3;
				var arc_dist = 27;
				var arc_dif = -27;
				
				var arrow_ring_nbr = 0;
				var wait_arrow = 60;
				var arrow_spd = 3.5;
			break;
			case 1:
				var ring_spd = 3;
				var ring_nbr = 12;
				
				var bubble_arc = 3;
				var bubble_spd = 5;
				var arc_dist = 50;
				var arc_dif = 27;
				
				var arrow_ring_nbr = 18;
				var wait_arrow = 34;
				var arrow_spd = 5;
			break;
			case 2:
				var ring_spd = 3;
				var ring_nbr = 20;
				
				var bubble_arc = 6;
				var bubble_spd = 6;
				var arc_dist = 28;
				var arc_dif = -arc_dist - 1;
				
				var arrow_ring_nbr = 28;
				var wait_arrow = 24;
				var arrow_spd = 5;
			break;
			case 3:
				var ring_spd = 3.5;
				var ring_nbr = 24;
				
				var bubble_arc = 8;
				var bubble_spd = 7;
				var arc_dist = 25;
				var arc_dif = arc_dist;
				
				var arrow_ring_nbr = 34;
				var wait_arrow = 18;
				var arrow_spd = 5;
			break;
		}
		
		
		
		switch(state)
		{
			case 0://charge
				switch(state_time)
				{
					case 0:
						boss_charge(obj_boss.x,obj_boss.y);
					break;
					case 60:
						state = 1;
					break;
				}
			break;
			case 1://shoot 4 ring
				var dist = 90;
				
				for (var i = 45; i < 405; i += 90)
				{
					var x_pos = obj_boss.x + lengthdir_x(dist,i)
					var y_pos = obj_boss.y + lengthdir_y(dist,i)
					shoot_ring(DAN_BUBBLE,7,ring_nbr,x_pos,y_pos,-90,ring_spd,noone,3)
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
				}
				
				state = 2;
				
			break;
			case 2://wait to state 3
				switch(state_time)
				{
					case 50:
						boss_charge(obj_boss.x,obj_boss.y);
					break;
					case 100:
						state = 3;
					break;
				}
			break;
			case 3:
				
				var wait_bubble = 4;
				
				var lenght = 250;
				
				if (state_time < lenght)
				{
					if (state_time % wait_bubble == 0)
					{
						shoot_arc(DAN_BUBBLE,6,bubble_arc ,obj_boss.x,obj_boss.y,angle_arc,arc_dist,bubble_spd,sfx_shot1,3)
						angle_arc += arc_dif ;
					}
					
					if (state_time % wait_arrow == 0)
					{
						var ang_pos = rng(360,true,4)
						var dist_pos = 15 + rng(40,false,3)
						var x_pos = obj_boss.x + lengthdir_x(dist_pos,ang_pos);
						var y_pos = obj_boss.y + lengthdir_y(dist_pos,ang_pos);
						shoot_ring(DAN_ARROW,3,arrow_ring_nbr,x_pos,y_pos,rng(360,false,2),arrow_spd,sfx_redirect1,1)
					}
					
				}
				else
				{
					state = 4;
				}
			break;
			case 4:
				switch(state_time)
				{
					case 0:
						boss_charge(obj_boss.x,obj_boss.y);
						boss_movement_random(3,40,5);
					break;
					case 50:
						state = 0;
					break;
				}
			break;
		}
	
	}
}

// Inherit the parent event
event_inherited();

