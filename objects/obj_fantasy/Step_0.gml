/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	
	
	if (old_state != state)
	{
		old_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	
	switch(state)
	{
		case 0://shoot
			spd += recursiv(spd,0,10,0.01);
			hsp = lengthdir_x(spd,angle);
			vsp = lengthdir_y(spd,angle);
			
			if (spd < 1)
			{
				state = 1;
			}
		break;
		case 1://aim
			if(instance_exists(parent_enemy))
			{
				var target = instance_nearest(x,y,parent_enemy);
				var aim = find_angle(x,y,target.x,target.y);
			}
			else
			{
				var aim = 90;
			}
		
			hsp += lengthdir_x(acc,aim);
			vsp += lengthdir_y(acc,aim);
		break;
		case 2:
			scale += 0.1;
			alpha = goto_value(alpha,0,0.02);
			if(alpha == 0)
			{
				instance_destroy();
			}
			vsp = 0;
			hsp = 0;
		
		break;
	}
	
	if(state < 2)
	{
		base_scale  += recursiv(base_scale ,scale_max,8,0.01);	
		scale = base_scale + sin(state_time / 10) * 0.15;
		
		if(place_meeting(x,y,parent_enemy)) or (state_time > lifespan)
		{
			state = 2;
			play_sound(sfx_mofbomb,1,false)
			screen_shake(5 +rng(5,true,2),5 + rng(5,true,4));
			
			instance_destroy(my_hitbox);
			create_shot_hitbox(x,y,1,spr_bomb_fantasy_collision,6,8,true);
		}
		
	}
	

	x += hsp;
	y += vsp;
	
	with(my_hitbox)
	{
		x = other.x;
		y = other.y;
	}
	
	step += 1;
}