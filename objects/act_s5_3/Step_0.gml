/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var aim_wait = 65;
			var aim_spd = 2.5;
			var aim_open = 3;
			var aim_ring = 1;
		break;
		case 1:
			var aim_wait = 40;
			var aim_spd = 3.2;
			var aim_open = 5;
			var aim_ring = 2;
		break;
		case 2:
			var aim_wait = 18;
			var aim_spd = 3.4;
			var aim_open = 5;
			var aim_ring = 2;
		break;
		case 3:
			var aim_wait = 11;
			var aim_spd = 3.6;
			var aim_open = 5;
			var aim_ring = 3;
		break;
	}
	
	var fairy_life = 38;
	var fairy_spd = 3;
	var fam_wait = 25;
	
	var fam_life = 15;
	var fam_lenght = 190;
	
	if(step < 1200)
	{
		if(step % 60 == 0)
		{
			var inst = create_enemy(EN_RED,room_width / 2 - 220 * act_dir,50 + step % 166,fairy_life,2,fairy_spd,90 - 90 * act_dir);
			inst.item_nbr = 4;
			act_dir *= -1;
		}
	}
	
	
	//fairy
	with(obj_enemy2)
	{
		if(step % fam_wait == fam_wait - 1)
		{	
			if(x > 0) and ( x < room_width)
			{
				play_sound(sfx_familiar_spawn,1,false);
				var inst = create_enemy(EN_FAMILIAR,x,y,fam_life,1,0,0);
				inst.can_revenge = false;
				inst.item = 2;
			}
		}
	}
	
	//familiar
	with(obj_enemy1)
	{
		switch(state)
		{
			case 0:
				if(state_time < fam_lenght)
				{
					if(state_time % aim_wait == 1)
					{
						var ang = find_angle(x,y,obj_player.x,obj_player.y) + aim_open - rng(aim_open * 2,false,8);
						shoot_ring(DAN_MENTOS,1,aim_ring,x,y,ang,aim_spd,sfx_shot1,4);	
					}
				}
				else
				{
					state = 1;
				}
			break;
			case 1:
				if(state_time == 30)
				{
					life = 0;
					item_nbr = 0;
				}
			break;
		}
	}
	
}
// Inherit the parent event
event_inherited();

