/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var fairy_wait_shoot = 40;
			var mentos_arc = 3;
			var mentos_dist = 25;
			var mentos_spd_shoot = 6;
			var mentos_spd_final = 3;
			var mentos_deccel = 0.1;
		break;
		case 1:
			var fairy_wait_shoot = 26;
			var mentos_arc = 5;
			var mentos_dist = 18;
			var mentos_spd_shoot = 7.5;
			var mentos_spd_final = 4;
			var mentos_deccel = 0.1;
		break;
		case 2:
			var fairy_wait_shoot = 22;
			var mentos_arc = 7;
			var mentos_dist = 15;
			var mentos_spd_shoot = 8;
			var mentos_spd_final = 4;
			var mentos_deccel = 0.1;
		break;
		case 3:
			var fairy_wait_shoot = 18;
			var mentos_arc = 7;
			var mentos_dist = 12;
			var mentos_spd_shoot = 8;
			var mentos_spd_final = 4;
			var mentos_deccel = 0.1;
		break;
	}
	var fairy_lenght = 840;
	var fairy_wait = 32;
	var fairy_y_off = 30;
	var fairy_life = 8;
	
	
	if(instance_exists(obj_spell))
	{
		time_wait = 90;
	}
	
	if(time_wait > 0)
	{
		time_wait -= 1;
	}
	
	if(time_wait == 0)
	{
		if(step < fairy_lenght)
		{
			if(step % fairy_wait == 0)
			{
				var inst = create_enemy(EN_BLUE,-20,fairy_y_off + rng(90,false,3),fairy_life,1,4,0);
				inst.item_nbr = 1;
				var inst = create_enemy(EN_BLUE,room_width + 20,fairy_y_off + rng(90,false,3),fairy_life,1,4,180);
				inst.item_nbr = 1;
			}
		}
	
	
		with(obj_enemy1)
		{
			if(state_time % fairy_wait_shoot == 10)
			{
				shoot_arc(DAN_MENTOS,2,mentos_arc,x,y,999,mentos_dist,mentos_spd_shoot,sfx_shot1,7);
			}
		}
		
		with(obj_danmaku7)
		{
			spd = goto_value(spd,mentos_spd_final,mentos_deccel);	
		}
	}
	
}

// Inherit the parent event
event_inherited();

