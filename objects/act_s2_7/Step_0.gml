/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var fairy_wait_shoot = 120;
			var ring_nbr = 2;
			var ring_spd_low = 1.5;
			var ring_spd_hight = 2.5;
		break;
		case 1:
			var fairy_wait_shoot = 95;
			var ring_nbr = 6;
			var ring_spd_low = 2;
			var ring_spd_hight = 3;
		break;
		case 2:
			var fairy_wait_shoot = 80;
			var ring_nbr = 8;
			var ring_spd_low = 2.5;
			var ring_spd_hight = 3.5;
		break;
		case 3:
			var fairy_wait_shoot = 70;
			var ring_nbr = 12;
			var ring_spd_low = 3;
			var ring_spd_hight = 4;
		break;
	}
	var fairy_lenght = 840;
	var fairy_wait = 32;
	var fairy_y_off = 30;
	var fairy_life = 8;
	
	
	if(!instance_exists(obj_spell))
	{
		if(step < fairy_lenght)
		{
			if(step % fairy_wait == 0)
			{
				var inst = create_enemy(EN_BLUE,-20,fairy_y_off + rng(90,false,3),fairy_life,1);
				inst.angle = 0;
				inst.spd = 4;
			
				var inst = create_enemy(EN_BLUE,room_width + 20,fairy_y_off + rng(90,false,3),fairy_life,1);
				inst.angle = 180;
				inst.spd = 4;
			}
		}
	
	
		with(obj_enemy1)
		{
			if(state_time % fairy_wait_shoot == 10)
			{
				var ang = rng(360,false,1);
				shoot_ring(DAN_ARROWHEAD,1,ring_nbr,x,y,ang,ring_spd_low,sfx_shot1,1);
				shoot_ring(DAN_ARROWHEAD,1,ring_nbr,x,y,ang + 360 / ring_nbr / 2,ring_spd_hight,sfx_shot1,1);
			}
		
		
		}
	}
	
}

// Inherit the parent event
event_inherited();

