///set(macro)
///@param macro real
function set_font(macro){
	
	var font = font_main;
	
	switch(macro)
	{
		case FONT_MAIN:
			switch(global.lan)
			{
				case LAN_ENG:
					font = font_main;
				break;
				case LAN_JAP:
					font = global.font_main_j;
				break;
			}
		break;
		case FONT_SPELLPRACTICE:
			switch(global.lan)
			{
				case LAN_ENG:
					font = font_spellpractice;
				break;
				case LAN_JAP:
					font = global.font_spellpractice_j;
				break;
			}
		break;
		case FONT_PAUSE:
			switch(global.lan)
			{
				case LAN_ENG:
					font = font_pause;
				break;
				case LAN_JAP:
					font = global.font_pause_j;
				break;
			}
		break;
		case FONT_DIALOGUE:
			switch(global.lan)
			{
				case LAN_ENG:
					font = font_dialogue;
				break;
				case LAN_JAP:
					font = global.font_dialogue_j;
				break;
			}
		break;
		case FONT_GAME_INFO:
			switch(global.lan)
			{
				case LAN_ENG:
					font = font_game_info;
				break;
				case LAN_JAP:
					font = global.font_game_info_j;
				break;
			}
		break;
	}
	
	draw_set_font(font);
}