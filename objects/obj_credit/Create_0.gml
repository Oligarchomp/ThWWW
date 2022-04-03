/// @description Insert description here
// You can write your code in this editor

x = room_width / 2;

state = 0;
old_state = -1;

state_time = 0;

middle = room_width / 2;

done = false;


instance_create_depth(room_width / 2,0,depth - 1, obj_credit_flower);

var inst = instance_create_depth(room_width / 2 + 40,0,depth - 1, obj_credit_flower);
inst.alpha_flower = 0.1;

black_alpha = 1;

bgm_vol_ref = audio_emitter_get_gain(global.bgm_emitter);
bgm_vol = bgm_vol_ref;


step = 0;
