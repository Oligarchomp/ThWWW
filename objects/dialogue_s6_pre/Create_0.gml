/// @description Insert description here
// You can write your code in this editor


global.boss = BOSS_NUA;
// Inherit the parent event
event_inherited();


need_boss_info = true;
switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 2;
		bgm_step = 20;
		title_step = 6;
		set_dialogue(spr_reimu_art,5,true,spr_nothing,0,false,get_text("diag_s6_r3"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nothing,0,false,get_text("diag_s6_r4"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nothing,0,false,get_text("diag_s6_r5"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nua_art,0,true,get_text("diag_s6_r6"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nua_art,0,false,get_text("diag_s6_r7"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nua_art,6,true,get_text("diag_s6_r8"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nua_art,0,true,get_text("diag_s6_r9"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_nua_art,0,false,get_text("diag_s6_r10"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_nua_art,0,false,get_text("diag_s6_r11"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_nua_art,5,true,get_text("diag_s6_r12"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_nua_art,1,true,get_text("diag_s6_r13"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nua_art,1,false,get_text("diag_s6_r14"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nua_art,5,true,get_text("diag_s6_r15"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_nua_art,5,false,get_text("diag_s6_r16"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_nua_art,0,true,get_text("diag_s6_r17"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_nua_art,1,true,get_text("diag_s6_r18"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_nua_art,1,false,get_text("diag_s6_r19"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_nua_art,0,true,get_text("diag_s6_r20"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_nua_art,0,false,get_text("diag_s6_r21"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nua_art,0,false,get_text("diag_s6_r22"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nua_art,5,true,get_text("diag_s6_r23"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_nua_art,2,true,get_text("diag_s6_r24"),-1);
	break;
	case P_MARISA:
		boss_step = 2;
		bgm_step = 20;
		title_step = 6;
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s6_m3"),-1);
		set_dialogue(spr_marisa_art,5,true,spr_nothing,0,false,get_text("diag_s6_m4"),-1);
		set_dialogue(spr_marisa_art,5,false,spr_nothing,0,false,get_text("diag_s6_m5"),-1);
		set_dialogue(spr_marisa_art,5,false,spr_nua_art,5,true,get_text("diag_s6_m6"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_nua_art,5,false,get_text("diag_s6_m7"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_nua_art,1,true,get_text("diag_s6_m8"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_nua_art,0,true,get_text("diag_s6_m9"),-1);
		set_dialogue(spr_marisa_art,4,true,spr_nua_art,0,false,get_text("diag_s6_m10"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_nua_art,0,true,get_text("diag_s6_m11"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_nua_art,6,true,get_text("diag_s6_m12"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_nua_art,0,true,get_text("diag_s6_m13"),-1);
		set_dialogue(spr_marisa_art,1,true,spr_nua_art,0,false,get_text("diag_s6_m14"),-1);
		set_dialogue(spr_marisa_art,1,false,spr_nua_art,6,true,get_text("diag_s6_m15"),-1);
		set_dialogue(spr_marisa_art,1,false,spr_nua_art,5,true,get_text("diag_s6_m16"),-1);
		set_dialogue(spr_marisa_art,1,false,spr_nua_art,1,true,get_text("diag_s6_m17"),-1);
		set_dialogue(spr_marisa_art,2,true,spr_nua_art,1,false,get_text("diag_s6_m18"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_nua_art,4,true,get_text("diag_s6_m19"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_nua_art,4,false,get_text("diag_s6_m20"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_nua_art,5,true,get_text("diag_s6_m21"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_nua_art,5,false,get_text("diag_s6_m22"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_nua_art,1,true,get_text("diag_s6_m23"),-1);
		set_dialogue(spr_marisa_art,1,true,spr_nua_art,2,true,get_text("diag_s6_m24"),-1);
	break;
	case P_SANAE:
		boss_step = 2;
		bgm_step = 20;
		title_step = 8;
		set_dialogue(spr_sanae_art,4,true,spr_nothing,0,false,get_text("diag_s6_s3"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s6_s4"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_nothing,0,false,get_text("diag_s6_s5"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_nua_art,5,true,get_text("diag_s6_s6"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nua_art,5,false,get_text("diag_s6_s7"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_nua_art,4,true,get_text("diag_s6_s8"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nua_art,4,false,get_text("diag_s6_s9"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_nua_art,4,false,get_text("diag_s6_s10"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_nua_art,0,true,get_text("diag_s6_s11"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_nua_art,0,false,get_text("diag_s6_s12"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nua_art,5,true,get_text("diag_s6_s13"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nua_art,1,true,get_text("diag_s6_s14"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_nua_art,1,false,get_text("diag_s6_s15"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nua_art,0,true,get_text("diag_s6_s16"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nua_art,6,true,get_text("diag_s6_s17"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nua_art,0,true,get_text("diag_s6_s18"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_nua_art,0,false,get_text("diag_s6_s19"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nua_art,1,true,get_text("diag_s6_s20"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nua_art,6,true,get_text("diag_s6_s21"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nua_art,6,false,get_text("diag_s6_s22"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_nua_art,5,true,get_text("diag_s6_s23"),-1);
		set_dialogue(spr_sanae_art,4,true,spr_nua_art,2,true,get_text("diag_s6_s24"),-1);
	break;
}
