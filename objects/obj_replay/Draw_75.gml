/// @description Insert description here
// You can write your code in this edito


if(instance_exists(obj_gameplay))
{
	draw_sprite_pos(spr_black,0,0,0,960,0,960,540,0,540,0.85);
}

var check = menu;

draw_set_font(font_replay);
				
var xx = 235;
var yy = 60;
var dist = 22;
				
for(var i = 0; i < array_length(check); i += 1)
{
	is_active = cursor == i
					
	var col_val = is_active ? c_white : $696969; 
					
	//relplay number
	draw_text_color(xx - 140,yy + i * dist,"ReplayN" + string(add_zero(i + 1,2)) + " //",col_val,col_val,col_val,col_val,1);
	//name
	draw_text_color(xx - 10 ,yy + i * dist,check[i].nom,col_val,col_val,col_val,col_val,1);
	//date
	draw_text_color(xx + 80,yy + i * dist,"/ " + check[i].date,col_val,col_val,col_val,col_val,1);
	// hour
	draw_text_color(xx + 190,yy + i * dist,"/ " + check[i].hour ,col_val,col_val,col_val,col_val,1);
	// player
	draw_text_color(xx + 270,yy + i * dist,"/ " + check[i].player,col_val,col_val,col_val,col_val,1);
	// difficulty
	draw_text_color(xx + 360,yy + i * dist,"/ " + check[i].difficulty,col_val,col_val,col_val,col_val,1);
	// game_type
	draw_text_color(xx + 460,yy + i * dist,"/ " + check[i].game_type,col_val,col_val,col_val,col_val,1);		


	draw_text_color(xx - 208,yy + i * dist,check[i].version,col_val,col_val,col_val,col_val,1);	
}