///add_fullgame()
function add_fullgame(){
	for(var i = 1; i <= 6; i += 1)
	{
		add_stage(i);
		if(i < 6)
		{
			add_stage_event(act_end_stage,0);
		}
	}
	add_stage_event(act_end,120);
}