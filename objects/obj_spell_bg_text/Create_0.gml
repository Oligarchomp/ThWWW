/// @description Insert description here
// You can write your code in this editor

x = room_width / 2;
y = 50;
angle = 0;

alpha = 0;
alpha_max = 0.5;
alpha_spd = 8;

state = 0;
last_state = -1;
//0 appearing
//1 staying
//2 disappearing
state_time = 0;

hold_frame = 60;

offset = 0;
spd = 2;

text = "SPELL CARD ATTACK!!"

depth = global.boss_depth + 1;