/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
			
		break;
		case 3:
			var card_wait = 3;
			var card_wait_in = 5;
			var card_row = 6;
			var card_ring = 2;
			var card_spd = 4.5;
			var card_accel = 0.1;
			var card_angle_plus = 15.78;
		break;
	}
	
	var fairy_length = 120;
	
	var fairy_life = 90;
	var fairy_spd = 10;
	var fairy_deccel = 0.15;
	var fairy_angle_plus = 0.9;
	
	var fairy_y = 210;
	
	var spell = self;
	
	switch(step)
	{
		case 40:
			var inst = create_enemy(EN_RED,-20,fairy_y,fairy_life,6,fairy_spd,0);
			inst.item_nbr = 10;
			inst.angle_to = 90;
			inst.f_dir = 1;
			inst.angle_shoot = -110;

			var inst = create_enemy(EN_RED,420,fairy_y,fairy_life,6,fairy_spd,180);
			inst.item_nbr = 10;
			inst.angle_to = 90;
			inst.f_dir = -1;
			inst.angle_shoot = -70;
		break;
		
	}
	
	with(obj_enemy6) // card
	{
		switch(state)
		{
			case 0:
				if(state_time < fairy_length)
				{
					spd = goto_value(spd,0,fairy_deccel);
					angle = goto_value(angle,angle_to,fairy_angle_plus);
				
					if(state_time % card_wait == 0)
					{
						array_push(spell.x_spawn,x);
						array_push(spell.y_spawn,y);
						array_push(spell.angle_spawn,angle_shoot);
						array_push(spell.time_spawn,card_row * card_wait_in);
						
						angle_shoot += card_angle_plus * f_dir;
					}
				}
				else
				{
					state += 1;	
				}
			break;
			case 1:
				if(state_time == 30)
				{
					state += 1;
					angle = find_angle(200,200,x,y);
				}
			break;
			case 2:
				spd = goto_value(spd,2,0.04);
			break;
		}
	}
	
	for(var i = 0; i < array_length(x_spawn); i += 1)
	{
		if(time_spawn[i] % card_wait_in == 0)
		{
			shoot_ring(DAN_AMULET,2,card_ring,x_spawn[i],y_spawn[i],angle_spawn[i],0,sfx_shot2,3);
		}
		
		time_spawn[i] -= 1;
		
		if(time_spawn[i] == 0)
		{
			array_delete(x_spawn,i,1);
			array_delete(y_spawn,i,1);
			array_delete(angle_spawn,i,1);
			array_delete(time_spawn,i,1);	
		}
		
		
	}
	
	
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				image_xscale = 2;
				image_yscale = 2;
				state += 1;
			break;
			case 1:
				spd = goto_value(spd,card_spd,card_accel);
			break;
		}
		
	}
	
	
}
// Inherit the parent event
event_inherited();

