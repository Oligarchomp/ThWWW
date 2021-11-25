/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

need_boss_info = true;
switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 3;
		bgm_step = 10;
		title_step = 4;
		set_dialogue(spr_reimu_art,0,true,spr_nothing,1,false,get_text("diag_s1_r1"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nothing,1,false,get_text("diag_s1_r2"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nothing,1,false,get_text("diag_s1_r3"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nothing,1,false,get_text("diag_s1_r4"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_apple_art,1,true,get_text("diag_s1_r5"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_apple_art,1,false,get_text("diag_s1_r6"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_apple_art,2,true,get_text("diag_s1_r7"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_apple_art,2,false,get_text("diag_s1_r8"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_apple_art,1,true,get_text("diag_s1_r9"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_apple_art,1,false,get_text("diag_s1_r10"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_apple_art,3,true,get_text("diag_s1_r11"),-1);
	break;
	case P_MARISA:
		boss_step = 1;
		bgm_step = 10;
		title_step = 2;
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s1_m1"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_nothing,0,false,get_text("diag_s1_m2"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_apple_art,1,true,get_text("diag_s1_m3"),-1)
		set_dialogue(spr_marisa_art,5,true,spr_apple_art,1,false,get_text("diag_s1_m4"),-1)
		set_dialogue(spr_marisa_art,5,false,spr_apple_art,0,true,get_text("diag_s1_m5"),-1)
		set_dialogue(spr_marisa_art,0,true,spr_apple_art,0,false,get_text("diag_s1_m6"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_apple_art,3,true,get_text("diag_s1_m7"),-1)
		set_dialogue(spr_marisa_art,5,true,spr_apple_art,3,false,get_text("diag_s1_m8"),-1)
		set_dialogue(spr_marisa_art,5,false,spr_apple_art,0,true,get_text("diag_s1_m9"),-1)
		set_dialogue(spr_marisa_art,1,true,spr_apple_art,0,false,get_text("diag_s1_m10"),-1)
		set_dialogue(spr_marisa_art,1,false,spr_apple_art,3,true,get_text("diag_s1_m11"),-1)
		set_dialogue(spr_marisa_art,0,true,spr_apple_art,3,false,get_text("diag_s1_m12"),-1)
		set_dialogue(spr_marisa_art,0,false,spr_apple_art,3,true,get_text("diag_s1_m13"),-1)
	break;
	case P_SANAE:
		boss_step = 2;
		bgm_step = 9;
		title_step = 3;
		set_dialogue(spr_sanae_art,4,true,spr_nothing,0,false,get_text("diag_s1_s1"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_nothing,0,false,get_text("diag_s1_s2"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_nothing,0,false,get_text("diag_s1_s3"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_apple_art,1,true,get_text("diag_s1_s4"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_apple_art,1,false,get_text("diag_s1_s5"),-1);
		set_dialogue(spr_sanae_art,2,true,spr_apple_art,1,false,get_text("diag_s1_s6"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_apple_art,0,true,get_text("diag_s1_s7"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_apple_art,0,false,get_text("diag_s1_s8"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_apple_art,2,true,get_text("diag_s1_s9"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_apple_art,2,false,get_text("diag_s1_s10"),-1);
	break;
}

