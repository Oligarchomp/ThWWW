/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(global.player_chosen)
{
	case P_REIMU:
		set_dialogue(spr_reimu_art,0,false,spr_yuuto_art,2,true,get_text("diag_s4_y"),150);
	break;
	case P_MARISA:
		set_dialogue(spr_marisa_art,0,false,spr_yuuto_art,2,true,get_text("diag_s4_y"),150);
	break;
	case P_SANAE:
		set_dialogue(spr_sanae_art,0,false,spr_yuuto_art,2,true,get_text("diag_s4_y"),150);
	break;
}

