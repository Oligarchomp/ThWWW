/// @description Insert description here
// You can write your code in this editor

if(global.debug) or (global.hb_mode)
{
	if(room == room_gp)
	{
		var step = 0;
		while(object_get_parent(get_current_event()) != obj_dialogue)
		{
			instance_destroy(get_current_event());
			screen_clear(false,true);
			event_next();
		
			step += 1;
			if(step == 30)
			{
				exit;	
			}
		}
	}
}
