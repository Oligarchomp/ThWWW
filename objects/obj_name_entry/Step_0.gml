

if(global.right_down or global.left_down)
{
	hhold += 1;
	
	if (hhold > 20) and (hhold % 6 == 0)
	{
		global.right_pressed = global.right_down;
		global.left_pressed = global.left_down;
	}
}
else
{
	hhold = 0;	
}

if(global.up_down or global.down_down)
{
	vhold += 1;
	
	if (vhold > 20) and (vhold % 6 == 0)
	{
		global.up_pressed = global.up_down;
		global.down_pressed = global.down_down;
	}
}
else
{
	vhold = 0;	
}


if(abs(global.right_pressed - global.left_pressed))
{
	var row = (cursor - cursor % panel_width);
	var pos = cursor % panel_width;
	
	pos += global.right_pressed - global.left_pressed;
	pos -= pos >= panel_width ? panel_width : 0;
	pos += pos < 0 ? panel_width : 0;
	
	cursor = row + pos;
	
	play_sound(sfx_menu_move,1,false);
}

if(abs(global.down_pressed - global.up_pressed))
{
	cursor += (global.down_pressed - global.up_pressed) * panel_width;
	cursor -= cursor >= array_length(character) ? array_length(character) : 0;
	cursor += cursor < 0 ? array_length(character) : 0;
	
	play_sound(sfx_menu_move,1,false);
}


if(global.pause_pressed)
{
	global.shot_pressed = true;
	cursor = array_length(character) - 1;
}

if(global.shot_pressed)
{
	switch(character[cursor])
	{
		case "ENTER":
			if(global.name_entry == "")
			{
				global.name_entry = "NO_NAME"
				
				play_sound(sfx_menu_valid,1,false);
			}
			else
			{
				if(!instance_exists(obj_replay))
				{
					data_write("Data.ini","data","name",global.name_entry)
				}
				play_sound(sfx_extend,1,false);
				instance_destroy();
			}
		break;
		case "BACK":
			global.bomb_pressed = true;
		break;
		default:
			if(string_length(global.name_entry) < 7)
			{
				global.name_entry += character[cursor];
		
				play_sound(sfx_menu_valid,1,false);
			}
			else
			{
				audio_play_sound(sfx_menu_invalid,1,false);
			}
		break;
	}
}

if(global.bomb_pressed)
{
	if(global.name_entry == "") and (instance_exists(obj_replay))
	{
		instance_destroy();
	}
	
	global.name_entry = string_delete(global.name_entry,string_length(global.name_entry),1);
	play_sound(sfx_menu_back,1,false);
}




