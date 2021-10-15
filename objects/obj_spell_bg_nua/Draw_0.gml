/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for(var i = 0; i < tide_row; i += 1)
{
	for(var j = -1; j < 5; j += 1)
	{
		var col = make_color_hsv(150,178, 10 + y_list[|i] / 2.5 * bg_alpha )
		if( i % 2 == 0)
		{
			draw_sprite_ext(spr_tide,0,x + j * width,y_list[|i],1,1,0,col,bg_alpha);
		}
		else
		{
			draw_sprite_ext(spr_tide,0,room_width - x - j * width,y_list[|i],-1,1,0,col,bg_alpha);
		}
	}
	
}


//rain
for (var i = -1; i < 1; i += 1)//vertcial
{
	for (var j = 1; j < 3; j +=1)
	{
		draw_sprite_ext(spr_rain,0,x_rain2 + j * r_width,y_rain2 + r_height * i,1,1,0,r_col,0.2 * bg_alpha);
		draw_sprite_ext(spr_rain,0,x_rain + j * r_width,y_rain + r_height * i,1,1,0,r_col,0.2 * bg_alpha);
	}
}



