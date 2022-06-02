/// @description Insert description here
// You can write your code in this editor

player_id = global.player_chosen;

switch(player_id)
{
	case P_REIMU:
		art = spr_reimu_art;
		text = get_text("bomb_reimu");
		time = 230;
	break;
	case P_MARISA:
		art = spr_marisa_art;
		text = get_text("bomb_marisa");
		open = 5;
		open_ref = open;
		time = 250;
		y_shoot_off = 100;
		
		play_sound(sfx_masterspark,1,false);
	break;
	case P_SANAE:
		art = spr_sanae_art;
		text = get_text("bomb_sanae");
		time = 180
		
		iso_offset_x = 0;
		iso_offset_y = 0;
		iso_nbr = 8;
		
		activation_wait = 50;
		activation_wait_ref = activation_wait;
	break;
}

obj_player.bomb_time = time + 60;

//art
art_x = 100 + global.game_x_offset;
art_y = 290 + global.game_y_offset;

art_alpha = 0;
art_alpha_max = 0.8

art_spd = -1;

//text
text_x = - string_width(text);
text_x_final = 10 + global.game_x_offset;
text_y = 480;

text_sliding_spd = 8;

text_col_top = c_white//$ffffff;
text_col_bottom = c_white// $8d8dff;


state = 0;
old_state = -1;
state_time = 0;



screen_shake(15,15);
play_sound(sfx_spell_declaration,1,false);

step = 0;