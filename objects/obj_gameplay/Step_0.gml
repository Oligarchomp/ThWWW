/// @description Insert description here
// You can write your code in this editor

//event action
if(global.gp_active)
{
	
	var wait = wait_list[|event_step]
	
	if (event_step < ds_list_size(event_list))
	{
		if (event_step != last_event_step)
		{
			last_event_step = event_step;
		
			event_time = 0;
			wait_time = 0;
		}
	}
	else if (wait_time == wait)
	{
		event_time += 1;
			
	}
	
	if(wait_time == wait)
	{
		
		if (event_time == 0)
		{
			var ev = event_list[|event_step];
			if(!instance_exists(ev))
			{
				instance_create_depth(0,0,0,ev)
			}
		}
	}
	else
	{
		wait_time += 1;
	}
	
}
