/// @description Insert description here
// You can write your code in this editor
depth = 50;


switch(global.game_type)
{
	case GAME_FULL:
	case GAME_EXTRA:
	case GAME_STAGE:
		global.spell_file = "SpellData.ini"
	break;
	case GAME_SPELL:
		global.spell_file = "SpellDataPractice.ini"
	break;
}


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

global.starting_life = 2;
global.starting_bomb = 2;


item_extend = ds_list_create();

switch(global.game_type)
{
	case GAME_FULL:
		global.life = global.starting_life;
		global.bomb = global.starting_bomb;
		
		ds_list_add(item_extend,250,600,1000,1500,2200,9999);
	break;
	case GAME_EXTRA:
		global.life = global.starting_life;
		global.bomb = global.starting_bomb;
		
		ds_list_add(item_extend,600,1400,9999);
	break;
	case GAME_SPELL:
		global.life = 0;
		global.bomb = 0;
		
		ds_list_add(item_extend,9999);
	break;
	case GAME_STAGE:
		global.life = 7;
		global.bomb = global.starting_bomb;
		
		ds_list_add(item_extend,9999);
	break;
}


global.continues_max = 3;
global.continues = global.continues_max;

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


instance_create_depth(room_width / 2,430,global.player_depth,obj_player);


event_step = 0; // current event step
last_event_step = -1;
event_time = 0; //since how long the current event as been going on
wait_time = 0;

end_wait = 0;





pause_type = PAUSE_MANUAL;
pause_state = 0;
//0 = not paused
//1 = paused
//2 = leaving pause

text_offset_max = -45;
text_offset = text_offset_max;
pause_alpha = 0;

pause_spd = 18;

menu_offset = 16;

cursor_lockout = 0;
cursor = [0,0];
level = 0;

pause = 
[
	{
		title : get_text("pause_resume"),
		active_offset : 0,
		action : MENU_BACK
	},
	{
		title : get_text("pause_title"),
		active_offset : 0,
		action : MENU_MENU,
		param :
		[
			{
				title : get_text("pause_yes"),
				active_offset : 0,
				action : MENU_TITLE
			},
			{
				title : get_text("pause_no"),
				active_offset : menu_offset,
				action : MENU_BACK
			}
		]
	},
	{
		title : get_text("pause_retry"),
		active_offset : 0,
		action : MENU_MENU,
		param :
		[
			{
				title : get_text("pause_yes"),
				active_offset : 0,
				action : MENU_RESTART
			},
			{
				title : get_text("pause_no"),
				active_offset : 0,
				action : MENU_BACK
			}
		]
	}	
]


done =
[
	{
		title : get_text("pause_retry"),
		active_offset : 0,
		action : MENU_RESTART
	},
	{
		title : get_text("pause_replay"),
		active_offset : 0,
		action : MENU_REPLAY
	},
	{
		title : get_text("pause_title"),
		active_offset : 0,
		action : MENU_TITLE
	}
]

gameover =
[
	{
		title : get_text("pause_continue"),
		active_offset : 0,
		action : MENU_CONTINUE
	},
	{
		title : get_text("pause_replay"),
		active_offset : 0,
		action : MENU_REPLAY
	},
	{
		title : get_text("pause_title"),
		active_offset : 0,
		action : MENU_MENU,
		param :
		[
			{
				title : get_text("pause_yes"),
				active_offset : 0,
				action : MENU_TITLE
			},
			{
				title : get_text("pause_no"),
				active_offset : 0,
				action : MENU_BACK
			}
		]
	}
]
