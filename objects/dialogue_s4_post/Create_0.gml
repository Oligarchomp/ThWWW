/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
need_clear_bonus = true;

switch(global.player_chosen)
{
	case P_REIMU:
		var im = global.lan == LAN_ENG ? 1 : 2;
		set_dialogue(spr_reimu_art,im,true,spr_yuuto_art,5,false,get_text("diag_s4_r22"),-1);
		set_dialogue(spr_reimu_art,im,false,spr_yuuto_art,5,true,get_text("diag_s4_r23"),-1);
		set_dialogue(spr_reimu_art,im,false,spr_yuuto_art,6,true,get_text("diag_s4_r24"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_yuuto_art,6,false,get_text("diag_s4_r25"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_yuuto_art,6,true,get_text("diag_s4_r26"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_yuuto_art,6,false,get_text("diag_s4_r27"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_yuuto_art,6,true,get_text("diag_s4_r28"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_yuuto_art,6,false,get_text("diag_s4_r29"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_yuuto_art,6,true,get_text("diag_s4_r30"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_yuuto_art,6,false,get_text("diag_s4_r31"),-1);
	break;
	case P_MARISA:
		set_dialogue(spr_marisa_art,1,true,spr_yuuto_art,5,false,get_text("diag_s4_m21"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_yuuto_art,5,true,get_text("diag_s4_m22"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_yuuto_art,6,true,get_text("diag_s4_m23"),-1)
		set_dialogue(spr_marisa_art,0,true,spr_yuuto_art,6,false,get_text("diag_s4_m24"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_yuuto_art,7,true,get_text("diag_s4_m25"),-1)
		set_dialogue(spr_marisa_art,4,true,spr_yuuto_art,7,false,get_text("diag_s4_m26"),-1)
		set_dialogue(spr_marisa_art,4,false,spr_yuuto_art,7,true,get_text("diag_s4_m27"),-1)
		set_dialogue(spr_marisa_art,0,true,spr_yuuto_art,7,false,get_text("diag_s4_m28"),-1)
	break;
	case P_SANAE:
		set_dialogue(spr_sanae_art,3,true,spr_yuuto_art,5,false,get_text("diag_s4_s23"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_yuuto_art,5,false,get_text("diag_s4_s24"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_yuuto_art,5,true,get_text("diag_s4_s25"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_yuuto_art,6,true,get_text("diag_s4_s26"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_yuuto_art,6,false,get_text("diag_s4_s27"),-1);
		set_dialogue(spr_sanae_art,4,true,spr_yuuto_art,6,false,get_text("diag_s4_s28"),-1);
	break;
	
}

