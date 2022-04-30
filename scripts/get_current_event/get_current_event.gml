/// get_current_event()

function get_current_event(){
	with(obj_gameplay)
	{
		if (event_step < array_length(global.event_list))
		{
			return global.event_list[event_step];
		}
		else
		{
			return noone;
		}
	}
}