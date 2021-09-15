/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and(spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var way_off = 112;
			var way_lenght = 80; // actually half the lengh
			var way_spd = 80;
			
			var knife_nbr = 0;
			var knife_wait = 45;
			
			var garbage_spd = 3;
		break;
		case 1:
			var way_off = 120;
			var way_lenght = 65; // actually half the lengh
			var way_spd = 66;
			
			var knife_nbr = 4;
			var knife_wait = 45;
			
			var garbage_spd = 3.5;
		break;
		case 2:
			var way_off = 140;
			var way_lenght = 58; // actually half the lengh
			var way_spd = 56;
			
			var knife_nbr = 6;
			var knife_wait = 29;
			
			var garbage_spd = 3.5;
		break;
		case 3:
			var way_off = 140;
			var way_lenght = 50; // actually half the lengh
			var way_spd = 45;
			
			var knife_nbr = 7;
			var knife_wait = 25;
			
			var garbage_spd = 3.5;
		break;
	}
	
	var wait_move = 130;
	
	if(step % wait_move == 0)
	{
		boss_movement_random(3,6,0);
	}
	
	var x_way_plus = sin(step / way_spd) *  way_off;
	x_way = room_width / 2  + x_way_plus;
	
	
	for(var i = 0; i < 3; i += 1)
	{
		var x_pos = rng(room_width,false,i);
		if(x_pos < x_way - way_lenght) or (x_pos > x_way + way_lenght)
		{
			var inst = shoot(DAN_KNIFE + rng(2,true,i),6,x_pos,-20,-90,garbage_spd ,noone,3);
			inst.rot_type = ROT_SPIN;
			inst.rot = rng(360,true,i);
			inst.rot_spd = 0.5 + rng(3,false,i) * (rng(2,true,i) * 2 - 1);
		}
			
	}
	
	if(step % knife_wait == 0)
	{
		for(var i = 0; i < room_width; i += room_width / knife_nbr)
		{
			var inst = shoot(DAN_KNIFE,2 ,i ,-20,-90,garbage_spd ,sfx_redirect1,4);
			inst.rot_type = ROT_SPIN;
			inst.rot = rng(360,true,i);
			inst.rot_spd = 0.5 + rng(3,false,i) * (rng(2,true,i) * 2 - 1);
		}
		
	}
	
}
// Inherit the parent event
event_inherited();

