/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var fam_nbr = 3;
			
			var mentos_wait = 44;
			var mentos_spd = 2.5;
			var mentos_arc = 3;
			var mentos_dist = 50;
			
			var rev_ring = 0;
			var rev_row = 3;
			var rev_spd_min = 2.5;
			var rev_spd_max = 4;
			
			var aim_wait = 70;
			var aim_spd = 2;
			
			var open = 0;
		break;
		case 1:
			var fam_nbr = 4;
			
			var mentos_wait = 32;
			var mentos_spd = 2.5;
			var mentos_arc = 3;
			var mentos_dist = 50;
			
			var rev_ring = 6;
			var rev_row = 3;
			var rev_spd_min = 2.5;
			var rev_spd_max = 4;
			
			var aim_wait = 60;
			var aim_spd = 2;
			
			var open = 3;
		break;
		case 2:
			var fam_nbr = 5;
			
			var mentos_wait = 26;
			var mentos_spd = 2.5;
			var mentos_arc = 3;
			var mentos_dist = 40;
			
			var rev_ring = 10;
			var rev_row = 3;
			var rev_spd_min = 3;
			var rev_spd_max = 4.5;
			
			var aim_wait = 50;
			var aim_spd = 2;
			
			var open = 5;
		break;
		case 3:
			var fam_nbr = 5;
		
			var mentos_wait = 18;
			var mentos_spd = 2.5;
			var mentos_arc = 3;
			var mentos_dist = 40;
			
			var rev_ring = 13;
			var rev_row = 3;
			var rev_spd_min = 3;
			var rev_spd_max = 4.5;
			
			var aim_wait = 38;
			var aim_spd = 2;
			
			var open = 6;
		break;
	}
	
	switch(step)
	{
		case 0:
			fairy_route_need = 3;
			dir_act = 1;
			y_route = 150;
		break;
		case 80:
			fairy_route_need = 2;
			dir_act = -1;
			y_route = 40;
		break;
		case 160:
			fairy_route_need = 1;
			dir_act = 1;
			y_route = 180;
		break;
		case 240:
			fairy_route_need = 3;
			dir_act = -1;
			y_route = 90;
		break;
		case 320:
			fairy_route_need = 2;
			dir_act = 1;
			y_route = 65;
		break;
		case 400:
			fairy_route_need = 1;
			dir_act = -1;
			y_route = 140;
		break;
		case 480:
			fairy_route_need = 3;
			dir_act = 1;
			y_route = 140;
		break;
		case 560:
			fairy_route_need = 1;
			dir_act = -1;
			y_route = 110;
		break;
		case 640:
			fairy_route_need = 3;
			dir_act = 1;
			y_route = 210;
		break;
		case 720:
			fairy_route_need = 2;
			dir_act = -1;
			y_route = 80;
		break;
		case 800:
			fairy_route_need = 1;
			dir_act = 1;
			y_route = 70;
		break;
		case 880:
			fairy_route_need = 3;
			dir_act = -1;
			y_route = 180;
		break;
		case 960:
			fairy_route_need = 2;
			dir_act = 1;
			y_route = 40;
		break;
		case 1040:
			fairy_route_need = 3;
			dir_act = -1;
			y_route = 210;
		break;
		case 1080:
			fairy_route_need = 3;
			dir_act = 1;
			y_route = 50;
		break;
	}
	
	var f_life = 42;
	var f_spd = 2.5;
	
	var fam_life = 18;
	var fam_wait = 20;
	
	if(fairy_route_need > 0)
	{
		var x_pos = room_width / 2 - 220 * dir_act;
		switch(fairy_route_need)
		{
			case 1:
				var ang = 90 - 45 * dir_act;
			break;
			case 2:
				var ang = -90 + 45 * dir_act;
			break;
			case 3:
				var ang = -90 + 90 * dir_act;
			break;
		}
		var y_pos = y_route
			
		var fairy = create_enemy(EN_BLUE,x_pos,y_pos,f_life,1,f_spd,ang);
		fairy.item_nbr = 14;
		fairy.route = fairy_route_need;
		fairy.x_ref = x_pos
		fairy.y_ref = y_pos
		fairy.angle_ref = ang;
		fairy.dir_act = dir_act;
		fairy.familiar_need = fam_nbr;
		fairy.can_revenge = false;
			
		fairy_route_need = 0;
	}
	
	//enemy movement
	with(obj_enemy)
	{
		switch(state)
		{
			case 0:
				switch(route)
				{
					case 1:
						angle_to = 90 - 180 * dir_act; 
						angle = goto_value(angle,angle_to,0.5);
					break;
					case 2:
						angle_to = -90 + 180 * dir_act; 
						angle = goto_value(angle,angle_to,0.5);
					break;
				}
			break;
		}
	}
	
	with(obj_enemy1)
	{
		if(step % fam_wait == fam_wait - 1)
		{
			if(familiar_need > 0)
			{
				var inst = create_enemy(EN_FAMILIAR,x_ref,y_ref,fam_life,2,f_spd,angle_ref);
				inst.item_nbr = 2;
				inst.route = route;
				inst.dir_act = dir_act;
				inst.my_fairy = self;
				inst.free = false;
				familiar_need -= 1;
			}
		}
		
		if(step % mentos_wait == mentos_wait - 1)
		{
			var aim = find_angle(x,y,obj_player.x,obj_player.y) - open + rng(open* 2,false,7);
			shoot_arc(DAN_MENTOS,7,mentos_arc,x,y,aim,mentos_dist,mentos_spd,sfx_shot2,5);	
		}
		
		if(x < 0) or (x > room_width) or (y < 0) or (y > room_height)
		{
			var me = self;
			with(obj_enemy2)
			{
				if(my_fairy	== me)
				{
					free = true;	
				}
			}
		}
	}
	
	with(obj_enemy2)
	{
		if(step % aim_wait == 0)
		{
			var aim = find_angle(x,y,obj_player.x,obj_player.y) - open + rng(open* 2,false,1);
			shoot(DAN_MENTOS,1,x,y,aim,aim_spd,sfx_shot3,6);	
		}
		can_revenge = false;
		if(!instance_exists(my_fairy)) and (!free)
		{
			life = 0;
			can_revenge = true;
		}
	}
	
	for(var i = 0; i < ds_list_size(global.x_death_list); i += 1)
	{
		shoot_ring_row(DAN_BUBBLE,1,rev_ring,rev_row,global.x_death_list[|i],global.y_death_list[|i],999,rev_spd_min,rev_spd_max,sfx_redirect1,8);
	}	
}

// Inherit the parent event
event_inherited();

