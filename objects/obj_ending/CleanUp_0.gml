/// @description Insert description here
// You can write your code in this editor
ds_list_destroy(line_list);
ds_list_destroy(color_list);
ds_list_destroy(image_list);
ds_list_destroy(line1_list);
ds_list_destroy(line2_list);
ds_list_destroy(line3_list);
ds_list_destroy(line4_list);
ds_list_destroy(name_list);
ds_list_destroy(color_ref_list);

set_bgm(noone);
audio_emitter_gain(global.bgm_emitter,bgm_vol_ref)
