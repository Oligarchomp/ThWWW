/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


spell_set_spell("s2_2",BOSS_SERENE,15000000)
spell_set_name("spell_s2_2a","spell_s2_2a","spell_s2_2b","spell_s2_2b")
spell_set_life(800,300);
spell_set_time(24,false,95);

boss_movement_goto(room_width / 2, 100,7);

obj_boss.x_disjoint = 120;
obj_boss.y_dis_max = 125;
x_body = room_width / 2;
y_body = room_height + 250;

y_claw_ref = 440; 

x_claw_left = -205;
y_claw_left = y_claw_ref;
open_claw_left = 0;

x_claw_right = room_width + 205;
y_claw_right = y_claw_ref;
open_claw_right = 0;