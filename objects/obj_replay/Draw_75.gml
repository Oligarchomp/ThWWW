/// @description Insert description here
// You can write your code in this edito


if(instance_exists(obj_gameplay))
{
	draw_sprite_pos(spr_black,0,0,0,960,0,960,540,0,540,0.85);
}

var check = menu;

draw_set_font(font_replay);
				
var xx = 230;
var yy = 60;
var dist = 22;
				
for(var i = 0; i < array_length(check); i += 1)
{
	is_active = cursor == i
					
	//relplay number
	draw_text_color(xx - 140,yy + i * dist,"ReplayN" + string(add_zero(i + 1,2)) + " //",c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
	//name
	draw_text_color(xx - 10,yy + i * dist,check[i].nom,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
	//date
	draw_text_color(xx + 80,yy + i * dist,"/ " + check[i].date,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
	// hour
	draw_text_color(xx + 190,yy + i * dist,"/ " + check[i].hour ,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
	// player
	draw_text_color(xx + 270,yy + i * dist,"/ " + check[i].player,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
	// difficulty
	draw_text_color(xx + 360,yy + i * dist,"/ " + check[i].difficulty,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
	// game_type
	draw_text_color(xx + 460,yy + i * dist,"/ " + check[i].game_type,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					
}