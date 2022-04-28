/// @description Insert description here
// You can write your code in this editor
depth = global.boss_depth + 10;

alpha = 0;
step = 0;

bgm_vol_ref = audio_emitter_get_gain(global.bgm_emitter);
bgm_vol = bgm_vol_ref;
// Inherit the parent event
event_inherited();

act_set_time(120,121);

