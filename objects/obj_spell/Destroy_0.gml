/// @description Insert description here
// You can write your code in this editor

instance_activate_object(parent_bg);

if(global.game_type == GAME_SPELL)
{
	if(time_left != 0) or (is_timeout)
	{
		with(obj_boss)
		{
			state = 2;	
		}
	}
	else
	{
		with(obj_boss)
		{
			switch(boss_id)
			{
				case BOSS_SERENE:
					boss_movement_goto(-200,y,7);
				break;
				default:
					boss_movement_goto(-200,-60,7);
				break;
			}
			state = 1;
		}
	}
}