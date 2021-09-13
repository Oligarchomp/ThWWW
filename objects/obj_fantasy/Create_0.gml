/// @description Insert description here
// You can write your code in this editor
alpha = 0.5;
scale = 0.1;
base_scale = 0;
scale_max = 0.8;

col = make_color_hsv(0,80,255);
col_dif = rng(255,true,6);
state = 0;
old_state = -1;
state_time = 0;

step = 0;

angle = rng(180,true,5);

hsp = 0;
vsp = 0;

spd = 20;
acc = 0.5

lifespan = 60;

my_hitbox = create_shot_hitbox(x,y,1,spr_bomb_fantasy_collision,0,lifespan,true);