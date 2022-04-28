/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var green_lenght = 100;
	var mentos_wait = 8;
	var mentos_ring = 8;
	var mentos_open = 10;
	var mentos_spd_min = 4;
	var mentos_spd_git = 1;
	
	var red_lenght = 200;
	var bubble_wait = 16;
	var bubble_ring = 11;
	var bubble_spd = 3;
	var bubble_spin = 12;
	
	if(step < 1100)
	{
		if(step % 150 == 151)
		{
			var inst = create_enemy(EN_BLUE,room_width / 2 + blue_dir * 220,130,14,1,4,90 + blue_dir * 90);
			inst.item_nbr = 6;
			blue_dir *= -1;
		}
		
		if(step % 160 == 0)
		{
			need_fairy_time = 8;
			act_dir *= -1;
		}
		
		if(step % 200 == 0)
		{
			var inst = create_enemy(EN_RED,room_width / 2,-20,86,3,4,-90);
			inst.fairy_dir = red_dir;
			inst.item_nbr = 18;
			red_dir *= -1;
		}
	}
	
	
	
	var fairy_wait =2 ;
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			var x_pos = room_width / 2 + (- need_fairy_time * 20) * act_dir;
			var inst = create_enemy(EN_GREEN,x_pos,-20,20,2,4,-90);
			inst.item_nbr = 7;
		}
		
		need_fairy_time -= 1;	
	}
	
	//green
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shoot
				if(state_time < green_lenght)
				{
					if(state_time % mentos_wait == 0)
					{
						var aim = find_angle(x,y,obj_player.x,obj_player.y) + mentos_open - rng(mentos_open * 2,false,1);
						var sp = mentos_spd_min + rng(mentos_spd_git,false,8);
						shoot_ring(DAN_MENTOS,3,mentos_ring,x,y,aim,sp,sfx_shot1,4);
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2://wait
				if(state_time == 40)
				{
					state = 3;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
	
	//red
	with(obj_enemy3)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					angle_shoot = -90;
				}
			break;
			case 1://shoot
				if(state_time < red_lenght)
				{
					if(state_time % bubble_wait == 0)
					{
						shoot_ring(DAN_BUBBLE,6,bubble_ring,x,y,angle_shoot,bubble_spd,sfx_redirect1,8);
						angle_shoot += bubble_spin * fairy_dir;
					}
				}
				else
				{
					state = 2;
				}
			break;
			case 2://wait
				if(state_time == 40)
				{
					state = 3;
				}
			break;
			case 3:
				spd = goto_value(spd,2,0.05);
			break;
		}
	}
}
// Inherit the parent event
event_inherited();

