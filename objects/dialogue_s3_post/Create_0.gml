/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
need_clear_bonus = true;

switch(global.player_chosen)
{
	case P_REIMU:
		set_dialogue(spr_reimu_art,5,false,spr_pale_art,6,true,get_text("diag_s3_r16"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_pale_art,6,false,get_text("diag_s3_r17"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_pale_art,5,true,get_text("diag_s3_r18"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_pale_art,5,true,get_text("diag_s3_r19"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_nothing,0,false,get_text("diag_s3_r20"),-1);
	break;
	case P_MARISA:
		set_dialogue(spr_marisa_art,2,false,spr_pale_art,6,true,get_text("diag_s3_m18"),-1)
		set_dialogue(spr_marisa_art,1,true,spr_pale_art,6,false,get_text("diag_s3_m19"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_pale_art,5,true,get_text("diag_s3_m20"),-1)
		set_dialogue(spr_marisa_art,1,true,spr_pale_art,5,false,get_text("diag_s3_m21"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_pale_art,5,true,get_text("diag_s3_m22"),-1)
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s3_m23"),-1)
	break;
	case P_SANAE:
		set_dialogue(spr_sanae_art,1,true,spr_pale_art,6,false,get_text("diag_s3_s18"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_pale_art,6,true,get_text("diag_s3_s19"),-1);
		set_dialogue(spr_sanae_art,2,true,spr_pale_art,6,false,get_text("diag_s3_s20"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_pale_art,5,true,get_text("diag_s3_s21"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_pale_art,5,true,get_text("diag_s3_s22"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s3_s23"),-1);
	break;
	
}

