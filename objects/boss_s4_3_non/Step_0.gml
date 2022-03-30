/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) 
{
	switch(spell_wait)
	{
		case 30:
			boss_charge(obj_boss.x,obj_boss.y);
		break;
		case 0:
			switch(global.difficulty)
			{
				case 0:
					var star_wait = 25;
					var star_ring = 20;
					var star_spd_shoot = 7;
					var star_spd_final = 1.1;
					var star_angle_plus = 1;
					var star_angle_max = 70;
					var star_deccel = 0.1;
				break;
				case 1:
					var star_wait = 20;
					var star_ring = 28;
					var star_spd_shoot = 8;
					var star_spd_final = 1.1;
					var star_angle_plus = 1;
					var star_angle_max = 80;
					var star_deccel = 0.1;
				break;
				case 2:
					var star_wait = 19;
					var star_ring = 38;
					var star_spd_shoot = 8;
					var star_spd_final = 1.1;
					var star_angle_plus = 1;
					var star_angle_max = 80;
					var star_deccel = 0.1;
				break;
				case 3:
					var star_wait = 18;
					var star_ring = 46;
					var star_spd_shoot = 8;
					var star_spd_final = 1.1;
					var star_angle_plus = 1;
					var star_angle_max = 80;
					var star_deccel = 0.1;
				break;
			}
			
			var boss_wait = 200;
			var spell = self;
			
			if(step % boss_wait == boss_wait - 1)
			{
				boss_movement_random(0.2,0,0);
			}
	
			switch(state)
			{
				case 0:
					if(state_time % star_wait == 0)
					{
						shoot_ring(DAN_STARBIG,2.5 + 0.5 * act_dir,star_ring,obj_boss.x,obj_boss.y,rng(360,false,1),star_spd_shoot,sfx_shot1,1 + 0.5 * act_dir);	
						act_dir *= -1;
					}
				break;
			}
			
			with(obj_danmaku)
			{
				switch(state)
				{
					case 0:
						state += 1;
						angle_to = angle + star_angle_max * spell.act_dir;
						x_offscreen = 150;
					break;
					case 1:
						angle = goto_value(angle,angle_to,star_angle_plus);
						spd = goto_value(spd,star_spd_final,star_deccel);
					break;
				}
			}
			
		break;
	}
}
// Inherit the parent event
event_inherited();

