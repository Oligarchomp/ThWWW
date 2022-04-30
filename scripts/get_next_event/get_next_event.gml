/// get_next_event()

function get_next_event(){
	with(obj_gameplay)
	{
		if (event_step + 1 < array_length(global.event_list))
		{
			return global.event_list[event_step + 1];
		}
		else
		{
			return noone;
		}
	}
}