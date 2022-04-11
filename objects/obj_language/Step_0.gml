/// @description Insert description here
// You can write your code in this editor

if(cursor_lockout == 0)
{
	if(abs(global.down_pressed - global.up_pressed))
	{
		
		var pos_then = cursor;
	
		var lenght = array_length(menu)
		//moving cursor
		
		cursor += global.down_pressed - global.up_pressed;
		cursor %= lenght;
		cursor += cursor < 0 ? lenght : 0;
		
		if(pos_then != cursor)
		{
			play_sound(sfx_menu_move,1,false);
		}
		
	}

	if(global.shot_pressed)
	{
		play_sound(sfx_menu_valid,1,false);
	
		global.lan = menu[cursor].language;
		
		switch(global.lan)
		{
			case LAN_ENG:
				global.text_file = "GameText_eng.txt";
			break;
			case LAN_JAP:
				global.text_file = "GameText_j.txt";
			break;
		}
		
		data_write("Data.ini","option","language",global.lan);
		
		room_transition(room_main,false);
	
		cursor_lockout = 1000;
	
	}
	
}
