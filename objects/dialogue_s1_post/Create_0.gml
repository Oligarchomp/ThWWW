/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(global.player_chosen)
{
	case P_REIMU:
		set_dialogue(spr_reimu_art,1,true,spr_nothing,0,false,get_text("diag_s1_r12"),-1);
	break;
	case P_MARISA:
		set_dialogue(spr_marisa_art,1,true,spr_nothing,0,false,get_text("diag_s1_m14"),-1)
	break;
	case P_SANAE:
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s1_s11"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_nothing,0,false,get_text("diag_s1_s12"),-1);
	break;
	
}

