/// @description Insert description here
// You can write your code in this editor

for (var i = -1; i < 3; i += 1)//vertcial
{
	for (var j = -1; j < 3; j +=1)
	{
		draw_sprite(sprite_index,0,x + j * width,y + height * i);
	}
}

var wid = sprite_get_width(spr_reflection);
for(var i = 0; i < sprite_get_height(spr_reflection); i += 4)
{
	draw_sprite_part(spr_reflection,0,0,i,wid,4,cos((step + i * 2.5) / 75) * 30 - 400,i - 450 + step / 120);
}