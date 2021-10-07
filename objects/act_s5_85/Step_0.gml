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
			
		break;
	}
	
	switch(step)
	{
		case 0:
			fairy_route_need = 1;
			dir_act = -1;
			y_route = 150;
		break;
		case 30:
			fairy_route_need = 2;
			dir_act = 1;
			y_route = 30;
		break;
		case 70:
			fairy_route_need = 3;
			dir_act = -1;
			y_route = 80;
		break;
	
	}
	
	var f_life = 70;
	var f_spd = 2.5;
	
	var fam_life = 22;
	var fam_nbr = 5;
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
		fairy.item_nbr = 20;
		fairy.route = fairy_route_need;
		fairy.x_ref = x_pos
		fairy.y_ref = y_pos
		fairy.angle_ref = ang;
		fairy.dir_act = dir_act;
		fairy.familiar_need = fam_nbr;
			
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
				inst.route = route;
				inst.dir_act = dir_act;
				inst.my_fairy = self;
				inst.free = false;
				familiar_need -= 1;
			}
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
		if(!instance_exists(my_fairy)) and (!free)
		{
			life = 0;
		}
	}
}

// Inherit the parent event
event_inherited();

