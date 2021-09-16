/// @description Insert description here
// You can write your code in this editor


global.boss = BOSS_SERENE;
// Inherit the parent event
event_inherited();


need_boss_info = true;
switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 2;
		bgm_step = 12;
		title_step = 3;
		set_dialogue(spr_reimu_art,2,true,spr_nothing,1,false,get_text("diag_s3_r1"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nothing,1,false,get_text("diag_s3_r2"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nothing,1,false,get_text("diag_s3_r3"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_pale_art,2,true,get_text("diag_s3_r4"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_pale_art,2,false,get_text("diag_s3_r5"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_pale_art,0,true,get_text("diag_s3_r6"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_pale_art,0,false,get_text("diag_s3_r7"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_pale_art,2,true,get_text("diag_s3_r8"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_pale_art,2,false,get_text("diag_s3_r9"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_pale_art,1,true,get_text("diag_s3_r10"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_pale_art,0,true,get_text("diag_s3_r11"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_pale_art,0,false,get_text("diag_s3_r12"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_pale_art,2,true,get_text("diag_s3_r13"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_pale_art,2,false,get_text("diag_s3_r14"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_pale_art,3,true,get_text("diag_s3_r15"),-1);
	break;
	case P_MARISA:
		boss_step = 2;
		bgm_step = 13;
		title_step = 5;
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s3_m1"),-1)
		set_dialogue(spr_marisa_art,4,true,spr_nothing,0,false,get_text("diag_s3_m2"),-1)
		set_dialogue(spr_marisa_art,4,false,spr_nothing,0,false,get_text("diag_s3_m3"),-1)
		set_dialogue(spr_marisa_art,4,false,spr_pale_art,2,true,get_text("diag_s3_m4"),-1)
		set_dialogue(spr_marisa_art,2,true,spr_pale_art,2,false,get_text("diag_s3_m5"),-1)
		set_dialogue(spr_marisa_art,2,false,spr_pale_art,2,true,get_text("diag_s3_m6"),-1)
		set_dialogue(spr_marisa_art,5,true,spr_pale_art,2,false,get_text("diag_s3_m7"),-1)
		set_dialogue(spr_marisa_art,5,false,spr_pale_art,0,true,get_text("diag_s3_m8"),-1)
		set_dialogue(spr_marisa_art,0,true,spr_pale_art,0,false,get_text("diag_s3_m9"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_pale_art,1,true,get_text("diag_s3_m10"),-1)
		set_dialogue(spr_marisa_art,1,true,spr_pale_art,1,false,get_text("diag_s3_m11"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_pale_art,1,true,get_text("diag_s3_m12"),-1)
		set_dialogue(spr_marisa_art,5,true,spr_pale_art,1,false,get_text("diag_s3_m13"),-1)
		set_dialogue(spr_marisa_art,5,false,spr_pale_art,0,true,get_text("diag_s3_m14"),-1)
		set_dialogue(spr_marisa_art,1,true,spr_pale_art,0,false,get_text("diag_s3_m15"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_pale_art,2,true,get_text("diag_s3_m16"),-1)
		set_dialogue(spr_marisa_art,2,true,spr_pale_art,2,false,get_text("diag_s3_m17"),-1)
	break;
	case P_SANAE:
		boss_step = 2;
		bgm_step = 16;
		title_step = 3;
		set_dialogue(spr_sanae_art,2,true,spr_nothing,0,false,get_text("diag_s3_s1"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_nothing,0,false,get_text("diag_s3_s2"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_nothing,0,false,get_text("diag_s3_s3"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_pale_art,2,true,get_text("diag_s3_s4"),-1);
		set_dialogue(spr_sanae_art,2,true,spr_pale_art,2,false,get_text("diag_s3_s5"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_pale_art,4,true,get_text("diag_s3_s6"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_pale_art,4,false,get_text("diag_s3_s7"),-1);
		set_dialogue(spr_sanae_art,2,true,spr_pale_art,4,false,get_text("diag_s3_s8"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_pale_art,0,true,get_text("diag_s3_s9"),-1);
		set_dialogue(spr_sanae_art,2,true,spr_pale_art,0,false,get_text("diag_s3_s10"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_pale_art,0,false,get_text("diag_s3_s11"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_pale_art,2,true,get_text("diag_s3_s12"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_pale_art,1,false,get_text("diag_s3_s13"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_pale_art,4,true,get_text("diag_s3_s14"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_pale_art,4,true,get_text("diag_s3_s15"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_pale_art,4,false,get_text("diag_s3_s16"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_pale_art,3,true,get_text("diag_s3_s17"),-1);
	break;
}
