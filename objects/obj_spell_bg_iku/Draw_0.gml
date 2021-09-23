/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


draw_sprite_ext(spr_cloud_iku,0,0,0,1,1,0,$0c8dc3,bg_alpha * 0.2);


var alp = alpha * bg_alpha ;
for(var i = -width; i <= room_width; i += width)
{
	for(var j = 0; j <= room_height + height * 2; j += height)
	{
		draw_sprite_ext(spr_iku_pattern,0,x + i,y + j,1,1,0,$3c1e54,alp);
		draw_sprite_ext(spr_iku_pattern,0,room_width - x - i,room_height - y - j,1,1,0,$3c1e54,alp);
	}
}
