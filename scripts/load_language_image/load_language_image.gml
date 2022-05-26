/// load_language_sprite()
function load_language_sprite(){
	
	var is_j = (global.lan == LAN_JAP);

	global.spr_credit = load_sprite("credit",4,395,225);
	global.spr_character_title = load_sprite("character_title",8,138,32 + is_j * 10);
	global.spr_difficulties = load_sprite("difficulties",5,135,50);
	global.spr_stage_title = load_sprite("stage_title",7,197,92);
	global.spr_manual = load_sprite("manual",6,-45 + is_j * 68,0);
	global.spr_player_description = load_sprite("description",3,282,140);
	global.spr_intro = load_sprite("intro",1,0,0);
	global.spr_intro_piece = load_sprite("intro_piece",13,0,0);
}