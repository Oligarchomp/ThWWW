/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s7_9",BOSS_REVERENCE,34575000)
spell_set_name("spell_s7_9","spell_s7_9","spell_s7_9","spell_s7_9")
spell_set_life(1000,200);
spell_set_time(60,true,90);



item_nbr = 0;

act_dir = 1;

wave_nbr = 0;
wave_wait = 51;


bubble_ray = 162;

x_spd = pi / 380;
x_spd_ref = abs(x_spd);
y_spd = -pi / 1000;
y_spd_ref = abs(y_spd);
z_spd = -pi / 800;
z_spd_ref = abs(z_spd);

