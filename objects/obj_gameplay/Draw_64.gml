/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_hud,0,0,0);

draw_text(50,room_height,fps)

if (!global.gp_active)
{
	draw_text(0,0,"PAUSE")
}
//draw difficulty
if(global.stage != 7)
{
	switch(global.difficulty)
	{
		case 0:
			var dif_text = "EASY"
		break;
		case 1:
			var dif_text = "NORMAL"
		break;
		case 2:
			var dif_text = "HARD"
		break;
		case 3:
			var dif_text = "LUNATIC"
		break;
	}
}
else
{
	var dif_text = "EXTRA"
}


draw_set_font(font_game_info)
draw_text(700,20,dif_text)//temp


//draw score

global.score -= global.score % 10;//failsafe

var score_draw = add_zero(global.score,16);
draw_score(score_draw,900,108,spr_score,1,1);


//draw score info
var x_info = 610;
var y_value = 325;
var y_graze = 365;
var x_score = 790;


draw_text(x_info,y_value, "VALUE:")
draw_text(x_info,y_graze, "GRAZE:")


draw_score(global.piv,x_score,y_value + 5,spr_score,1,1);
draw_score(global.graze,x_score,y_graze + 5,spr_score,1,1);


//draw boss indicator
with(obj_boss)
{
	draw_set_font(font_spell);
	
	var text = "BOSS";
	var cam_ref =  global.game_x_offset
	var x_pos = x + cam_ref - string_width(text) / 2;
	var boss_indicator_y = 524;
	
	if ( x_pos > cam_ref) and( x_pos < cam_ref + room_width)
	{
		var boss_indicator_alpha = 1;
	}
	else
	{
		var boss_indicator_alpha = 0;
	}
	
	
	var col = $262687
	draw_text_color(x_pos,boss_indicator_y ,text,col,col,col,col,boss_indicator_alpha);
}
//draw Poc// for testing
draw_sprite(spr_arrow,0,global.game_x_offset - 3,global.game_y_offset + global.poc);
