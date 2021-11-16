/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var bubble_wait = 8;
			var bubble_spd_min = 2.5;
			var bubble_spd_git = 2;
		
			var mentos_wait = 10;
			var mentos_spd_min = 2;
			var mentos_spd_git = 1;
		break;
		case 1:
			var bubble_wait = 5;
			var bubble_spd_min = 2.5;
			var bubble_spd_git = 2;
		
			var mentos_wait = 6;
			var mentos_spd_min = 2;
			var mentos_spd_git = 1;
		break;
		case 2:
			var bubble_wait = 4;
			var bubble_spd_min = 2.5;
			var bubble_spd_git = 2;
		
			var mentos_wait = 4;
			var mentos_spd_min = 2;
			var mentos_spd_git = 1;
		break;
		case 3:
			var bubble_wait = 3;
			var bubble_spd_min = 2.5;
			var bubble_spd_git = 2;
		
			var mentos_wait = 3;
			var mentos_spd_min = 2;
			var mentos_spd_git = 1;
		break;
	}
	
	var fairy_life = 8;
	var fairy_lenght = 580;
	var fairy_wait = 8;
	var y_min = 10;
	var y_git = 90;
	var fairy_spd = 3.5;
	
	var fairy_green_nbr = 5;
	
	if(step == stagecard_time)
	{
		instance_create_depth(0,0,0,obj_stagecard);
	}
	
	
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			var y_pos = y_min + rng(y_git,false,7);
			
			if(fairy_nbr % fairy_green_nbr != fairy_green_nbr - 1)
			{
				var inst = create_enemy(EN_BLUE,200 - 230 * act_dir + rng(5,false,3),y_pos,fairy_life,3,fairy_spd,90 - 90 * act_dir)
			}
			else
			{
				var inst = create_enemy(EN_GREEN,200 - 230 * act_dir + rng(5,false,3),y_pos,fairy_life,2,fairy_spd,90 - 90 * act_dir)
			}
			inst.item_nbr = 2;
			act_dir *= -1;
			fairy_nbr += 1;
		}
		
	
	}
	
	with(obj_enemy3)
	{
		if(step % mentos_wait == 0)
		{
			var sp = mentos_spd_min + rng(mentos_spd_git,false,7);
			shoot(DAN_MENTOS,2,x,y,rng(360,false,3),sp,sfx_shot1,5);
		}
	}
	
	//bubble
	with(obj_enemy2)
	{
		if(step % bubble_wait == 0)
		{
			var sp = bubble_spd_min + rng(bubble_spd_git,false,7);
			shoot(DAN_BUBBLE,3,x,y,rng(360,false,3),sp,sfx_redirect2,6);
		}
	}
	
}
// Inherit the parent event
event_inherited();

