/// @description Insert description here
// You can write your code in this editor


if(abs(global.down_pressed - global.up_pressed))
{
	play_sound(sfx_menu_move,1,false);
	
	//moving cursor
	switch(level)
	{
		case 0:
			var lenght = array_length(menu);
		break;
		case 1:
			var lenght = array_length(menu[cursor[0]].param);
		break;
		case 2:
			var lenght = array_length(menu[cursor[0]].param[cursor[1]].param);
		break;
	}
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
	
	switch(level)
	{
		case 0:
			var act = menu[cursor[level]].action;
		break;
		case 1:
			var act = menu[cursor[0]].param[cursor[level]].action;
		break;
		case 2:
			var act = menu[cursor[0]].param[cursor[1]].param[cursor[level]].action;
		break;
	}
	switch(act)
	{
		case MENU_MENU:
			level += 1;
		break;
		case MENU_START:
			room_goto(room_gp);
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
	}
}





