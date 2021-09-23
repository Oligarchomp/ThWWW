/// @description Insert description here
// You can write your code in this editor


global.boss = BOSS_YUUTO;
// Inherit the parent event
event_inherited();


need_boss_info = true;
switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 2;
		bgm_step = 14;
		title_step = 6;
		set_dialogue(spr_reimu_art,1,true,spr_nothing,0,false,get_text("diag_s4_r5"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_nothing,0,false,get_text("diag_s4_r6"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_nothing,0,false,get_text("diag_s4_r7"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_yuuto_art,3,true,get_text("diag_s4_r8"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_yuuto_art,3,false,get_text("diag_s4_r9"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_yuuto_art,3,false,get_text("diag_s4_r10"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_yuuto_art,0,true,get_text("diag_s4_r11"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_yuuto_art,0,false,get_text("diag_s4_r12"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_yuuto_art,0,true,get_text("diag_s4_r13"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_yuuto_art,0,false,get_text("diag_s4_r14"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_yuuto_art,0,true,get_text("diag_s4_r15"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_yuuto_art,0,false,get_text("diag_s4_r16"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_yuuto_art,1,true,get_text("diag_s4_r17"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_yuuto_art,1,false,get_text("diag_s4_r18"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_yuuto_art,2,true,get_text("diag_s4_r19"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_yuuto_art,2,false,get_text("diag_s4_r20"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_yuuto_art,2,true,get_text("diag_s4_r21"),-1);
	break;
	case P_MARISA:
		boss_step = 2;
		bgm_step = 13;
		title_step = 7;
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s4_m5"),-1);
		set_dialogue(spr_marisa_art,4,true,spr_nothing,0,false,get_text("diag_s4_m6"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_nothing,0,false,get_text("diag_s4_m7"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_yuuto_art,0,true,get_text("diag_s4_m8"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_yuuto_art,0,false,get_text("diag_s4_m9"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_yuuto_art,1,true,get_text("diag_s4_m10"),-1);
		set_dialogue(spr_marisa_art,3,true,spr_yuuto_art,1,false,get_text("diag_s4_m11"),-1);
		set_dialogue(spr_marisa_art,3,false,spr_yuuto_art,1,true,get_text("diag_s4_m12"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_yuuto_art,1,false,get_text("diag_s4_m13"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_yuuto_art,2,true,get_text("diag_s4_m14"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_yuuto_art,2,false,get_text("diag_s4_m15"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_yuuto_art,2,true,get_text("diag_s4_m16"),-1);
		set_dialogue(spr_marisa_art,2,true,spr_yuuto_art,2,false,get_text("diag_s4_m17"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_yuuto_art,2,true,get_text("diag_s4_m18"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_yuuto_art,2,false,get_text("diag_s4_m19"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_yuuto_art,1,true,get_text("diag_s4_m20"),-1);
		
	break;
	case P_SANAE:
		boss_step = 2;
		bgm_step = 16;
		title_step = 3;
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s4_s5"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s4_s6"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_nothing,0,false,get_text("diag_s4_s7"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_yuuto_art,3,true,get_text("diag_s4_s8"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_yuuto_art,3,false,get_text("diag_s4_s9"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_yuuto_art,0,true,get_text("diag_s4_s10"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_yuuto_art,0,true,get_text("diag_s4_s11"),-1);
		set_dialogue(spr_sanae_art,2,true,spr_yuuto_art,0,false,get_text("diag_s4_s12"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_yuuto_art,0,false,get_text("diag_s4_s13"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_yuuto_art,4,true,get_text("diag_s4_s14"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_yuuto_art,4,false,get_text("diag_s4_s15"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_yuuto_art,4,true,get_text("diag_s4_s16"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_yuuto_art,4,false,get_text("diag_s4_s17"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_yuuto_art,1,true,get_text("diag_s4_s18"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_yuuto_art,1,false,get_text("diag_s4_s19"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_yuuto_art,0,true,get_text("diag_s4_s20"),-1);
		set_dialogue(spr_sanae_art,4,true,spr_yuuto_art,0,false,get_text("diag_s4_s21"),-1);
		set_dialogue(spr_sanae_art,4,false,spr_yuuto_art,1,true,get_text("diag_s4_s22"),-1);
	break;
}
