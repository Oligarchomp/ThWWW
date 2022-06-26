/// @description Insert description here
// You can write your code in this editor

if(room != room_credit)
{
	if(global.rng_patch)
	{
		switch(global.lan)
		{
			case LAN_ENG:
				draw_set_font(font_scorename);
				var text = "RNG PATCH";
			break;
			case LAN_JAP:
				draw_set_font(global.font_pause_j);
				var text = "ランダムモード";
			break;
		}
		draw_set_halign(fa_right);
		draw_text(950,5,text);	
		draw_set_halign(fa_left);
	}

	draw_set_font(font_replay);
	draw_text(952 - string_width(global.ver),515,global.ver);
}
