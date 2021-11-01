/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var rice_nbr = 3;
			var rice_spd_shoot = 6.5;
			var rice_spd_git = 4;
			var rice_spd_div = 3;
			var rice_open = 45;
			
			var rev_ring = 5;
			var rev_row = 2;
			var rev_spd_min = 2;
			var rev_spd_max = 4.5;
		break;
		case 1:
			var rice_nbr = 10;
			var rice_spd_shoot = 6.5;
			var rice_spd_git = 4;
			var rice_spd_div = 2.5;
			var rice_open = 45;
			
			var rev_ring = 9;
			var rev_row = 3;
			var rev_spd_min = 2;
			var rev_spd_max = 4.5;
		break;
		case 2:
			var rice_nbr = 14;
			var rice_spd_shoot = 6.5;
			var rice_spd_git = 4;
			var rice_spd_div = 2.5;
			var rice_open = 45;
			
			var rev_ring = 11;
			var rev_row = 3;
			var rev_spd_min = 2.5;
			var rev_spd_max = 5;
		break;
		case 3:
			var rice_nbr = 17;
			var rice_spd_shoot = 6.5;
			var rice_spd_git = 4;
			var rice_spd_div = 2.5;
			var rice_open = 45;
			
			var rev_ring = 13;
			var rev_row = 3;
			var rev_spd_min = 2.5;
			var rev_spd_max = 5;
		break;
	}
	
	var fairy_life = 36;
	var fairy_spd = 3;
	var fam_wait = 22;
	
	var fam_life = 26;
	var fam_lenght = 100;
	
	switch(step)
	{
		case 0:
			var inst = create_enemy(EN_RED,-20,100,fairy_life,2,fairy_spd,0);
			inst.item_nbr = 8;
			inst.can_revenge = false;
		break;
		case 130:
			var inst = create_enemy(EN_RED,420,50,fairy_life,2,fairy_spd,180);
			inst.item_nbr = 8;
			inst.can_revenge = false;
		break;
		case 260:
			var inst = create_enemy(EN_RED,-20,200,fairy_life,2,fairy_spd,0);
			inst.item_nbr = 8;
			inst.can_revenge = false;
		break;
		case 390:
			var inst = create_enemy(EN_RED,420,150,fairy_life,2,fairy_spd,180);
			inst.item_nbr = 8;
			inst.can_revenge = false;
		break;
		case 520:
			var inst = create_enemy(EN_RED,-20,230,fairy_life,2,fairy_spd,0);
			inst.item_nbr = 8;
			inst.can_revenge = false;
		break;
		case 650:
			var inst = create_enemy(EN_RED,420,90,fairy_life,2,fairy_spd,180);
			inst.item_nbr = 8;
			inst.can_revenge = false;
		break;
		case 780:
			var inst = create_enemy(EN_RED,-20,150,fairy_life,2,fairy_spd,0);
			inst.item_nbr = 8;
			inst.can_revenge = false;
		break;
	}
	
	//fairy
	with(obj_enemy2)
	{
		if(step % fam_wait == fam_wait - 1)
		{
			for(var i = 0; i < rice_nbr; i += 1)
			{
				var ang = 90 - rice_open + rng(rice_open * 2,false,i);
				var sp = rice_spd_shoot + rng(rice_spd_git,false,i + 1);
				shoot(DAN_RICE,6,x,y,ang,sp,sfx_shot2,1);
			}
			
			play_sound(sfx_familiar_spawn,1,false);
			var inst = create_enemy(EN_FAMILIAR,x,y,fam_life,1,0,0);
			inst.can_revenge = false;
		}
	}
	
	//rice
	with(obj_danmaku1)
	{
		switch(state)
		{
			case 0:
				var sq = 5;
				if(collision_rectangle(x - sq,y - sq + vsp,x + sq,y + sq + vsp,obj_wall,false,true))
				{
					state = 1;
					angle *= -1;
					spd /= rice_spd_div;
				}
			break;
		}
	}
	
	//familiar
	with(obj_enemy1)
	{
		if(step == fam_lenght)
		{
			state = 2;	
		}
		switch(state)
		{
			case 0:
				if(state_time == fam_wait)
				{
					state = 1;
					angle_aim = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 2:
				if(state_time == 30)
				{
					life = 0;
					item_nbr = 0;
					can_revenge = true;
				}
			break;
		}
	}
	
	//revenge
	for(var i = 0; i < ds_list_size(x_death_list); i += 1)
	{
		shoot_ring_row(DAN_MENTOS,5,rev_ring,rev_row,x_death_list[|i],y_death_list[|i],999,rev_spd_min,rev_spd_max,sfx_redirect1,2);
	}	
	
}
// Inherit the parent event
event_inherited();

