/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(step < act_time - 80)
	{
		var wait = 50;
		var fairy_life = 15;
		var fairy_spd = 9;
		
		if (step % wait == 0)
		{
			var fairy_off = 46;
			
			var x_pos = 26 + (step / wait) * fairy_off;
			var inst = create_enemy(EN_BLUE,x_pos,-20,fairy_life, 2);
			inst.angle = -90;
			inst.spd = fairy_spd;
			inst.dir_go = 1;
			inst.item_nbr = 1;
			
			var inst = create_enemy(EN_BLUE,room_width - x_pos,-20,fairy_life, 2);
			inst.angle = -90;
			inst.spd = fairy_spd;
			inst.dir_go = -1;
			inst.item_nbr = 1;
	
		}
	}
	
	switch(global.difficulty)
	{
		case 0:
			var ring_nbr = 4;
			var row_nbr = 2;
			var arrow_spd = 2;
			var revenge_arc_nbr = 0;
			var revenge_row_nbr = 0;
		break;
		case 1:
			var ring_nbr = 6;
			var row_nbr = 4;
			var arrow_spd = 2;
			var revenge_arc_nbr = 0;
			var revenge_row_nbr = 0;
		break;
		case 2:
			var ring_nbr = 4;
			var row_nbr = 7;
			var arrow_spd = 2;
			var revenge_arc_nbr = 1;
			var revenge_row_nbr = 3;
		break;
		case 3:
			var ring_nbr = 4;
			var row_nbr = 9;
			var arrow_spd = 2;
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
				
				var a_spd = arrow_spd;
				for(var i = 0; i < row_nbr; i += 1)
				{
					shoot_ring(DAN_ARROW,3,ring_nbr,x,y,ang_shoot,a_spd ,sfx_shot1,2);
					
					a_spd  += 0.3;
					ang_shoot += (360 / row_nbr / ring_nbr) * dir_go;
				}
				
				state = 2;
				angle = find_angle(x,y,room_width / 2 + dir_go * 180, y - 300);
				can_revenge = false;
			break;
			case 2://leaving for a better world
				spd = goto_value(spd,5,0.1);
				
			break;
			
		}
	}
	
	
	for(var i = 0; i < ds_list_size(x_death_list); i += 1)
	{
		
		shoot_arc_row(DAN_BALL,6,revenge_arc_nbr,revenge_row_nbr,x_death_list[|i], y_death_list[|i],999,30,7,9,sfx_shot2,1);
		
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

