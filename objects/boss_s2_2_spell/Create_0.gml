/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


spell_set_spell("s2_1",BOSS_SERENE,200000)
spell_set_name("spell_s2_1a","spell_s2_1a","spell_s2_1b","spell_s2_1b")
spell_set_life(900,290);
spell_set_time(24,false,100);

boss_movement_goto(room_width / 2, 100,7);

x_crab = ds_list_create();
y_crab = ds_list_create();
time_crab = ds_list_create()

crab_step = 0;