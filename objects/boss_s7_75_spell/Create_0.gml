/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s7_7",BOSS_REVERENCE,45000000)
spell_set_name("spell_s7_7","spell_s7_7","spell_s7_7","spell_s7_7")
spell_set_life(800,200);
spell_set_time(26,true,90);

boss_movement_goto(room_width / 2, 110,7);



x_pos = room_width / 2;
y_pos = 0;


need_ball = false;
need_bubble = false;

shoot_step = 0;

resting = false;
rest_image = 0;