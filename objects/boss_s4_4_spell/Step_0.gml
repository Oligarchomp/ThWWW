/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			
		break;
		case 1:
			
		break;
		case 2:
		
		break;
		case 3:
			
		break;
	}
	var boss_wait = 159;
	if(step % boss_wait == 0)
	{
		boss_movement_random(3,3,3)
	}
	
	if(step == 0)
	{
		var inst = shoot(DAN_KNIFE,2,room_width / 2,room_height / 2,0,0,sfx_spawn_light,1);
		
	}
	
}
// Inherit the parent event
event_inherited();

