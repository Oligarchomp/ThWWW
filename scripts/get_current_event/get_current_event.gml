/// get_current_event()

function get_current_event(){
	with(obj_gameplay)
	{
		if (event_step < ds_list_size(event_list))
		{
			return event_list[|event_step];
		}
		else
		{
			return noone;
		}
	}
}