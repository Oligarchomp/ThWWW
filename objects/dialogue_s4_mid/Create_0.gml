/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.boss = BOSS_IKU;

instance_create_depth(0,0,0,obj_boss);
obj_boss.spd = 2;

switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 0;
		title_step = 1;
		set_dialogue(spr_reimu_art,0,false,spr_nothing,1,false,get_text("diag_s4_r1"),90);
		set_dialogue(spr_reimu_art,0,false,spr_iku_art,2,true,get_text("diag_s4_r2"),140);
		set_dialogue(spr_reimu_art,1,true,spr_iku_art,2,false,get_text("diag_s4_r3"),140);
		set_dialogue(spr_reimu_art,2,false,spr_iku_art,1,true,get_text("diag_s4_r4"),120);
	break;
	case P_MARISA:
		boss_step = 0;
		title_step = 1;
		set_dialogue(spr_marisa_art,0,false,spr_nothing,0,false,get_text("diag_s4_m1"),90);
		set_dialogue(spr_marisa_art,0,false,spr_iku_art,2,true,get_text("diag_s4_m2"),140);
		set_dialogue(spr_marisa_art,0,true,spr_iku_art,2,false,get_text("diag_s4_m3"),140);
		set_dialogue(spr_marisa_art,0,false,spr_iku_art,0,true,get_text("diag_s4_m4"),120);
	break;
	case P_SANAE:
		boss_step = 0;
		title_step = 1;
		set_dialogue(spr_sanae_art,3,false,spr_nothing,1,false,get_text("diag_s4_s1"),90);
		set_dialogue(spr_sanae_art,3,false,spr_iku_art,2,true,get_text("diag_s4_s2"),140);
		set_dialogue(spr_sanae_art,2,true,spr_iku_art,2,false,get_text("diag_s4_s3"),140);
		set_dialogue(spr_sanae_art,6,false,spr_iku_art,1,true,get_text("diag_s4_s4"),120);
	break;
}

