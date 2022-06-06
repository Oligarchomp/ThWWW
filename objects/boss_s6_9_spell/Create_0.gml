/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_5",BOSS_NUA,32000000);
spell_set_name("spell_s6_5a","spell_s6_5a","spell_s6_5b","spell_s6_5b")
spell_set_life(3800,280);
spell_set_time(80,false,150);

boss_movement_goto(room_width / 2, 110,7);

item_nbr = 0;

water_angle = rng(360,false,1) //-90

can_shield = true;

timeout_start = 1500;
timeout_phase = false;

anchor_time = 0;
