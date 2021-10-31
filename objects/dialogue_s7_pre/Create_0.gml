/// @description Insert description here
// You can write your code in this editor


global.boss = BOSS_REVERENCE;
// Inherit the parent event
event_inherited();

boss_movement_goto(room_width / 2, 90,3);

need_boss_info = true;
switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 2;
		bgm_step = 20;
		title_step = 5;
		set_dialogue(spr_reimu_art,2,true,spr_nothing,0,false,get_text("diag_s7_r4"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_nothing,0,false,get_text("diag_s7_r5"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_nothing,0,false,get_text("diag_s7_r6"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_reverence_art,1,true,get_text("diag_s7_r7"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_reverence_art,1,false,get_text("diag_s7_r8"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_reverence_art,0,true,get_text("diag_s7_r9"),-1);
		set_dialogue(spr_reimu_art,3,true,spr_reverence_art,0,false,get_text("diag_s7_r10"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_reverence_art,4,true,get_text("diag_s7_r11"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_reverence_art,1,true,get_text("diag_s7_r12"),-1);
		set_dialogue(spr_reimu_art,3,false,spr_reverence_art,3,true,get_text("diag_s7_r13"),-1);
		set_dialogue(spr_reimu_art,4,true,spr_reverence_art,3,false,get_text("diag_s7_r14"),-1);
		set_dialogue(spr_reimu_art,4,false,spr_reverence_art,4,true,get_text("diag_s7_r15"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_reverence_art,4,false,get_text("diag_s7_r16"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_reverence_art,0,true,get_text("diag_s7_r17"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_reverence_art,0,false,get_text("diag_s7_r18"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_reverence_art,1,true,get_text("diag_s7_r19"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_reverence_art,0,true,get_text("diag_s7_r20"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_reverence_art,0,false,get_text("diag_s7_r21"),-1);
		set_dialogue(spr_reimu_art,5,false,spr_reverence_art,4,true,get_text("diag_s7_r22"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_reverence_art,4,false,get_text("diag_s7_r23"),-1);
		set_dialogue(spr_reimu_art,1,true,spr_reverence_art,4,false,get_text("diag_s7_r24"),-1);
		set_dialogue(spr_reimu_art,1,false,spr_reverence_art,0,true,get_text("diag_s7_r25"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_reverence_art,0,false,get_text("diag_s7_r26"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_reverence_art,1,true,get_text("diag_s7_r27"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_reverence_art,4,true,get_text("diag_s7_r28"),-1);
		set_dialogue(spr_reimu_art,2,false,spr_reverence_art,0,true,get_text("diag_s7_r29"),-1);
	break;
	case P_MARISA:
		boss_step = 2;
		bgm_step = 20;
		title_step = 6;
		set_dialogue(spr_marisa_art,2,true,spr_nothing,0,false,get_text("diag_s7_m4"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_nothing,0,false,get_text("diag_s7_m5"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_nothing,0,false,get_text("diag_s7_m6"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,1,true,get_text("diag_s7_m7"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,0,true,get_text("diag_s7_m8"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_reverence_art,0,false,get_text("diag_s7_m9"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,1,true,get_text("diag_s7_m10"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_reverence_art,1,false,get_text("diag_s7_m11"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,4,true,get_text("diag_s7_m12"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_reverence_art,4,false,get_text("diag_s7_m13"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,0,true,get_text("diag_s7_m14"),-1);
		set_dialogue(spr_marisa_art,1,true,spr_reverence_art,0,false,get_text("diag_s7_m15"),-1);
		set_dialogue(spr_marisa_art,1,false,spr_reverence_art,4,true,get_text("diag_s7_m16"),-1);
		set_dialogue(spr_marisa_art,2,true,spr_reverence_art,4,false,get_text("diag_s7_m17"),-1);
		set_dialogue(spr_marisa_art,2,false,spr_reverence_art,0,true,get_text("diag_s7_m18"),-1);
		set_dialogue(spr_marisa_art,5,true,spr_reverence_art,0,false,get_text("diag_s7_m19"),-1);
		set_dialogue(spr_marisa_art,5,false,spr_reverence_art,1,true,get_text("diag_s7_m20"),-1);
		set_dialogue(spr_marisa_art,5,true,spr_reverence_art,1,false,get_text("diag_s7_m21"),-1);
		set_dialogue(spr_marisa_art,5,false,spr_reverence_art,4,true,get_text("diag_s7_m22"),-1);
		set_dialogue(spr_marisa_art,5,false,spr_reverence_art,1,true,get_text("diag_s7_m23"),-1);
		set_dialogue(spr_marisa_art,0,true,spr_reverence_art,1,false,get_text("diag_s7_m24"),-1);
		set_dialogue(spr_marisa_art,0,false,spr_reverence_art,4,true,get_text("diag_s7_m25"),-1);
		set_dialogue(spr_marisa_art,4,true,spr_reverence_art,4,false,get_text("diag_s7_m26"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_reverence_art,1,true,get_text("diag_s7_m27"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_reverence_art,3,true,get_text("diag_s7_m28"),-1);
		set_dialogue(spr_marisa_art,4,false,spr_reverence_art,1,true,get_text("diag_s7_m29"),-1);
	break;
	case P_SANAE:
		boss_step = 2;
		bgm_step = 20;
		title_step = 9;
		set_dialogue(spr_sanae_art,5,true,spr_nothing,0,false,get_text("diag_s7_s4"),-1);
		set_dialogue(spr_sanae_art,2,true,spr_nothing,0,false,get_text("diag_s7_s5"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_nothing,0,false,get_text("diag_s7_s6"),-1);
		set_dialogue(spr_sanae_art,2,false,spr_reverence_art,1,true,get_text("diag_s7_s7"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_reverence_art,1,false,get_text("diag_s7_s8"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_reverence_art,0,true,get_text("diag_s7_s9"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_reverence_art,0,false,get_text("diag_s7_s10"),-1);
		set_dialogue(spr_sanae_art,3,true,spr_reverence_art,0,false,get_text("diag_s7_s11"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_reverence_art,0,true,get_text("diag_s7_s12"),-1);
		set_dialogue(spr_sanae_art,3,false,spr_reverence_art,1,true,get_text("diag_s7_s13"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_reverence_art,1,false,get_text("diag_s7_s14"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_reverence_art,4,true,get_text("diag_s7_s15"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_reverence_art,4,false,get_text("diag_s7_s16"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_reverence_art,0,true,get_text("diag_s7_s17"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_reverence_art,4,true,get_text("diag_s7_s18"),-1);
		set_dialogue(spr_sanae_art,1,true,spr_reverence_art,4,false,get_text("diag_s7_s19"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_reverence_art,0,true,get_text("diag_s7_s20"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_reverence_art,4,true,get_text("diag_s7_s21"),-1);
		set_dialogue(spr_sanae_art,1,false,spr_reverence_art,0,true,get_text("diag_s7_s22"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_reverence_art,0,false,get_text("diag_s7_s23"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_reverence_art,1,true,get_text("diag_s7_s24"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_reverence_art,0,true,get_text("diag_s7_s25"),-1);
		set_dialogue(spr_sanae_art,5,true,spr_reverence_art,0,false,get_text("diag_s7_s26"),-1);
		set_dialogue(spr_sanae_art,5,false,spr_reverence_art,1,true,get_text("diag_s7_s27"),-1);
		set_dialogue(spr_sanae_art,0,true,spr_reverence_art,1,false,get_text("diag_s7_s28"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_reverence_art,1,true,get_text("diag_s7_s29"),-1);
		set_dialogue(spr_sanae_art,0,false,spr_reverence_art,0,true,get_text("diag_s7_s30"),-1);
	break;
}
