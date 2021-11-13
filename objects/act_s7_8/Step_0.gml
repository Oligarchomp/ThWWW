/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	var fairy_lenght = 800;
	var fairy_wait = 40;
	var fairy_life = 26;
	
	var bubble_arc = 5;
	var bubble_spd_shoot = 7;
	var bubble_deccel = 0.2;
	var bubble_spd_final = 3.5;
	var bubble_dist = 36;
	
	var spam_wait = 2;
	var spam_spd_min = 4;
	var spam_spd_git = 2;
	var spam_open = 10;
	
	var mentos_ring = 18;
	var mentos_spd_min = 2;
	var mentos_spd_plus = 1;
	
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			var x_pos = 50 + rng(300,false,7);
			var inst = create_enemy(EN_GREEN,x_pos,-110,fairy_life,7,10,-90)
			inst.item_nbr = 7;
			inst.offscreen = 20;
			with(inst)
			{
				var aim = rng(360,false,1);
				var count = 0;
				for(var i = 0; i < 360; i += 360 / mentos_ring)
				{
					var ment = shoot(DAN_MENTOS,3,x,y,aim + i,0,noone,6);
					ment.dist_ref = 50;
					ment.my_fairy = inst;
					ment.y_offscreen = 200;
					ment.x_offscreen = 70;
					ment.spd_to = mentos_spd_min + (count % 2) * mentos_spd_plus;
					
					count += 1;
				}
			}
		}
	}
	
	with(obj_danmaku6)
	{
		switch(state)
		{
			case 0:
				if(instance_exists(my_fairy))
				{
					x = my_fairy.x + lengthdir_x(dist_ref,angle + 180);	
					y = my_fairy.y + lengthdir_y(dist_ref,angle + 180);	
				}
				else
				{
					state = 1;
					play_sound(sfx_shot1,1,false);
				}
			break;
			case 1:
				spd = spd_to;
				color_id = 6;
				state = 2;
			break;
		}
	}
	
	with(obj_enemy7)
	{
		switch(state)
		{
			case 0:
				spd = goto_value(spd,0,0.2);
				if(spd == 0)
				{
					state = 1;
					laser_w = 0;
				}
			break;
			case 1://shoot
				
				shoot_arc(DAN_BUBBLE,3,bubble_arc,x,y,999,bubble_dist,bubble_spd_shoot,sfx_redirect1,7);
				
				state = 2;
				
			break;
			case 2://wait
				if(state_time == 20)
				{
					state = 3;
					angle = find_angle(x,y,obj_player.x,obj_player.y);
				}
			break;
			case 3:
				if(state_time % spam_wait == 0)
				{
					var sp = spam_spd_min + rng(spam_spd_git,false,2);
					var ang = angle + 180 - spam_open + rng(spam_open * 2,false,1);
					shoot(DAN_ARROWHEAD,3,x,y,ang,sp,sfx_shot2,4);
				}
				
				spd = goto_value(spd,5,0.05);
			break;
		}
	}
	
	with(obj_danmaku7)
	{
		spd = goto_value(spd,bubble_spd_final,bubble_deccel);	
	}
	
}
// Inherit the parent event
event_inherited();

