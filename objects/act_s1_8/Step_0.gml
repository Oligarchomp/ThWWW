/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(step < act_time - 80)
	{
		var wait = 50;
		var fairy_life = 20;
		var fairy_spd = 9;
		
		if (step % wait == 0)
		{
			var fairy_off = 46;
			
			var x_pos = 26 + (step / wait) * fairy_off;
			var inst = create_enemy(EN_BLUE,x_pos,-20,fairy_life, 2,fairy_spd,-90);
			inst.dir_go = 1;
			inst.item_nbr = 1;
			
			var inst = create_enemy(EN_BLUE,room_width - x_pos,-20,fairy_life, 2,fairy_spd,-90);
			inst.dir_go = -1;
			inst.item_nbr = 1;
	
		}
	}
	
	switch(global.difficulty)
	{
		case 0:
			var arrow_ring = 4;
			var arrow_row = 2;
			var arrow_spd_min = 1.5;
			var arrow_spd_max = 2;
			var revenge_arc_nbr = 0;
			var revenge_row_nbr = 0;
		break;
		case 1:
			var arrow_ring = 14;
			var arrow_row = 2;
			var arrow_spd_min = 1.8;
			var arrow_spd_max = 2.8;
			var revenge_arc_nbr = 0;
			var revenge_row_nbr = 0;
		break;
		case 2:
			var arrow_ring = 18;
			var arrow_row = 2;
			var arrow_spd_min = 2;
			var arrow_spd_max = 3.5;
			var revenge_arc_nbr = 1;
			var revenge_row_nbr = 3;
		break;
		case 3:
			var arrow_ring = 22;
			var arrow_row = 2;
			var arrow_spd_min = 2;
			var arrow_spd_max = 3.5;
			var revenge_arc_nbr = 3;
			var revenge_row_nbr = 3;
		break;
	}
	
	with(obj_enemy2)
	{
		switch(state)
		{
			case 0://coming to change the world
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
				}
			break;
			case 1://shooting to express their anger against the world
				var ang_shoot = rng(360,false,1);
				
				for(var i = arrow_spd_min; i < arrow_spd_max; i += (arrow_spd_max - arrow_spd_min) / arrow_row )
				{
					shoot_ring(DAN_ARROW,3,arrow_ring,x,y,ang_shoot,i,sfx_shot1,2)
					ang_shoot += 180 / arrow_ring;
				}
				
				state = 2;
				angle = find_angle(x,y,room_width / 2 + ((x < room_width / 2) * 2 - 1) * 800,-350);
				can_revenge = false;
			break;
			case 2://leaving for a better world
				spd = goto_value(spd,5,0.03);
				
			break;
			
		}
	}
	
	
	for(var i = 0; i < array_length(global.x_death_list); i += 1)
	{
		
		shoot_arc_row(DAN_BALL,6,revenge_arc_nbr,revenge_row_nbr,global.x_death_list[i], global.y_death_list[i],999,30,7,9,sfx_shot2,1);
		
	}
	
	with (obj_danmaku1)
	{
		if (step == 0)
		{
			spd_ref = spd;
		}
		spd = goto_value(spd, spd_ref * 0.5, 0.2);
	}
	
	
}


// Inherit the parent event
event_inherited();

