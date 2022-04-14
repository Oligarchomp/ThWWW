/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var wall_ring = 7;
			var wall_arc = 3;
			var wall_row = 2;
			var wall_dist = 5;
			var wall_spd_min = 6;
			var wall_spd_max = 11;
			var wall_spd_final = 4.5;
			var wall_spd_div = 3.5;
			var wall_frame = 30;
			
			var ring_nbr = 16;
			var ring_spd_shoot = 7;
			var ring_spd_final1 = 1.3;
			var ring_spd_final2 = 1.8;
			var ring_lenght = 100;
			var ring_wait = 40;
		break;
		case 1:
			var wall_ring = 11;
			var wall_arc = 3;
			var wall_row = 3;
			var wall_dist = 5;
			var wall_spd_min = 6;
			var wall_spd_max = 11;
			var wall_spd_final = 4.5;
			var wall_spd_div = 3.5;
			var wall_frame = 30;
			
			var ring_nbr = 25;
			var ring_spd_shoot = 7;
			var ring_spd_final1 = 1.3;
			var ring_spd_final2 = 1.8;
			var ring_lenght = 100;
			var ring_wait = 40;
		break;
		case 2:
			var wall_ring = 13;
			var wall_arc = 3;
			var wall_row = 3;
			var wall_dist = 5;
			var wall_spd_min = 6;
			var wall_spd_max = 11;
			var wall_spd_final = 4.5;
			var wall_spd_div = 3.5;
			var wall_frame = 30;
			
			var ring_nbr = 29;
			var ring_spd_shoot = 7;
			var ring_spd_final1 = 1.3;
			var ring_spd_final2 = 1.8;
			var ring_lenght = 100;
			var ring_wait = 40;
		break;
		case 3:
			var wall_ring = 13;
			var wall_arc = 3;
			var wall_row = 3;
			var wall_dist = 6;
			var wall_spd_min = 6;
			var wall_spd_max = 11;
			var wall_spd_final = 4.5;
			var wall_spd_div = 3.5;
			var wall_frame = 30;
			
			var ring_nbr = 34;
			var ring_spd_shoot = 7;
			var ring_spd_final1 = 1.5;
			var ring_spd_final2 = 2;
			var ring_lenght = 100;
			var ring_wait = 40;
		break;
	}
	
	var fam_life = 9999;
	switch(step)
	{
		case 0:
			play_sound(sfx_familiar_spawn,1,false);
			create_enemy(EN_FAMILIAR,room_width / 2,80,fam_life,3,0,0);
		break;
		case 250:
			play_sound(sfx_familiar_spawn,1,false);
			create_enemy(EN_FAMILIAR,130,110,fam_life,3,0,0);
			create_enemy(EN_FAMILIAR,270,110,fam_life,3,0,0);
			ring_less = 5;
		break;
		case 500:
			play_sound(sfx_familiar_spawn,1,false);
			create_enemy(EN_FAMILIAR,room_width / 2,90,fam_life,3,0,0);
			create_enemy(EN_FAMILIAR,50,200,fam_life,3,0,0);
			create_enemy(EN_FAMILIAR,350,200,fam_life,3,0,0);
			
			switch(global.difficulty)
			{
				case 0:
					ring_less = 10;
				break;
				case 1:
				case 2:
				case 3:
					ring_less = 13;
				break;
			}
			
			wall_less = 2;
			wall_in_less = 1;
		break;
		case 750:
			play_sound(sfx_familiar_spawn,1,false);
			create_enemy(EN_FAMILIAR,100,60,fam_life,3,0,0);
			create_enemy(EN_FAMILIAR,300,60,fam_life,3,0,0);
			create_enemy(EN_FAMILIAR,30,210,fam_life,3,0,0);
			create_enemy(EN_FAMILIAR,370,210,fam_life,3,0,0);
			switch(global.difficulty)
			{
				case 0:
					ring_less = 9;
				break;
				case 1:
					ring_less = 14;
				break;
				case 2:
				case 3:
					ring_less = 16;
				break;
			}
			
			wall_less = 2;
			wall_in_less = 1;
		break;
	}
	
	var spell = self;
	with(obj_enemy3)
	{
		switch(state)
		{
			case 0:
				if(state_time = 50)
				{
					var wall_true_nbr = wall_ring - spell.wall_less;
					var aim = find_angle(x,y,obj_player.x,obj_player.y) + 360 / wall_true_nbr / 2 ;
					for(var i = 0; i < 360; i += 360 / wall_true_nbr)
					{
						shoot_arc_row(DAN_BUBBLE,1,wall_arc - spell.wall_in_less,wall_row,x,y,aim + i,wall_dist,wall_spd_min,wall_spd_max,sfx_shot1,4);
					}
					state = 1;
					angle_shoot = rng(360,false,7);
					
					item_nbr = 0;
				}	
			break;
			case 1:
				if(state_time < ring_lenght)
				{
					if(state_time % ring_wait == floor(ring_wait / 2))
					{
						var nbr = ring_nbr - spell.ring_less;
						shoot_ring(DAN_MENTOS,1,nbr,x,y,angle_shoot,ring_spd_shoot,sfx_shot2,3);
						shoot_ring(DAN_MENTOS,7,nbr,x,y,angle_shoot + 360 / nbr / 2,ring_spd_shoot,sfx_shot2,3);
						angle_shoot = rng(360,false,7);
					}
				}
				else
				{
					state = 2;	
				}
			break;
			case 2:
				if(state_time == 60)
				{
					life = 0;
				}
			break;
		}
	}
	
	with(obj_danmaku3)
	{
		if(color_id == 1)
		{
			spd = goto_value(spd,ring_spd_final1,03);
		}
		else
		{
			spd = goto_value(spd,ring_spd_final2,0.3);
		}
	}
	
	with(obj_danmaku4)
	{
		if(step == 0)
		{
			y_offscreen = 200;
			x_offscreen = 200;
			spd_ref = spd;
			need_sfx = true;
		}
		spd = goto_value(spd,-spd_ref / wall_spd_div,(wall_spd_final + spd_ref ) / wall_frame);	
		if(spd < 0) and (need_sfx)
		{
			play_sound(sfx_redirect1,1,false);	
			need_sfx = false;
		}
		if(state_time == wall_frame * 2)
		{
			y_offscreen = 25;
			x_offscreen = 25;
		}
	}
	
}

// Inherit the parent event
event_inherited();

