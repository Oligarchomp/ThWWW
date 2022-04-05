/// @description Insert description here
// You can write your code in this editor

var col = $c7c7c7;
for (var i = -3; i < 3; i += 1)//vertcial
{
	for (var j = -2; j < 4; j +=1)
	{
		draw_sprite_ext(sprite_index,0,x + j * width,y + height * i,1,1,0,col,1);
	}
}


