/// @description Insert description here
// You can write your code in this editor
depth = 100;

global.game_x_offset =  156;
global.game_y_offset =  20;

global.gp_active = true;

global.time = 0;


global.danmaku_id = 0; //the id of the next danmaku_id to spawn (or the last one spawn if not using it)
global.danmaku_color = 0;
global.danmaku_angle = 0;
global.danmaku_speed = 0;

global.boss = BOSS_APPLE;

global.score = 0;
score_to_draw = 0;

global.life = 2;
global.bomb = 2;

global.continues = 3;

global.item = 0;//
global.poc = 0;

global.spell_life = 1; //use for sharing heath bar between nons and spells

global.enemy_type = 0;

global.bullet_cap = 700;
global.graze_max = 100;

global.item_nbr = 0 // how many point item collected
global.graze = 0;
switch(global.difficulty)
{
	case 0:
		global.piv = 60000;
	break;
	case 1:
		global.piv = 100000;
	break;
	case 2:
		global.piv = 200000;
	break;
	case 3:
		global.piv = 300000;
	break;
}
global.piv_max = 5000000;
global.stage = 1;

item_extend = ds_list_create();
ds_list_add(item_extend,250,600,1000,1500,2200,9999);

instance_create_depth(room_width / 2,430,global.player_depth,obj_player);


if(!instance_exists(obj_bgm))
{
	instance_create_depth(0,0,0,obj_bgm);
}

event_step = 0; // current event step
last_event_step = -1;
event_time = 0; //since how long the current event as been going on
wait_time = 0;






