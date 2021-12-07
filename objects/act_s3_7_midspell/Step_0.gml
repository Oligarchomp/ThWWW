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

	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 30:
					boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
					state = 1;
				break;
			}
		break;
		case 1:
			
		break;
	}
	
	
	
	
}
// Inherit the parent event
event_inherited();

