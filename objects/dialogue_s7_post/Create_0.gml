/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
need_clear_bonus = false;

switch(global.player_chosen)
{
	case P_REIMU:
		set_dialogue(spr_reimu_art,0,false,spr_reverence_art,10,true,get_text("diag_s7_r30"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_reverence_art,10,false,get_text("diag_s7_r31"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_reverence_art,6,true,get_text("diag_s7_r32"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_reverence_art,9,true,get_text("diag_s7_r33"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_reverence_art,9,false,get_text("diag_s7_r34"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_reverence_art,6,true,get_text("diag_s7_r35"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_reverence_art,5,true,get_text("diag_s7_r36"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_reverence_art,5,false,get_text("diag_s7_r37"),-1);
	break;
	case P_MARISA:
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,10,true,get_text("diag_s7_m30"),-1);
		set_dialogue(spr_marisa_art,2,true,spr_reverence_art,10,false,get_text("diag_s7_m31"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_reverence_art,9,true,get_text("diag_s7_m32"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_reverence_art,6,true,get_text("diag_s7_m33"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_reverence_art,5,true,get_text("diag_s7_m34"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_reverence_art,5,false,get_text("diag_s7_m35"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_reverence_art,5,false,get_text("diag_s7_m36"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,7,true,get_text("diag_s7_m37"),-1);
	break;
	case P_SANAE:
		set_dialogue(spr_sanae_art,3,false,spr_reverence_art,10,true,get_text("diag_s7_s31"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_reverence_art,10,false,get_text("diag_s7_s32"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_reverence_art,5,true,get_text("diag_s7_s33"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_reverence_art,6,true,get_text("diag_s7_s34"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_reverence_art,6,false,get_text("diag_s7_s35"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_reverence_art,6,false,get_text("diag_s7_s36"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_reverence_art,5,true,get_text("diag_s7_s37"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_reverence_art,5,false,get_text("diag_s7_s38"),-1);
	break;
	
}

