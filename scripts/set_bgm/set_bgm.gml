///set_bgm(bgm)
///@param bgm string
function set_bgm(argument0){

	obj_bgm.bgm = argument0;
	obj_bgm.update = true;
	
	var col = c_white;
	
	var skip = false;
	
	if(room = room_gp)
	{
		switch(argument0)
		{
			case "score":
				skip = true;
			break;
			case "noone":
				exit;
			break;
			case "stage1":
				var name = get_text("mus_stage1");
			break;
			case "stage2":
				var name = get_text("mus_stage2");
				
				var inst = instance_create_depth(0,0,0,obj_bgm_info);
				inst.bgm_name = get_text("mus_stage2_comp");
				inst.color = $fffffff;
				inst.off = -20;
			break;
			case "stage3":
				var name = get_text("mus_stage3");
				
				var inst = instance_create_depth(0,0,0,obj_bgm_info);
				inst.bgm_name = get_text("mus_stage3_comp");
				inst.off = -20;
			break;
			case "stage4":
				var name = get_text("mus_stage4");
			break;
			case "stage5":
				var name = get_text("mus_stage5");
			break;
			case "stage6":
				var name = get_text("mus_stage6");
			break;
			case "stage7":
				var name = get_text("mus_stage7");
			break;
			case "boss1":
				var name = get_text("mus_boss1");
			break;
			case "boss2":
				var name = get_text("mus_boss2");
			break;
			case "boss3":
				var name = get_text("mus_boss3");
			break;
			case "boss4":
				var name = get_text("mus_boss4");
			break;
			case "boss6":
				var name = get_text("mus_boss6");
			break;
			case "boss7":
				var name = get_text("mus_boss7");
			break;
			default:
				return;
			break;
		}
		
		if(!skip)
		{
			var inst = instance_create_depth(0,0,0,obj_bgm_info);
			inst.bgm_name = string_insert(name,"BGM : ",7);
			inst.color = col
		}
	}
	
	if(room != room_main) and (argument0 != "noone")
	{
		data_write("Data.ini","music",argument0,1)
	}
}