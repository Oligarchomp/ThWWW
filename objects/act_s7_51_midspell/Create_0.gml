/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_PALE;
// Inherit the parent event
event_inherited();


spell_set_spell("s7_mid1",BOSS_PALE,40000000)
spell_set_name("spell_s7_mid1","spell_s7_mid1","spell_s7_mid1","spell_s7_mid1")
spell_set_life(900,250);

var wait = global.game_type == GAME_EXTRA ? 160 : 90; //spell practice

spell_set_time(19.1,false,wait);



angle_pale = 90;
dist_pale = 120;
dir = 1;

x_ref = room_width / 2;
y_ref = 210;


rice_time_list = [];
rice_angle_list = [];
rice_dist_list = [];
rice_dir_list = [];

rice_wave_dir = -1;



// to sync with the music
instance_create_depth(0,0,0,act_s7_6);
