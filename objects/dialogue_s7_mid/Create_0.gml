/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.boss = BOSS_PALE;

instance_create_depth(0,0,0,obj_boss);
obj_boss.spd = 2;
need_boss_info = true;

switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 0;
		title_step = 10;
		set_dialogue(spr_reimu_art,0,false,spr_pale_art,2,true,get_text("diag_s7_r1"),164);
		set_dialogue(spr_reimu_art,4,true,spr_pale_art,2,false,get_text("diag_s7_r2"),164);
		set_dialogue(spr_reimu_art,2,false,spr_pale_art,3,true,get_text("diag_s7_r3"),120);
	break;
	case P_MARISA:
		boss_step = 0;
		title_step = 10;
		set_dialogue(spr_marisa_art,0,false,spr_pale_art,2,true,get_text("diag_s7_m1"),164);
		set_dialogue(spr_marisa_art,0,true,spr_pale_art,2,false,get_text("diag_s7_m2"),164);
		set_dialogue(spr_marisa_art,0,false,spr_pale_art,0,true,get_text("diag_s7_m3"),120);
	break;
	case P_SANAE:
		boss_step = 0;
		title_step = 10;
		set_dialogue(spr_sanae_art,3,false,spr_pale_art,2,true,get_text("diag_s7_s1"),164);
		set_dialogue(spr_sanae_art,1,true,spr_pale_art,2,false,get_text("diag_s7_s2"),164);
		set_dialogue(spr_sanae_art,1,false,spr_pale_art,3,true,get_text("diag_s7_s3"),120);
	break;
}

