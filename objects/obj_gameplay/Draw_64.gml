/// @description Insert description here
// You can write your code in this editor
with(obj_danmaku)
{
	if(global.view_hitbox)
	{
		draw_sprite_ext(sprite_index,image_index,x + global.game_x_offset,y + global.game_y_offset,image_xscale,image_yscale,image_angle,c_white,1)
	}	
}

draw_sprite(spr_hud,0,0,0);

draw_set_font(font_spellpractice);

draw_text(150 - string_width(string(fps)),room_height,fps)

//draw difficulty
if(global.stage != 7)
{
	switch(global.difficulty)
	{
		case 0:
			var dif_text = "EASY"
			var col = $58d063;
		break;
		case 1:
			var dif_text = "NORMAL"
			var col = $e39365;
		break;
		case 2:
			var dif_text = "HARD"
			var col = $5656e8;
		break;
		case 3:
			var dif_text = "LUNATIC"
			var col = $e567cf;
		break;
	}
}
else
{
	var dif_text = "EXTRA"
	var col = $bf80e1;
}

draw_set_font(font_game_info)
draw_text_color(720 - string_width(dif_text) / 2,20,dif_text,col,col,col,col,1)


//draw score

draw_text(595,64,"HISCORE:");
draw_text(614,103,"SCORE:");


var hiscore = global.game_type == GAME_FULL or global.game_type == GAME_EXTRA ? max(global.hiscore,score_to_draw) : 0;
hiscore = global.continues_max - global.continues == 0 ? hiscore : global.hiscore;
hiscore = global.rng_patch ? global.hiscore : hiscore;

var hiscore_draw = add_zero(hiscore,global.score_lenght);
draw_score(hiscore_draw,840,69,spr_score,1,1);

var score_draw = add_zero(score_to_draw,global.score_lenght);
draw_score(score_draw,840,108,spr_score,1,1);


//draw score info
var x_info = 595;
var y_item = 287;
var y_graze = 327;
var x_score = 790;


draw_text(x_info,y_item, "ITEM:")
draw_text(x_info,y_graze, "GRAZE:")


var lenght = string_length(string(item_extend[0]));
var pos = x_score - sprite_get_width(spr_score) * lenght - floor((lenght - 1) / 3) * 6;

draw_score(global.item_nbr,pos - 15,y_item + 5,spr_score,1,1);
draw_text(pos,y_item,"/");
draw_score(item_extend[0],x_score,y_item + 5,spr_score,1,1);

draw_score(global.graze,x_score,y_graze + 5,spr_score,1,1);


//draw ressources

var y_life = 170;
var y_bomb = 210;

draw_text(x_info,y_life,"LIFE:");
draw_text(x_info,y_bomb,"BOMB:");

for(var i = 0; i < 7; i += 1)
{
	draw_sprite(spr_life_hud,i >= global.life,x_info + 90 + i * 28,y_life + 12);	
	draw_sprite(spr_bomb_hud,i >= global.bomb,x_info + 90 + i * 28,y_bomb + 12);
}

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


