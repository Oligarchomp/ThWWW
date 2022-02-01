/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


spell_set_spell("s2_1",BOSS_SERENE,15000000)
spell_set_name("spell_s2_1a","spell_s2_1a","spell_s2_1b","spell_s2_1b")
spell_set_life(900,290);
spell_set_time(40,false,100);

boss_movement_goto(room_width / 2, 100,7);

x_crab = [];
y_crab = [];
time_crab = [];

crab_step = 0;

x_charge = [];
y_charge = [];
angle_charge = [];