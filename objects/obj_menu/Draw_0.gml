/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_dialogue);

switch(level)
{
	case 0://main menu
		for(var i = 0; i < array_length(menu); i += 1)
		{
			draw_text_color(620 + (cursor[level] == i) * 30,80 + i * 50,menu[i].title,c_white,c_white,c_white,c_white,1);
		}
	break;
	case 1:
		switch(cursor[0])//difficulty
		{
			case 0:
			case 1:
			case 2:
				draw_sprite(spr_difficulty,global.difficulty,600,200);
			break;
		}
	break;
	case 2:
		switch(cursor[0])//character
		{
			case 0:
			case 1:
			case 2:
				switch(global.player_chosen)
				{
					case P_REIMU:
						var art = spr_reimu_art;
					break;
					case P_MARISA:
						var art = spr_marisa_art;
					break;
					case P_SANAE:
						var art = spr_sanae_art;
					break;
				}
				draw_sprite(art,0,600,300);
			break;
		}
	break;
}