/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


draw_sprite_ext(spr_apple,0,room_width + 40,room_height + 40,1,1,0,apple_col,apple_alpha * bg_alpha);

for(var i = 0; i < 5; i += 1)//vertical
{
	for (var j = 0; j < 12; j += 1)//hrizontal
	{
		var y_off = (j % 2 == 0) * height / 2;
		draw_sprite_ext(spr_arrow_apple,0,x + width * j - 10,y + i * height - y_off ,1,1,0,arrow_col,arrow_alpha * bg_alpha);
	}
}