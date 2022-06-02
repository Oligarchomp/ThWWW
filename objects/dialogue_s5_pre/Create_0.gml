/// @description Insert description here
// You can write your code in this editor


global.boss = BOSS_FEZA;
// Inherit the parent event
event_inherited();


need_boss_info = true;
switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 2;
		bgm_step = 17;
		title_step = 3;
		set_dialogue(spr_reimu_art,2,true,spr_nothing,0,false,get_text("diag_s5_r1"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_nothing,0,false,get_text("diag_s5_r2"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_nothing,0,false,get_text("diag_s5_r3"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_feza_art,2,true,get_text("diag_s5_r4"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_feza_art,0,true,get_text("diag_s5_r5"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_feza_art,0,false,get_text("diag_s5_r6"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_feza_art,5,true,get_text("diag_s5_r7"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_feza_art,3,true,get_text("diag_s5_r8"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_feza_art,3,false,get_text("diag_s5_r9"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_feza_art,3,true,get_text("diag_s5_r10"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_feza_art,3,false,get_text("diag_s5_r11"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_feza_art,4,true,get_text("diag_s5_r12"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_feza_art,4,false,get_text("diag_s5_r13"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_feza_art,3,true,get_text("diag_s5_r14"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_feza_art,3,false,get_text("diag_s5_r15"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_feza_art,2,true,get_text("diag_s5_r16"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_feza_art,2,false,get_text("diag_s5_r17"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_feza_art,1,true,get_text("diag_s5_r18"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_feza_art,1,false,get_text("diag_s5_r19"),-1);
	break;
	case P_MARISA:
		boss_step = 2;
		bgm_step = 18;
		title_step = 3;
		set_dialogue(spr_marisa_art,2,true,spr_nothing,0,false,get_text("diag_s5_m1"),-1);
		set_dialogue(spr_marisa_art,1,true,spr_nothing,0,false,get_text("diag_s5_m2"),-1);
		set_dialogue(spr_marisa_art,1,false,spr_nothing,0,false,get_text("diag_s5_m3"),-1);
		set_dialogue(spr_marisa_art,1,false,spr_feza_art,0,true,get_text("diag_s5_m4"),-1);
		set_dialogue(spr_marisa_art,1,false,spr_feza_art,2,true,get_text("diag_s5_m5"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_feza_art,2,false,get_text("diag_s5_m6"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_feza_art,5,true,get_text("diag_s5_m7"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_feza_art,2,true,get_text("diag_s5_m8"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_feza_art,2,false,get_text("diag_s5_m9"),-1);
		set_dialogue(spr_marisa_art,4,true,spr_feza_art,2,false,get_text("diag_s5_m10"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,4,true,get_text("diag_s5_m11"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,3,true,get_text("diag_s5_m12"),-1);
		set_dialogue(spr_marisa_art,4,true,spr_feza_art,3,false,get_text("diag_s5_m13"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,4,true,get_text("diag_s5_m14"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,3,true,get_text("diag_s5_m15"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,2,true,get_text("diag_s5_m16"),-1);
		set_dialogue(spr_marisa_art,5,true,spr_feza_art,2,false,get_text("diag_s5_m17"),-1);
		set_dialogue(spr_marisa_art,4,true,spr_feza_art,2,false,get_text("diag_s5_m18"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_feza_art,1,true,get_text("diag_s5_m19"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_feza_art,1,false,get_text("diag_s5_m20"),-1);
		
	break;
	case P_SANAE:
		boss_step = 2;
		bgm_step = 16;
		title_step = 3;
		set_dialogue(spr_sanae_art,2,true,spr_nothing,0,false,get_text("diag_s5_s1"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s5_s2"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_nothing,0,false,get_text("diag_s5_s3"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_feza_art,3,true,get_text("diag_s5_s4"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_feza_art,3,false,get_text("diag_s5_s5"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_feza_art,0,true,get_text("diag_s5_s6"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_feza_art,0,false,get_text("diag_s5_s7"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_feza_art,2,true,get_text("diag_s5_s8"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_feza_art,2,false,get_text("diag_s5_s9"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_feza_art,4,true,get_text("diag_s5_s10"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_feza_art,4,false,get_text("diag_s5_s11"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_feza_art,3,true,get_text("diag_s5_s12"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_feza_art,3,false,get_text("diag_s5_s13"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_feza_art,3,false,get_text("diag_s5_s14"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_feza_art,3,true,get_text("diag_s5_s15"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_feza_art,0,true,get_text("diag_s5_s16"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_feza_art,2,true,get_text("diag_s5_s17"),-1);
		set_dialogue(spr_sanae_art,4,true,spr_feza_art,2,false,get_text("diag_s5_s18"),-1);
		set_dialogue(spr_sanae_art,4,false,spr_feza_art,3,true,get_text("diag_s5_s19"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_feza_art,3,false,get_text("diag_s5_s20"),-1);
	break;
}
