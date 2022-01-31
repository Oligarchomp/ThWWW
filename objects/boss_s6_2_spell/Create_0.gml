/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_1",BOSS_NUA,30000000)
spell_set_name("spell_s6_1a","spell_s6_1a","spell_s6_1b","spell_s6_1b")
spell_set_life(940,170);
spell_set_time(50,false,95);

boss_movement_goto(room_width / 2, 100,7);


x_anchor = 0;

x_indicator = 0;

anchor_id = noone;

bullet_angle = -90;