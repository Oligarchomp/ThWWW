/// @description Insert description here
// You can write your code in this editor
depth = 100;

global.game_x_offset =  156;
global.game_y_offset =  20;


global.gp_active = true;

global.time = 0;


global.danmaku_id = 0; //the id of the next danmaku_id to spawn (or the last one spawn if not using it)
global.danmaku_color = 0;
global.danmaku_angle = 0;
global.danmaku_speed = 0;

global.boss = BOSS_APPLE;

global.score = 1000; 

global.item = 0;//
global.poc = 0;

global.spell_life = 1; //use for sharing heath bar between nons and spells

global.enemy_type = 0;

global.bullet_cap = 700;
global.graze_max = 100;

global.graze = 9;
global.piv = 5000;
global.piv_max = 5000000;
global.stage = 1;

instance_create_depth(room_width / 2,430,global.player_depth,obj_player);


if(!instance_exists(obj_bgm))
{
	instance_create_depth(0,0,0,obj_bgm);
}

event_step = 0; // current event step
last_event_step = -1;
event_time = 0; //since how long the current event as been going on
wait_time = 0;


event_list = ds_list_create();
wait_list = ds_list_create();

//need to remotely inject whatever needed

//S7
/*
add_stage_event(act_s7_0,0);//keep this one

add_stage_event(act_s7_52_midspell,30);
add_stage_event(act_s7_1,0)
add_stage_event(act_s7_4,0)
add_stage_event(dialogue_s7_mid,10);
add_stage_event(act_s7_51_midspell,0);
add_stage_event(act_s7_53_midspell,30);
add_stage_event(act_s7_95,100);


add_stage_event(dialogue_s7_pre,100);

add_stage_event(boss_s7_1_non,0);
add_stage_event(boss_s7_15_spell,0);
add_stage_event(boss_s7_2_non,50);
add_stage_event(boss_s7_3_non,50);
add_stage_event(boss_s7_4_non,50);
add_stage_event(boss_s7_5_non,50);
add_stage_event(boss_s7_6_non,50);
add_stage_event(boss_s7_55_spell,0);
add_stage_event(boss_s7_7_non,50);
add_stage_event(boss_s7_8_non,50);

add_stage_event(dialogue_s7_post,70);
*/

