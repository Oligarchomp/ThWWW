/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
need_clear_bonus = true;

switch(global.player_chosen)
{
	case P_REIMU:
		set_dialogue(spr_reimu_art,4,true,spr_feza_art,6,false,get_text("diag_s5_r20"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_feza_art,6,true,get_text("diag_s5_r21"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_feza_art,6,false,get_text("diag_s5_r22"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_feza_art,7,true,get_text("diag_s5_r23"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_feza_art,8,true,get_text("diag_s5_r24"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nothing,0,false,get_text("diag_s5_r25"),-1);
	break;
	case P_MARISA:
		set_dialogue(spr_marisa_art,4,true,spr_feza_art,6,false,get_text("diag_s5_m21"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,6,true,get_text("diag_s5_m22"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,7,true,get_text("diag_s5_m23"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,7,true,get_text("diag_s5_m24"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_feza_art,7,false,get_text("diag_s5_m25"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_feza_art,8,true,get_text("diag_s5_m26"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s5_m27"),-1);
	break;
	case P_SANAE:
		set_dialogue(spr_sanae_art,2,true,spr_feza_art,6,false,get_text("diag_s5_s21"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_feza_art,6,true,get_text("diag_s5_s22"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_feza_art,7,true,get_text("diag_s5_s23"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_feza_art,7,true,get_text("diag_s5_s24"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_feza_art,7,false,get_text("diag_s5_s25"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_feza_art,8,true,get_text("diag_s5_s26"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_nothing,0,false,get_text("diag_s5_s27"),-1);
	break;
	
}

