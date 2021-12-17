/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s2_3",BOSS_SERENE,15000000)
spell_set_name("spell_s2_3a","spell_s2_3a","spell_s2_3a","spell_s2_3b")
spell_set_life(1100,310);
spell_set_time(35,false,95);

boss_movement_goto(room_width / 2, 100,7);


crab_x_off = 30;

state2 = 0;
old_state2 = -1;
state_time2 = 0;

item_nbr = 0;