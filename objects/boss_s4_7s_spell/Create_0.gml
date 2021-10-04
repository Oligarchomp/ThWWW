/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s4_4s",BOSS_YUUTO,15348080)
spell_set_name("spell_s4_4s","spell_s4_4s","spell_s4_4s","spell_s4_4s")
spell_set_life(1200,300);
spell_set_time(39,false,110);

boss_movement_goto(room_width / 2,room_height / 2 - 20,5);

item_nbr = 0;

rice_time_list = ds_list_create();
rice_angle_list = ds_list_create();
rice_dist_list = ds_list_create();
rice_dir_list = ds_list_create();

rice_wave_dir = -1;
