/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{

	var shoot_wait = 10;
	var shoot_spd = 0.8;
	var shoot_grav = 0.04;
	var shoot_grav_max = 6;
	var shoot_open = 10;
	
	var revenge_ring = 8;
	var revenge_spd_shoot = 9;
	var revenge_deccel = 0.2;
	var revenge_spd_final = 4;
	
	if(instance_exists(obj_spell))
	{
		time_wait = 90;
	}
	
	if(time_wait > 0)
	{
		time_wait -= 1;
	}
	
	if(time_wait == 0) and (step < 3500)
	{
		if(step % 260 == 0)
		{
			need_fairy_time = 150;
			act_dir *= -1;
		}
	}
	
	var fairy_wait = 8;
	var fairy_spd = 5;
	var fairy_life = 5;
	
	if(need_fairy_time > 0)
	{
		if(need_fairy_time % fairy_wait == 0)
		{
			var inst = create_enemy(EN_RED,room_width / 2 - 220 * act_dir,20 + rng(50,false,5),fairy_life,1,fairy_spd,90 - 90 * act_dir);
			inst.time_off = rng(shoot_wait,true,9);
			inst.item_nbr = 2;
		}
		
		need_fairy_time -= 1;
	}
	
	with(obj_enemy1)
	{
		if((state_time + time_off) % shoot_wait == 0)
		{
			var ang = 90 + shoot_open - rng(shoot_open * 2,false,8);
			var inst = shoot(DAN_MENTOS,7,x,y,ang,shoot_spd,sfx_shot1,3);
			inst.pos_type = POS_SP;
			inst.y_grav_accel = shoot_grav;
			inst.y_grav_max = shoot_grav_max;	
		}
	}
	
	with(obj_danmaku7)
	{
		spd = goto_value(spd,revenge_spd_final,revenge_deccel);	
	}
	
	
	for(var i = 0; i < ds_list_size(global.x_death_list); i += 1)
	{
		shoot_ring(DAN_BUBBLE,6,revenge_ring,global.x_death_list[|i],global.y_death_list[|i],rng(360,false,5),revenge_spd_shoot,sfx_redirect1,7);
	}
}
// Inherit the parent event
event_inherited();

