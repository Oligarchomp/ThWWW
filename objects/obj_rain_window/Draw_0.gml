/// @description Insert description here
// You can write your code in this editor
for (var i = -1; i < 1; i += 1)//vertcial
{
	for (var j = 1; j < 2; j +=1)
	{
		draw_sprite_ext(sprite_index,0,x + j * width,y + height * i,1,1,0,col,0.2);
	}
}