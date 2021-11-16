/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s4_4r",BOSS_YUUTO,24000000)
spell_set_name("spell_s4_4r","spell_s4_4r","spell_s4_4r","spell_s4_4r")
spell_set_life(1000,200);
spell_set_time(39,false,95);

boss_movement_goto(room_width / 2,85,5);

item_nbr = 0;
pos_dir = 1;

rock_id = 0;