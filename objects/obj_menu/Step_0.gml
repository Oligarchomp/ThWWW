/// @description Insert description here
// You can write your code in this editor

if(cursor_lockout == 0)
{
	switch(level)
	{
		case 0:
			var array_check = menu;
		break;
		case 1:
			var array_check = menu[cursor[0]].param;
		break;
		case 2:
			var array_check = menu[cursor[0]].param[cursor[1]].param;
		break;
		case 3:
			var array_check = menu[cursor[0]].param[cursor[1]].param[cursor[2]].param;
		break;
	}

	if(abs(global.down_pressed - global.up_pressed))
	{
		play_sound(sfx_menu_move,1,false);
	
		//moving cursor
		var lenght = array_length(array_check);
		
		cursor[level] += global.down_pressed - global.up_pressed;
		cursor[level] %= lenght;
		cursor[level] += cursor[level] < 0 ? lenght : 0;
	
	
		switch(level)
		{
			case 1:
				switch(cursor[0])//difficulty
				{
					case 0:
					case 1:
					case 2:
						global.difficulty += global.down_pressed - global.up_pressed;
						global.difficulty %= 4;
						global.difficulty += global.difficulty < 0 ? 4 : 0;
					break;
				}
			break;
		}
	}

	if(level == 2)
	{
		if(abs(global.right_pressed - global.left_pressed))
		{
			switch(cursor[0])//player
			{
				case 0:
				case 1:
				case 2:
					global.player_chosen += global.right_pressed - global.left_pressed;
					global.player_chosen %= 3;
					global.player_chosen += global.player_chosen < 0 ? 3 : 0;
				
					play_sound(sfx_menu_move,1,false);
				break;
			}
		}
	}


	if(global.shot_pressed)
	{
		play_sound(sfx_menu_valid,1,false);
	
	
		var act = array_check[cursor[level]].action;
	
		switch(act)
		{
			case MENU_MENU:
				level += 1;
				cursor_lockout = array_check[cursor[level]].lockout;
			break;
			case MENU_START_GAME:
				room_transition(room_gp);
				add_fullgame();
				cursor_lockout = 100000;
			break;
			case MENU_START_STAGE:
				room_transition(room_gp);

				var param = array_check[cursor[level]].param;
				add_stage(param);
				
				cursor_lockout = 100000;
			break;
			case MENU_QUIT:
				game_end();
			break;
		
		}
	}

	if(global.bomb_pressed)
	{
		var start_level = level;
		level = goto_value(level,0,1);
	
		if(start_level != level)
		{
			play_sound(sfx_menu_back,1,false);
			cursor_lockout = 10;
		}
	}
}
else
{
	cursor_lockout -= 1;
}




