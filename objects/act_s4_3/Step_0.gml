/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var wall_wait = 16;
		
			var wall_ring = 6;
			var wall_arc = 3;
			var wall_dist = 2;
			
			var wall_spd_max = 9;
			var wall_spd_min = 6;
			var wall_spd_div = 3;
			var wall_spin = 27.72;
			var wall_spd_time = 14;
		
			var aim_arc = 1;
			var aim_dist = 1;
			var aim_spd = 3.2;
			
			var spam_nbr = 60;
			var spam_spd_min = 1.8;
			var spam_spd_git = 2.1;
		break;
		case 1:
			var wall_wait = 11;
		
			var wall_ring = 7;
			var wall_arc = 3;
			var wall_dist = 2.7;
			
			var wall_spd_max = 10;
			var wall_spd_min = 7;
			var wall_spd_div = 3;
			var wall_spin = 21.72;
			var wall_spd_time = 14;
		
			var aim_arc = 3;
			var aim_dist = 42;
			var aim_spd = 3.5;
			
			var spam_nbr = 130;
			var spam_spd_min = 1.8;
			var spam_spd_git = 2.4;
		break;
		case 2:
			var wall_wait = 9;
		
			var wall_ring = 8;
			var wall_arc = 3;
			var wall_dist = 2.7;
			
			var wall_spd_max = 11;
			var wall_spd_min = 7.5;
			var wall_spd_div = 3;
			var wall_spin = 19.17;
			var wall_spd_time = 14;
		
			var aim_arc = 3;
			var aim_dist = 36;
			var aim_spd = 3.7;
			
			var spam_nbr = 180;
			var spam_spd_min = 1.8;
			var spam_spd_git = 2.6;
		break;
		case 3:
			var wall_wait = 8;
		
			var wall_ring = 9;
			var wall_arc = 3;
			var wall_dist = 2.7;
			
			var wall_spd_max = 12;
			var wall_spd_min = 8;
			var wall_spd_div = 3;
			var wall_spin = 17.37;
			var wall_spd_time = 14;
		
			var aim_arc = 3;
			var aim_dist = 30;
			var aim_spd = 4;
			
			var spam_nbr = 240;
			var spam_spd_min = 1.8;
			var spam_spd_git = 3;
		break;
	}
	
	var fam_x_dist = 160;
	var fam_life = 226;
	var fam_spd_start = 8;
	var fam_deccel = 0.25;
	var fam_spd_final = 1.1;
	var fam_angle_plus = 2.5;
	
	var fairy_x_dist = 145;
	var fairy_wait = 10;
	var fairy_length = 100;
	var fairy_life = 5;
	var fairy_spd = 4;
	var fairy_angle_plus = 0.05;
	
	
	switch(step)
	{
		case 0:
		//case 560:
			var inst = create_enemy(EN_FAMILIAR,room_width / 2 - fam_x_dist,-30,fam_life,3,fam_spd_start,-90);
			inst.item_nbr = 14;
			inst.angle_to = 0;
			inst.angle_shoot = rng(360,false,1);
			inst.fam_dir = 1;
		break;
		case 170:
		//case 680:
			need_fairy_time = fairy_length;
			act_dir = 1;
		break;
		case 340:
		//case 840:
			var inst = create_enemy(EN_FAMILIAR,room_width / 2 + fam_x_dist,-30,fam_life,3,fam_spd_start,-90);
			inst.item_nbr = 14;
			inst.angle_to = -180;
			inst.angle_shoot = rng(360,false,1);
			inst.fam_dir = -1;
		break;
		case 510:
	//	case 960:
			need_fairy_time = fairy_length;
			act_dir = -1;
		break;
	}
	
	if(need_fairy_time > 0)
	{
		if((fairy_length - need_fairy_time) % fairy_wait == 0)
		{
			var inst = create_enemy(EN_BLUE,room_width / 2 + fairy_x_dist * act_dir,-30,fairy_life,4,fairy_spd,-90);
			inst.angle_to = -90 + 10 * act_dir;
			inst.can_revenge = false;
			inst.item_nbr = 2;
		}
		
		need_fairy_time -= 1;
	}
	
	
	with(obj_enemy3)//familiar
	{
		switch(state)
		{
			case 0:
				play_sound(sfx_familiar_spawn,1,false);
				state += 1;
			break;
			case 1:
				spd = goto_value(spd,fam_spd_final,fam_deccel);
				angle = goto_value(angle,angle_to,fam_angle_plus);
				if(angle == angle_to)
				{
					state += 1;
				}
			break;
			case 2:
				if(state_time % wall_wait == 0)
				{
					for(var i = 0; i < 360; i += 360 / wall_ring)
					{
						shoot_arc(DAN_ARROW,5,wall_arc,x,y,angle_shoot + i,wall_dist,wall_spd_min,sfx_shot1,4);
						shoot_arc(DAN_ARROW,4,wall_arc,x,y,angle_shoot + i,wall_dist,wall_spd_max,sfx_shot1,4)
					}
					
					angle_shoot -= wall_spin * fam_dir;
				}
			break;
		}
	}
	
	with(obj_enemy4)//fairy
	{
		angle = goto_value(angle,angle_to,fairy_angle_plus);
		
		if(step == 16)
		{
			shoot_arc(DAN_BUBBLE,1,aim_arc,x,y,999,aim_dist,aim_spd,sfx_redirect1,6);
		}
	}
	
	with(obj_danmaku4)//arrow
	{
		switch(state)
		{
			case 0:
				spd_ref = spd;
				spd_to = spd / wall_spd_div;
				
				state += 1;
			break;
			case 1:
				spd = goto_value(spd,spd_to,(spd_ref - spd_to) / wall_spd_time)
			break;
		}
	}
	
	for(var i = 0; i < ds_list_size(global.x_death_list); i += 1)
	{
		var xx = global.x_death_list[|i];
		var yy = global.y_death_list[|i];
		boss_release(xx,yy,sfx_boss_release);
		//screen_clean(true,true);
		instance_create_depth(xx,yy,global.boss_depth,obj_clean_radius);
		
		for(var i = 0; i < 360; i += 10)
		{
			var inst = instance_create_depth(xx,yy,global.boss_depth,obj_thunder);
			inst.angle = i;
		}
	
		repeat(spam_nbr)
		{
			shoot(DAN_ARROW,choose(4,5),xx,yy,rng(360,false,1),spam_spd_min + rng(spam_spd_git,false,1),noone,1);	
		}
	
	}
	
}
// Inherit the parent event
event_inherited();

