/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(obj_name_entry))
{
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

	if(entering_name)
	{
		entering_name = false;
		
		if(global.name_entry != "")
		{
			var date = string(add_zero(date_get_day(date_current_datetime()),2)) + "/";
			date += string(add_zero(date_get_month(date_current_datetime()),2)) + "/";
			date += string(date_get_year(date_current_datetime()) % 1000);
			var hour = string(add_zero(date_get_hour(date_current_datetime()),2)) + ":";
			hour += string(add_zero(date_get_minute(date_current_datetime()),2))
			
			
			var name = "Replay" + string(cursor) + ".txt";
			var save_file = file_text_open_write(working_directory + name);
			var read_file = file_text_open_read(working_directory + "Replay_Write.txt");
			
			
			while(!file_text_eof(read_file))
			{
				file_text_write_string(save_file,file_text_read_string(read_file));
				file_text_readln(read_file)
				file_text_writeln(save_file)
			}
			file_text_writeln(save_file);
			file_text_write_string(save_file,"date = " + date);
			file_text_writeln(save_file);
			file_text_write_string(save_file,"hour = " + hour);
			file_text_writeln(save_file);
			file_text_write_string(save_file,"name = " + global.name_entry);
			
			
			file_text_close(save_file);
			file_text_close(read_file);
			
			instance_destroy();
			instance_create_depth(x,y,depth,obj_replay);
			
			global.name_entry = "";
		}
		else
		{
			menu[cursor].nom = name_mem;
		}
	}
	
	
	
	
	if(cursor_lockout == 0)
	{
		var array_check = menu;

		if(abs(global.up_pressed - global.down_pressed))
		{
			cursor += global.down_pressed - global.up_pressed;
			cursor %= array_length(menu);
			cursor += cursor < 0 ? array_length(menu) : 0;
	
			play_sound(sfx_menu_move,1,false);
		}

		if(global.shot_pressed)
		{
			play_sound(sfx_menu_valid,1,false);
			
			switch(array_check[cursor].action)
			{
				case MENU_NAME:
					instance_create_depth(450,200,depth - 1,obj_name_entry);
					name_mem = menu[cursor].nom;
					entering_name = true;
				break;
			}
		}
		
		if(global.bomb_pressed)
		{
			instance_destroy();
			play_sound(sfx_menu_back,1,false);
		}
	}
	else
	{
		cursor_lockout -= 1;
	}
}
else
{
	menu[cursor].nom = global.name_entry;
	
	cursor_lockout = 10;
}