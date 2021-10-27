/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	var heart_ring = 20;
	var heart_angle_max = 80;
	var heart_angle_plus = 2;
	var heart_spd = 7;
	var heart_deccel = heart_angle_max / heart_angle_plus;
	var heart_charge = 40;
	
	var ring_nbr = 10;
	var ring_spd_shoot = 6;
	var ring_spd_final = 3;
	
	var aim_wait = 14;
	var aim_nbr = 12;
	var aim_ring = 12;
	
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 30:
			
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
				
					var aim = rng(360,false,6);
					for(var i = 0; i < 360; i += 360 / heart_ring)
					{
						var inst = shoot(DAN_HEART,6,obj_boss.x,obj_boss.y,aim + i,heart_spd,sfx_spawn_light,5);
						inst.angle_to = aim + i + heart_angle_max * act_dir;
						inst.spd_ref = heart_spd;
						inst.is_cancelable = false;
					}
				
					act_dir *= -1;
				
					state = 1;
				break;
			}
		break;
		case 1:
			if(state_time == 100)
			{
				state = 2;
			}
		break;
		case 2:
			if(state_time < aim_nbr * aim_wait)
			{
				if(state_time % aim_wait == 0)
				{
					var aim = find_angle(obj_player.x,obj_player.y,obj_boss.x,obj_boss.y);
					var inst = shoot(DAN_HEART,6,obj_boss.x,obj_boss.y,aim + 180,0,sfx_shot1,4);
					inst.dist = sqrt(sqr(obj_boss.x - obj_player.x) + sqr(obj_boss.y - obj_player.y));
					inst.x_ref = obj_player.x;
					inst.y_ref = obj_player.y;
					inst.is_cancelable = false;
					
					boss_movement_goto(obj_player.x,obj_player.y,1);
				}
				
			}
			else
			{
				obj_boss.x_to = obj_boss.x;
				obj_boss.y_to = obj_boss.y;
				state = 3;
			}
		break;
		case 3:
			if(state_time == 100)
			{
				state = 0;
			}
		break;
	}
	
	//heart ring
	with(obj_danmaku5)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,spd_ref / heart_deccel);
				angle = goto_value(angle,angle_to,heart_angle_plus);
				
				if(spd == 0)
				{
					shoot_laser(x,y,angle,heart_charge,30,$0d0dc3,sfx_laser2);	
					shoot_laser(x,y,angle + 90,heart_charge,30,$0d0dc3,sfx_laser2);
					shoot_laser(x,y,angle + 180,heart_charge,30,$0d0dc3,sfx_laser2);	
					shoot_laser(x,y,angle - 90,heart_charge,30,$0d0dc3,sfx_laser2);
					
					state = 1;
				}
			break;
			case 1:
				if(state_time == heart_charge)
				{
					shoot_ring(DAN_BUBBLE,6,ring_nbr,x,y,999,ring_spd_shoot,sfx_shot1,7);
					
					cancel_bullet(self);
				}
			break;
		
		}
	}
	
	//mentos
	with(obj_danmaku7)
	{
		spd = goto_value(spd,ring_spd_final,0.3);	
	}
	
	
	//heart aim
	with(obj_danmaku4)
	{
		switch(state)
		{
			case 0:
				dist += max(-6,recursiv(dist,0,5,0.1));
				if(dist == 0)
				{
					shoot_laser(x,y,angle,heart_charge,30,$0d0dc3,sfx_laser2);	
					shoot_laser(x,y,angle + 90,heart_charge,30,$0d0dc3,sfx_laser2);
					shoot_laser(x,y,angle + 180,heart_charge,30,$0d0dc3,sfx_laser2);	
					shoot_laser(x,y,angle - 90,heart_charge,30,$0d0dc3,sfx_laser2);
					state = 1;
				}
			break;
			case 1:
				if(state_time == heart_charge)
				{
					shoot_ring(DAN_BUBBLE,6,aim_ring,x,y,999,ring_spd_shoot,sfx_shot1,7);
					
					cancel_bullet(self);
				}
			break;
		}
		
		
		x = x_ref + lengthdir_x(dist,angle + 180)
		y = y_ref + lengthdir_y(dist,angle + 180)
	}
}

// Inherit the parent event
event_inherited();

