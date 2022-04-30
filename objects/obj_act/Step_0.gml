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

	if(step == act_time_end)
	{
		event_next()
	}
	if (step == true_time_end)
	{
		instance_destroy();
	}
	
	step += 1;
	
	if(get_current_event() == object_index)
	{
		global.x_death_list = [];//need to be used right away by the act object
		global.y_death_list = [];
	}
	
}