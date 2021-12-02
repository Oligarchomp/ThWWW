/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(!spell_wait)
	{
		switch(global.difficulty)
		{
			case 0:
			case 1:
			
				switch(global.difficulty)
				{
					case 0:
						var shoot_nbr = 8;
						var open_max = 46;
						var wait_shoot = 90;
						
						wait_aim = 1000;
					break;
					case 1:
						var shoot_nbr = 17;
						var open_max = 40;
						var wait_shoot = 65;
						
						var wait_aim = 15;
					break;
				}
				
				
				switch(state)
				{
					case 0:
						switch(state_time)
						{
							case 0:
								boss_charge(obj_boss.x,obj_boss.y);
							break;
							case 30:
								repeat(shoot_nbr)
								{
									var inst = shoot(DAN_BUBBLE,1,obj_boss.x,obj_boss.y,90 - open_max + rng(open_max * 2,false,4),3 + rng(3,false,1),sfx_shot1,3);
									inst.pos_type = POS_SP;
									inst.y_grav_accel = .1;
									inst.y_grav_max = 13 + rng(4,false,6);
									
									var inst = shoot(DAN_BALL,1,obj_boss.x,obj_boss.y,90 - open_max + rng(open_max * 2,false,4),3 + rng(3,false,1),sfx_shot1,1);
									inst.pos_type = POS_SP;
									inst.y_grav_accel = .1;
									inst.y_grav_max = 13 + rng(4,false,9);
								}
								
								boss_movement_random(3,33,10);
								state = 1;
							break;
							
						}
					break;
					case 1:
						if (!obj_boss.in_position)
						{
							if(state_time % wait_aim == 0)
							{
								shoot(DAN_BUBBLE,6,obj_boss.x,obj_boss.y,999,3,sfx_redirect3,2);
							}
						}
						if (state_time == wait_shoot)
						{
							state = 0;
						}
					break;
				}
			break;
			case 2:
			case 3:
			
				var wait_move = 125;
		
				if (step % wait_move == 0)
				{
					boss_movement_random(2,50,9)
				}
				
				switch(global.difficulty)
				{
					case 2:
						var wait_ring = 70 
						var ring_start = 190;
						var ring_plus = 25;
						var ring_nbr = 7;
						var wait_geyser = 85;
						var open_geyser = 20;
				
						var bubble_every = 2;
						var gey_time = 60;
				
						var rice_open = 20;
						var rice_time = 10;
					break;
					case 3:
						var wait_ring = 60 
						var ring_start = 180;
						var ring_plus = 25;
						var ring_nbr = 9;
						var open_geyser = 24;
				
						var bubble_every = 1;
						var wait_geyser = 70;
				
						var gey_time = 72;
				
						var rice_open = 17;
						var rice_time = 8;
						
					break;
				}
		
		
				if (step > ring_start)
				{
					if (step % wait_ring == 0)
					{
						shoot_ring(DAN_BUBBLE,4,ring_nbr,obj_boss.x,obj_boss.y,ring_angle ,3,sfx_redirect1,3);
						ring_angle += ring_plus;
					}
				}
		
				switch(state)
				{
					case 0://charging
						var wait_charge = 75;// multiple of 3
				
						if (state_time == 0)
						{
							if(gey_first)
							{
								x_gey = room_width / 2;
								gey_first = false;
							}
							else
							{
								x_gey = obj_player.x;
							}
						}
				
				
						if (state_time < wait_charge)
						{
							if(state_time % (wait_charge / 3) == 0)
							{
								boss_charge(x_gey,room_height)
							}
						}
						else
						{
							state = 1;
							boss_release(x_gey,y_gey,sfx_boss_release);
						}
					break;
					case 1://geyser
			
					var bubble_spd = 8;
					var bubble_fall = 13;
					var open_bubble = open_geyser;
			
					var ball_spd = 8;
					var ball_fall = 13;
					var open_ball = open_geyser;
		
			
						if(state_time < gey_time)
						{
							if(state_time % bubble_every == 0)
							{
								var ang = 90 - open_bubble + rng(open_bubble * 2,false,3);
								var inst = shoot(DAN_BUBBLE,6,x_gey,y_gey,ang,bubble_spd + rng(3,false,4),sfx_shot2,4)
								inst.pos_type = POS_SP;
								inst.y_grav_accel = 0.1;
								inst.y_grav_max = bubble_fall + rng(2,false,6);
							}
					
							var ang = 90 - open_ball + rng(open_ball * 2,false,3);
							var inst = shoot(DAN_BALL,6,x_gey,y_gey,ang,ball_spd + rng(3,false,4),sfx_shot3,2)
							inst.pos_type = POS_SP;
							inst.y_grav_accel = 0.1;
							inst.y_grav_max = ball_fall + rng(2,false,3);
						
						
							var rice_spd = 10;
							var rice_fall = 13;
					
							gey_rice_angle = ( 90 + cos(state_time/ rice_time) * rice_open );
					
							var inst = shoot(DAN_RICE,4,x_gey,y_gey,gey_rice_angle,rice_spd,noone,1)
							inst.pos_type = POS_SP;
							inst.y_grav_accel = 0.1;
							inst.y_grav_max = rice_fall ;
					
					
						}
						else
						{
							state = 2;
						}	
					break;
					case 2://wait
						if(state_time > wait_geyser)
						{
							state = 0;
						}
					break;
				}
		
			break;
		}
	}
}
// Inherit the parent event
event_inherited();

