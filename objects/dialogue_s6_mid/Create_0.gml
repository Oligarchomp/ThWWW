/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.boss = BOSS_FEZA;

instance_create_depth(0,0,0,obj_boss);
obj_boss.spd = 2.5;
obj_boss.x = 450;

switch(global.player_chosen)
{
	case P_REIMU:
		boss_step = 0;
		title_step = 10;
		set_dialogue(spr_reimu_art,0,false,spr_feza_art,8,true,get_text("diag_s6_r1"),150);
		set_dialogue(spr_reimu_art,1,true,spr_feza_art,8,false,get_text("diag_s6_r2"),150);
	break;
	case P_MARISA:
		boss_step = 0;
		title_step = 10;
		set_dialogue(spr_marisa_art,0,false,spr_feza_art,8,true,get_text("diag_s6_m1"),150);
		set_dialogue(spr_marisa_art,0,true,spr_feza_art,8,false,get_text("diag_s6_m2"),150);
	break;
	case P_SANAE:
		boss_step = 0;
		title_step = 10;
		set_dialogue(spr_sanae_art,0,false,spr_feza_art,8,true,get_text("diag_s6_s1"),150);
		set_dialogue(spr_sanae_art,0,true,spr_feza_art,8,false,get_text("diag_s6_s2"),150);
	break;
}

