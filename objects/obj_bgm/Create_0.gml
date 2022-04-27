/// @description Insert description here
// You can write your code in this editor

bgm = "";

currently_playing = noone;
update = true;

score_music_mem = noone;
score_time_mem = 0;

music_buffer = -1;
last_bgm = "";


buffer = buffer_create(41000 * 1024,buffer_fixed,2);

