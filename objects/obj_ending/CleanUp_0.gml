/// @description Insert description here
// You can write your code in this editor

while(ds_list_size(line_list) > 0)
{
	ds_list_delete(line_list,0);	
}
ds_list_destroy(line_list);


while(ds_list_size(color_list) > 0)
{
	ds_list_delete(color_list,0);	
}
ds_list_destroy(color_list);


while(ds_list_size(image_list) > 0)
{
	ds_list_delete(image_list,0);	
}
ds_list_destroy(image_list);


while(ds_list_size(line1_list) > 0)
{
	ds_list_delete(line1_list,0);	
}
ds_list_destroy(line1_list);


while(ds_list_size(line2_list) > 0)
{
	ds_list_delete(line2_list,0);	
}
ds_list_destroy(line2_list);


while(ds_list_size(line3_list) > 0)
{
	ds_list_delete(line3_list,0);	
}
ds_list_destroy(line3_list);


while(ds_list_size(line4_list) > 0)
{
	ds_list_delete(line4_list,0);	
}
ds_list_destroy(line4_list);


while(ds_list_size(name_list) > 0)
{
	ds_list_delete(name_list,0);	
}
ds_list_destroy(name_list);


while(ds_list_size(color_ref_list) > 0)
{
	ds_list_delete(color_ref_list,0);	
}
ds_list_destroy(color_ref_list);

set_bgm("noone");
audio_emitter_gain(global.bgm_emitter,bgm_vol_ref)
