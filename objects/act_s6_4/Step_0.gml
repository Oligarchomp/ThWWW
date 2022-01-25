/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	switch(global.difficulty)
	{
		case 0:
			var mentos_wait = 34;
			var mentos_spd_shot = 1;
			var mentos_open = 10;
			var mentos_accel = 0.05;
		break;
		case 1:
			var mentos_wait = 18;
			var mentos_spd_shot = 1;
			var mentos_open = 10;
			var mentos_accel = 0.05;
		break;
		case 2:
			var mentos_wait = 14;
			var mentos_spd_shot = 1;
			var mentos_open = 10;
			var mentos_accel = 0.05;
		break;
		case 3:
			var mentos_wait = 10;
			var mentos_spd_shot = 1;
			var mentos_open = 10;
			var mentos_accel = 0.05;
		break;
	}
	
	var fairy_life = 6;
	var fairy_lenght = 750;
	var fairy_wait = 9;
	var y_min = 10;
	var y_git = 90;
	var fairy_spd = 3.5;
	
	if(step < fairy_lenght)
	{
		if(step % fairy_wait == 0)
		{
			var y_pos = y_min + rng(y_git,false,7);
			var inst = create_enemy(EN_BLUE,200 - 230 * act_dir + rng(5,false,3),y_pos,fairy_life,3,fairy_spd,90 - 90 * act_dir)
			inst.item_nbr = 2;
			act_dir *= -1;
		}
	}
	
	with(obj_enemy3)
	{
		if(step % mentos_wait == 0)
		{
			var ang = 90 - mentos_open + rng(mentos_open * 2,false,6);
			var inst = shoot(DAN_MENTOS,7,x,y,ang,mentos_spd_shot,sfx_shot2,4);
			inst.pos_type = POS_SP;
			inst.y_grav_accel = mentos_accel;
			inst.y_grav_max = 8;	
		}
	}
	
	for(var i = 0; i < ds_list_size(global.x_death_list); i += 1)
	{
		var ang = 90 - mentos_open + rng(mentos_open * 2,false,7);
		var inst = shoot(DAN_BUBBLE,6,global.x_death_list[|i],global.y_death_list[|i],ang,mentos_spd_shot,sfx_redirect2,5);
		inst.pos_type = POS_SP;
		inst.y_grav_accel = mentos_accel;
		inst.y_grav_max = 8;	
	}
}
// Inherit the parent event
event_inherited();

