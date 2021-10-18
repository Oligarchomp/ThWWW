/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_5",BOSS_NUA,34575000)
spell_set_name("spell_s6_5a","spell_s6_5a","spell_s6_5b","spell_s6_5c")
spell_set_life(3100,170);
spell_set_time(60,false,95);

boss_movement_goto(room_width / 2, 110,7);


phase = 0;

bullet_time = 0;
bullet_aim = 0;
bullet_off = 0;

timeout_time = 780;

item_nbr = 0;