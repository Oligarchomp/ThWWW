/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_5",BOSS_NUA,32000000);
spell_set_name("spell_s6_5a","spell_s6_5a","spell_s6_5b","spell_s6_5b")
spell_set_life(3300,250);
spell_set_time(70,false,150);

boss_movement_goto(room_width / 2, 110,7);

item_nbr = 0;

water_angle = -90

can_shield = true;

timeout_start = 900;
timeout_phase = false;
timeout_time = 0;