/// @description Insert description here
// You can write your code in this editor

if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var claw_final_x_off = 10;
			var claw_lenght = 9;
			var claw_spd = 80;
		
			var move_start = 160;
			var move_wait = 130;
			
			var aim_wait = 80;
			var aim_nbr_ring = 18;
			var aim_nbr_row = 1;
			var aim_spd_min = 2;
			var aim_spd_max = 3;
		break;
		case 1:
			var claw_final_x_off = 10;
			var claw_lenght = 11;
			var claw_spd = 65;
		
			var move_start = 160;
			var move_wait = 130;
			
			var aim_wait = 50;
			var aim_nbr_ring = 38;
			var aim_nbr_row = 1;
			var aim_spd_min = 2.5;
			var aim_spd_max = 3.4;
		break;
		case 2:
			var claw_final_x_off = 10;
			var claw_lenght = 12;
			var claw_spd = 55;
		
			var move_start = 160;
			var move_wait = 130;
			
			var aim_wait = 40;
			var aim_nbr_ring = 46;
			var aim_nbr_row = 1;
			var aim_spd_min = 2.8;
			var aim_spd_max = 3.5;
		break;
		case 3:
			var claw_final_x_off = 10;
			var claw_lenght = 12;
			var claw_spd = 46;
		
			var move_start = 160;
			var move_wait = 130;
			
			var aim_wait = 36;
			var aim_nbr_ring = 55;
			var aim_nbr_row = 1;
			var aim_spd_min = 3;
			var aim_spd_max = 3.7;
		break;
	}
	
	
	switch(state)
	{
		case 0:
		
			//x_claw_left += 1;
			//x_claw_right -= 1;
			
			switch(state_time)
			{
				case 0://preparation
					for(var i = 0; i <= room_width; i += room_width / 5)
					{
						boss_charge(i,room_height);
					}
					
					
					//preparing body
					shoot_arc_row(DAN_BUBBLE,6,24,3,x_body,y_body,90,5,18,20,noone,1);
					
					//preparing claws
					//left
					shoot_row(DAN_BUBBLE,6,claw_lenght,x_claw_left,y_claw_left,90,1,claw_lenght,noone,4);
					shoot_row(DAN_BUBBLE,6,claw_lenght - 2,x_claw_left,y_claw_left,100,1,claw_lenght - 1.5,noone,4);
					shoot_row(DAN_BUBBLE,6,claw_lenght - 4,x_claw_left,y_claw_left,110,1,claw_lenght - 3,noone,4);
					
					shoot_row(DAN_BUBBLE,6,9,x_claw_left,y_claw_left,0,1,9,noone,5);
					shoot_row(DAN_BUBBLE,6,3,x_claw_left,y_claw_left,240,1,3,noone,5);
					
					//right
					shoot_row(DAN_BUBBLE,6,claw_lenght,x_claw_right,y_claw_right,90,1,claw_lenght,noone,4);
					shoot_row(DAN_BUBBLE,6,claw_lenght - 2,x_claw_right,y_claw_right,80,1,claw_lenght - 1.5,noone,4);
					shoot_row(DAN_BUBBLE,6,claw_lenght - 4,x_claw_right,y_claw_right,70,1,claw_lenght - 3,noone,4);
					
					shoot_row(DAN_BUBBLE,6,9,x_claw_right,y_claw_right,180,1,9,noone,5);
					shoot_row(DAN_BUBBLE,6,3,x_claw_right,y_claw_right,-60,1,3,noone,5);
					
					with(obj_danmaku4)
					{
						x_offscreen = 350;
						is_cancelable = false;
					}
					with(obj_danmaku5)
					{
						x_offscreen = 250;
						is_cancelable = false;
					}
				break;
				case 40:
					boss_release(room_width / 2, room_height,sfx_spawn_water);
				break;
				case 70:
					boss_charge(-20,y_claw_ref);
					boss_charge(room_width + 20,y_claw_ref);
				break;
				case 100:
					state = 1;	
					boss_release(-20,y_claw_ref,sfx_spawn_water);
					boss_release(room_width + 20,y_claw_ref,sfx_spawn_water);
				break;
			}
			
			if(state_time > 40)
			{
				y_body += recursiv(y_body,room_height + 150,10,0.01);
			}
			
		break;
		case 1://HERE IT COMES, THE GIANT ENEMY CRAB!
			var x_plus = recursiv(x_claw_left,claw_final_x_off,16,0.01);
			if(x_plus > 6)
			{
				x_plus = 6;
			}
			x_claw_left += x_plus;
			
			var x_plus = recursiv(x_claw_right,room_width - claw_final_x_off,16,0.01);
			if(x_plus < -8)
			{
				x_plus = -8;
			}
			x_claw_right += x_plus;
			
			if(state_time > 50)
			{
				state = 2;
			}
		break;
		case 2: // wait left
			switch(state_time)
			{
				case 0:
					//boss_charge(x_claw_left - 30,y_claw_left);
				break;
				case 30:
					state = 3;
				break;
			}
		break;
		case 3://close and open claw
			open_claw_left = -45 + cos(state_time / claw_spd) * 45;
			var time_ref = pi * claw_spd;
			
			if(state_time == floor(time_ref) - 30)
			{
				//boss_charge(x_claw_right + 30,y_claw_right);
			}
			if(state_time >= time_ref)
			{
				open_claw_right = 45 - cos((state_time - time_ref) / claw_spd) * 45;
			}
		break;
	
	}
	
	if (step == move_start - 30)
	{
			boss_charge(30,0)
			boss_charge(room_width - 30,0)
	}
	if (step == move_start)
	{
			boss_release(30,0,sfx_boss_release);
			boss_release(room_width - 30,0,sfx_boss_release);

	}
	
	if(step > move_start)
	{
		if (step % move_wait == 0)
		{
			boss_movement_random(3,29,0);
		}
		
		if(step % aim_wait == 0)
		{
			shoot_ring_row(DAN_KNIFE,6,aim_nbr_ring,aim_nbr_row,obj_boss.x,obj_boss.y,999,aim_spd_min,aim_spd_max,sfx_redirect1,2);
			shoot_ring_row(DAN_KNIFE,1,aim_nbr_ring,aim_nbr_row,obj_boss.x,obj_boss.y,998,aim_spd_min,aim_spd_max,sfx_redirect1,3);
		}
		
		//rain
		if(step % 2 == 0)
		{
			shoot(DAN_KNIFE,2,rng(100,false,1),-rng(10,false,2),-90,10 + rng(5,false,3),noone,8);
		}
		else
		{
			shoot(DAN_KNIFE,2,room_width - rng(100,false,6),-rng(10,false,4),-90,10 + rng(5,false,5),noone,8);
		}
		
	}
	
	
	with(obj_danmaku3)
	{
		spd = goto_value(spd,0,0.02)
		if(spd==0)
		{
			cancel_bullet(self);
		}
		
	}
	
	
	var crab = self;
	//claw move
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
				is_left = x < room_width / 2;
				rot_spd = 0;
				spd += recursiv(spd,0,20,0.15)
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				if(is_left)
				{
					angle_ref = find_angle(crab.x_claw_left, crab.y_claw_left,x,y)
					dist_ref = sqrt(sqr( crab.x_claw_left - x) + sqr(crab.y_claw_left - y))
				}
				else
				{
					angle_ref = find_angle(crab.x_claw_right, crab.y_claw_right,x,y)
					dist_ref = sqrt(sqr( crab.x_claw_right - x) + sqr(crab.y_claw_right - y))
				}
				state = 2;
			break;
			case 2:
				if(is_left)
				{
					x = crab.x_claw_left + lengthdir_x(dist_ref,angle_ref + crab.open_claw_left);
					y = crab.y_claw_left + lengthdir_y(dist_ref,angle_ref + crab.open_claw_left);
				}
				else
				{
					x = crab.x_claw_right + lengthdir_x(dist_ref,angle_ref + crab.open_claw_right);
					y = crab.y_claw_right + lengthdir_y(dist_ref,angle_ref + crab.open_claw_right);
				}
			break;
		}
		
	}
	//claw set
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				is_left = x < room_width / 2;
				rot_spd = 0;
				spd += recursiv(spd,0,20,0.1)
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				if(is_left)
				{
					x_off = x - crab.x_claw_left;
					y_off = y - crab.y_claw_left;
				}
				else
				{
					x_off = x - crab.x_claw_right;
					y_off = y - crab.y_claw_right;
				}
				state = 2;
			break;
			case 2:
				if(is_left)
				{
					x = crab.x_claw_left + x_off;
					y = crab.y_claw_left + y_off;
				}
				else
				{
					x = crab.x_claw_right + x_off;
					y = crab.y_claw_right + y_off;
				}
			break;
		}
	}
	
	with(obj_danmaku1) //BODY
	{
		switch(state)
		{
			case 0:
				is_cancelable = false;
				rot_spd = 0;
				y_offscreen = 260;
				spd = goto_value(spd,0,.95);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1:
				x_off = x -crab.x_body;
				y_off = y - crab.y_body;
				state = 2;
			break;
			case 2:
				x = crab.x_body + x_off;
				y = crab.y_body + y_off;
			break;
		}
	}
	
}





// Inherit the parent event
event_inherited();
