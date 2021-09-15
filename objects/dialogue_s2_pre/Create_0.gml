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
		set_dialogue(spr_reimu_art,0,true,spr_nothing,1,false,get_text("diag_s2_r1"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_nothing,1,false,get_text("diag_s2_r2"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_nothing,1,false,get_text("diag_s2_r3"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_serene_art,1,true,get_text("diag_s2_r4"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_serene_art,1,false,get_text("diag_s2_r5"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_serene_art,0,true,get_text("diag_s2_r6"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_serene_art,0,false,get_text("diag_s2_r7"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_serene_art,3,true,get_text("diag_s2_r8"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_serene_art,3,false,get_text("diag_s2_r9"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_serene_art,4,true,get_text("diag_s2_r10"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_serene_art,4,false,get_text("diag_s2_r11"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_serene_art,2,true,get_text("diag_s2_r12"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_serene_art,4,true,get_text("diag_s2_r13"),-1);
	break;
	case P_MARISA:
		boss_step = 4;
		bgm_step = 10;
		title_step = 5;
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s2_m1"),-1)
		set_dialogue(spr_marisa_art,5,true,spr_nothing,0,false,get_text("diag_s2_m2"),-1)
		set_dialogue(spr_marisa_art,4,true,spr_nothing,0,false,get_text("diag_s2_m3"),-1)
		set_dialogue(spr_marisa_art,1,true,spr_nothing,0,false,get_text("diag_s2_m4"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_nothing,0,false,get_text("diag_s2_m5"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_serene_art,3,true,get_text("diag_s2_m6"),-1)
		set_dialogue(spr_marisa_art,4,true,spr_serene_art,3,false,get_text("diag_s2_m7"),-1)
		set_dialogue(spr_marisa_art,4,false,spr_serene_art,4,true,get_text("diag_s2_m8"),-1)
		set_dialogue(spr_marisa_art,5,true,spr_serene_art,4,false,get_text("diag_s2_m9"),-1)
		set_dialogue(spr_marisa_art,0,true,spr_serene_art,4,false,get_text("diag_s2_m10"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_serene_art,3,true,get_text("diag_s2_m11"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_serene_art,4,true,get_text("diag_s2_m12"),-1)
	break;
	case P_SANAE:
		boss_step = 2;
		bgm_step = 9;
		title_step = 3;
		set_dialogue(spr_sanae_art,2,true,spr_nothing,0,false,get_text("diag_s2_s1"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s2_s2"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_nothing,0,false,get_text("diag_s2_s3"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_serene_art,0,true,get_text("diag_s2_s4"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_serene_art,0,false,get_text("diag_s2_s5"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_serene_art,2,true,get_text("diag_s2_s6"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_serene_art,2,false,get_text("diag_s2_s7"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_serene_art,2,false,get_text("diag_s2_s8"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_serene_art,0,true,get_text("diag_s2_s9"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_serene_art,1,true,get_text("diag_s2_s10"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_serene_art,1,false,get_text("diag_s2_s11"),-1);
	break;
}
