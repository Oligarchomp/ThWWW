/// @description Insert description here
// You can write your code in this editor

if(global.rng_patch)
{
	draw_set_font(font_scorename);
	draw_text(830,5,"RNG PATCH")	
}

if(room != room_credit)
{
	draw_set_font(font_replay);

	draw_text(952 - string_width(version),515,version);
}
