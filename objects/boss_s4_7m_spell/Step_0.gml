/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var spark_nbr = 10;
			var spark_lenght = 300;
			var spark_rand_lenght = 200;
			var spark_open_max = 8;
			var spark_open_spd = 15;
			var spark_spd_aim = 15;
			
			var spark_spd_rand = 10;
			var spark_spd_rand_git = 3;
			var spark_open_rand = 10;
			var spark_ring = 4;
			var spark_rand_wait = 2;
			
			var wave_wait = 130;
			
			var star_ring = 23;
			var star_spd = 4.5;
			var star_wait = 30;
		break;
		case 1:
			var spark_nbr = 10;
			var spark_lenght = 300;
			var spark_rand_lenght = 200;
			var spark_open_max = 8;
			var spark_open_spd = 15;
			var spark_spd_aim = 15;
			
			var spark_spd_rand = 10;
			var spark_spd_rand_git = 3;
			var spark_open_rand = 8;
			var spark_ring = 6;
			var spark_rand_wait = 2;
			
			var wave_wait = 110;
			
			var star_ring = 30;
			var star_spd = 5.5;
			var star_wait = 18;
		break;
		case 2:
			var spark_nbr = 10;
			var spark_lenght = 300;
			var spark_rand_lenght = 200;
			var spark_open_max = 8;
			var spark_open_spd = 15;
			var spark_spd_aim = 15;
			
			var spark_spd_rand = 10;
			var spark_spd_rand_git = 3;
			var spark_open_rand = 5;
			var spark_ring = 8;
			var spark_rand_wait = 2;
			
			var wave_wait = 100;
			
			var star_ring = 32;
			var star_spd = 6.1;
			var star_wait = 15;
		break;
		case 3:
			var spark_nbr = 10;
			var spark_lenght = 300;
			var spark_rand_lenght = 200;
			var spark_open_max = 8;
			var spark_open_spd = 15;
			var spark_spd_aim = 15;
			
			var spark_spd_rand = 10;
			var spark_spd_rand_git = 3;
			var spark_open_rand = 5;
			var spark_ring = 10;
			var spark_rand_wait = 2;
			
			var wave_wait = 90;
			
			var star_ring = 35;
			var star_spd = 6.7;
			var star_wait = 12;
		break;
	}
	var charge_plus = 50;
	var wait_shoot = 40;
	var shoot_off = 0;
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					aim_dir = find_angle(obj_boss.x,obj_boss.y,obj_player.x,obj_player.y);
				break;
			}
			if (charge_dist < 640)
			{
				boss_charge(obj_boss.x + lengthdir_x(charge_dist,aim_dir),obj_boss.y + lengthdir_y(charge_dist,aim_dir) )
				charge_dist += charge_plus;
			}
			else
			{
				state = 1;
			}
		break;
		case 1:
			if(state_time == wait_shoot)
			{
				state = 2;
				play_sound(sfx_masterspark,1,false);
			}
		break;
		case 2:
			if(state_time < spark_lenght)
			{
				var x_pos = obj_boss.x + lengthdir_x(shoot_off,aim_dir); 
				var y_pos = obj_boss.y + lengthdir_y(shoot_off,aim_dir); 
				
				if(state_time < spark_lenght - spark_rand_lenght)
				{
					for(var i = 0; i < spark_nbr; i += 1)
					{
						var open = sin(state_time / spark_open_spd) * spark_open_max;		
						var ang = aim_dir - open + rng(open * 2,false,i + 1);
						shoot(DAN_BUBBLE,9,x_pos,y_pos,ang,spark_spd_aim + rng(5,false,i),noone,4);
					}
				}
				else
				{
					if(state_time % spark_rand_wait == 0)
					{
						var aim = find_angle(x_pos,y_pos,obj_player.x,obj_player.y) + 180 / spark_ring + spark_open_rand - rng(spark_open_rand * 2,false,9);
						var sp = spark_spd_rand + rng(spark_spd_rand_git,false,1);
						shoot_ring(DAN_BUBBLE,7,spark_ring,x_pos,y_pos,aim,sp,sfx_shot3,4);
					}
					
				}
				
				if(state_time % star_wait == 0)
				{
					if((state_time / star_wait )% 2 == 0)
					{
						var col = 6;	
					}
					else
					{
						var col = 2;
					}
					shoot_ring(DAN_STARBIG,col,star_ring,x_pos,y_pos,rng(360,false,3),star_spd,sfx_shot1,3);
					ring_angle += 360 / star_ring / 2;
				}
				
				screen_shake(3 + rng(2,true,1),2 + rng(3,true,2));
			}
			else
			{
				charge_dist = 0;
				state = 3;
			}
		break;
		case 3:
			switch(state_time)
			{
				case 0:
					wave_dir *= -1;
					boss_movement_goto(room_width / 2 + (90 + rng(30,false,5)) * wave_dir,80,4);
				break;
				case wave_wait:
					state = 0;
				break;
			}
		break;
	}
	
}
// Inherit the parent event
event_inherited();