//S1
/*
add_stage_event(act_s1_0,0);//keep this one
add_stage_event(act_s1_1,30);
add_stage_event(act_s1_2,0);
add_stage_event(act_s1_3,0);
add_stage_event(act_s1_4,0);
add_stage_event(act_s1_5_midnon,0);
add_stage_event(act_s1_6_midspell,0);
add_stage_event(act_s1_7,0);
add_stage_event(act_s1_8,0);
add_stage_event(act_s1_9,0)
add_stage_event(dialogue_s1_pre,100);
add_stage_event(boss_s1_1_non,0);
add_stage_event(boss_s1_2_spell,0);
add_stage_event(boss_s1_3_non,40);
add_stage_event(boss_s1_4_spell,0);
add_stage_event(dialogue_s1_post,70);
//S2
*/
add_stage_event(act_s2_0,0);//keep this one
add_stage_event(act_s2_1,0);
add_stage_event(act_s2_2,0);
add_stage_event(act_s2_3,0);
add_stage_event(act_s2_4,0);
add_stage_event(act_s2_5,0);
add_stage_event(act_s2_6_midspell,0);
add_stage_event(act_s2_7,0);
add_stage_event(act_s2_8,0);
add_stage_event(act_s2_9,0);
add_stage_event(act_s2_92,60);
add_stage_event(dialogue_s2_pre,100);
add_stage_event(boss_s2_1_non,30);
add_stage_event(boss_s2_2_spell,0);
add_stage_event(boss_s2_3_non,30);
add_stage_event(boss_s2_4_spell,0);
add_stage_event(boss_s2_5_spell,60);
add_stage_event(dialogue_s2_post,70);
/*

//S3

add_stage_event(act_s3_0,0);//keep this one
add_stage_event(act_s3_1,0);
add_stage_event(act_s3_2,0);
add_stage_event(act_s3_3,0);
add_stage_event(act_s3_4,0);
add_stage_event(act_s3_42,0);
add_stage_event(act_s3_43,0);
add_stage_event(act_s3_5,0);
add_stage_event(act_s3_6,90);
add_stage_event(act_s3_7_midspell,0);
add_stage_event(act_s3_8,0);
add_stage_event(act_s3_9,180);
add_stage_event(dialogue_s3_pre,100);
add_stage_event(boss_s3_1_non,0);
add_stage_event(boss_s3_2_spell,0);
add_stage_event(boss_s3_3_non,10);
add_stage_event(boss_s3_4_spell,0);
add_stage_event(boss_s3_5_non,10);
add_stage_event(boss_s3_6_spell,0);
add_stage_event(dialogue_s3_post,100);

//S4
add_stage_event(act_s4_0,0); // keep this one
add_stage_event(act_s4_1,0)
add_stage_event(act_s4_2,0)
add_stage_event(act_s4_25,0)
add_stage_event(act_s4_3,0)
add_stage_event(act_s4_35,0)
add_stage_event(act_s4_4_books,0);
add_stage_event(dialogue_s4_mid,50)
add_stage_event(act_s4_5_midspell,0);
add_stage_event(act_s4_6,0)
add_stage_event(act_s4_7,0)
add_stage_event(act_s4_8,0)
add_stage_event(act_s4_9,30)
add_stage_event(dialogue_s4_pre,60);
add_stage_event(boss_s4_1_non,0);
add_stage_event(boss_s4_2_spell,0);
add_stage_event(boss_s4_3_non,40);
add_stage_event(boss_s4_4_spell,0);
add_stage_event(boss_s4_5_non,40);
add_stage_event(boss_s4_6_spell,0);
add_stage_event(dialogue_s4_yuuto,0);
switch(global.player_chosen)
{
	case P_REIMU:
		add_stage_event(boss_s4_7r_spell,0);
	break;
	case P_MARISA:
		add_stage_event(boss_s4_7m_spell,0);
	break;
	case P_SANAE:
		add_stage_event(boss_s4_7s_spell,0);
	break;
}
add_stage_event(dialogue_s4_post,100);

//S5
add_stage_event(act_s5_0,0);// keep this one
add_stage_event(act_s5_1,0);
add_stage_event(act_s5_2,100);
add_stage_event(act_s5_3,60);
add_stage_event(act_s5_4,0);
add_stage_event(act_s5_5_mid,0);
add_stage_event(act_s5_6_mid,40);
add_stage_event(act_s5_7,0);
add_stage_event(act_s5_8,60);
add_stage_event(act_s5_85,0);
add_stage_event(act_s5_9,0);
add_stage_event(dialogue_s5_pre,60);
add_stage_event(boss_s5_1_non,0);
add_stage_event(boss_s5_2_spell,0);
add_stage_event(boss_s5_3_non,40);
add_stage_event(boss_s5_4_spell,0);
add_stage_event(boss_s5_5_non,40);
add_stage_event(boss_s5_6_spell,0);
add_stage_event(boss_s5_7_spell,60);
add_stage_event(dialogue_s5_post,70);

//S6

add_stage_event(act_s6_0,0);// keep this one
add_stage_event(act_s6_1,30);
add_stage_event(act_s6_2,0);
add_stage_event(act_s6_3,30);
add_stage_event(act_s6_4,0);
add_stage_event(dialogue_s6_mid,50)
add_stage_event(act_s6_5_spell,0);
add_stage_event(dialogue_s6_pre,300);
add_stage_event(boss_s6_1_non,0);
add_stage_event(boss_s6_2_spell,0);
add_stage_event(boss_s6_3_non,50);
add_stage_event(boss_s6_4_spell,0);
add_stage_event(boss_s6_5_non,50);
add_stage_event(boss_s6_6_spell,0);
add_stage_event(boss_s6_7_non,50);
add_stage_event(boss_s6_8_spell,0);
add_stage_event(boss_s6_9_spell,60);



