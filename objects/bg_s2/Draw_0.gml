/// @description Insert description here
// You can write your code in this editor

for (var i = -1; i < 3; i += 1)//vertcial
{
	for (var j = -1; j < 3; j +=1)
	{
		draw_sprite(sprite_index,0,x + j * width,y + height * i);
	}
	
}