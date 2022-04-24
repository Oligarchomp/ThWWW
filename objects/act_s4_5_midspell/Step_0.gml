/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	
	switch(global.difficulty)
	{
		case 0:
			var familiar_wait = 85;
			var familiar_spd = 3;
			var familiar_nbr = 6;
			
			var arrow_spd = 4;
			var arrow_wait = 30;
			var arrow_open = 4;
			
			var bean_spd_shot = 5;
			var bean_angle_git = 5;
			var bean_spd_final = 3;
			var bean_wait = 38;
			var bean_ring = 20;
			
			var revenge_spd = 1.8;
			var revenge_nbr = 9;
		break;
		case 1:
			var familiar_wait = 70;
			var familiar_spd = 3;
			var familiar_nbr = 8;
			
			var arrow_spd = 4;
			var arrow_wait = 30;
			var arrow_open = 4;
			
			var bean_spd_shot = 5;
			var bean_angle_git = 5;
			var bean_spd_final = 3;
			var bean_wait = 28;
			var bean_ring = 22;
			
			var revenge_spd = 2;
			var revenge_nbr = 16;
		break;
		case 2:
			var familiar_wait = 60;
			var familiar_spd = 3;
			var familiar_nbr = 8;
			
			var arrow_spd = 4;
			var arrow_wait = 20;
			var arrow_open = 4;
			
			var bean_spd_shot = 5;
			var bean_angle_git = 5;
			var bean_spd_final = 3.5;
			var bean_wait = 22;
			var bean_ring = 30;
			
			var revenge_spd = 2;
			var revenge_nbr = 20;
		break;
		case 3:
			var familiar_wait = 55;
			var familiar_spd = 3;
			var familiar_nbr = 8;
			
			var arrow_spd = 4;
			var arrow_wait = 20;
			var arrow_open = 4;
			
			var bean_spd_shot = 5;
			var bean_angle_git = 10;
			var bean_spd_final = 3.5;
			var bean_wait = 20;
			var bean_ring = 36;
			
			var revenge_spd = 2;
			var revenge_nbr = 25;
		break;
	}
	var familiar_life = 15;
	var revenge_dist_min = 170;
	var boss_wait = 177;
	
	switch(state)
	{
		case 0:
			if(state_time % familiar_wait == 0)
			{
				play_sound(sfx_shock,1,false);
				var off = room_width / familiar_nbr / 2;
				for(var i = 0; i < room_width; i += room_width / familiar_nbr)
				{
					var inst = create_enemy(EN_FAMILIAR,off + i,-25,familiar_life,1,familiar_spd,-90);
					inst.item_nbr = 0;
					
					var inst = instance_create_depth(off + i,-4,global.boss_depth,obj_thunder);
					inst.angle = -90 - 10 + rng(20,false,1);
				}
				
				
			}
			
			if(state_time % boss_wait == boss_wait -1)
			{
				boss_movement_random(4,15,3);
			}
			
			if(state_time % bean_wait == bean_wait -1)
			{
				shoot_ring(DAN_JELLYBEAN,6,bean_ring,obj_boss.x,obj_boss.y,rng(360,false,3),bean_spd_shot,sfx_shot2,3);
			}
		break;
	}
	
	
	with(obj_enemy1)
	{
		if(state_time % arrow_wait == 0)
		{
			var ang = 90 - arrow_open + rng(arrow_open * 2,false,8);
			shoot(DAN_ARROW,4,x,y,ang,arrow_spd,sfx_shot3,4);
		}
	}
	
	//jellybean
	with(obj_danmaku3)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.1);
				if(spd == 0)
				{
					state = 1;
					angle_ref = angle;
					angle_plus = 0;
					angle_plus_max = bean_angle_git - rng(bean_angle_git * 2,false,1);
				}
			break;
			case 1:
				angle_plus = goto_value(angle_plus,angle_plus_max,0.2);
				angle = angle_ref + angle_plus 
				spd = goto_value(spd,bean_spd_final,0.05);
			break;
		}
	}
	
	if(obj_player.state == 2)
	{
		death_time = 30;	
	}
	
	death_time = goto_value(death_time,0,1);
	
	//revenge
	for(var i = 0; i < ds_list_size(global.x_death_list); i += 1)
	{
		if(death_time == 0)
		{
			if (sqrt(sqr(obj_player.x - global.x_death_list[|i]) + sqr(obj_player.y - global.y_death_list[|i])) > revenge_dist_min)
			{
				shoot_ring(DAN_ARROW,4,revenge_nbr,global.x_death_list[|i],global.y_death_list[|i],rng(360,false,2),revenge_spd,sfx_shot1,2); 
			}
		}
	}
}
// Inherit the parent event
event_inherited();

