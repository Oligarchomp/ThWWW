/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s3_3",BOSS_PALE,300000)
spell_set_name("spell_s3_3a","spell_s3_3a","spell_s3_3b","spell_s3_3b")
spell_set_life(900,290);
spell_set_time(25,false,100);

boss_movement_goto(room_width / 2, 100,7);



angle_shoot = 0;