///set_bgm(bgm,intro)
///@param bgm sound
///@param intro sound
function set_bgm(argument0){

	obj_bgm.bgm = argument0;
	obj_bgm.update = true;
	
	var col = c_white;
	
	if(room = room_gp)
	{
		switch(argument0)
		{
			case mus_stage1:
				var name = get_text("mus_stage1");
			break;
			case mus_stage3:
				var name = get_text("mus_stage3");
				col = $121212;
				
				var inst = instance_create_depth(0,0,0,obj_bgm_info);
				inst.bgm_name = get_text("mus_stage3_comp");
				inst.color = $121212;
				inst.off = -18;
			break;
			case mus_boss1:
				var name = get_text("mus_boss1");
			break;
			case mus_boss2:
				var name = get_text("mus_boss2");
			break;
			default:
				var name = "No music yet";
			break;
		}
	
		var inst = instance_create_depth(0,0,0,obj_bgm_info);
		inst.bgm_name = string_insert(name,"BGM : ",7);
		inst.color = col
	}
}