/// @description Insert description here
// You can write your code in this editor
depth = 50;

instance_create_depth(room_width / 2,430,global.player_depth,obj_player);

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

global.gp_active = true;

global.time = 0;


item_extend = [];
item_extend_ref = []

if(global.difficulty == 0)
{
	extend_full = [80,200,500,1000,1500,9999];
}
else
{
	extend_full = [250,600,1000,1500,2200,9999];
}
extend_extra = [600,1400,9999];


global.starting_bomb = (global.rng_patch and global.game_type == GAME_FULL) ? global.starting_bomb_rng : global.starting_bomb_normal;

if(global.play_type == PLAY_MANUAL) or (global.replay_stage_nbr == 1)
{
	global.stage_number = -1; //how much stage since the start (used for replay)
	global.score = 0;
	event_step = 0; // current event step
	
	switch(global.game_type)
	{
		case GAME_FULL:
			global.life = global.starting_life;
			global.bomb = global.starting_bomb;
		
			item_extend = extend_full;
		break;
		case GAME_EXTRA:
			global.life = global.starting_life;
			global.bomb = global.starting_bomb;
		
			item_extend = extend_extra;
		break;
		case GAME_SPELL:
			global.life = 0;
			global.bomb = 0;
		
			array_push(item_extend,9999);
		break;
		case GAME_STAGE:
			global.life = 7;
			global.bomb = global.starting_bomb;
		
			array_push(item_extend,9999);
		break;
	}
	
	
	for(var i = 0; i < array_length(item_extend); i += 1)
	{
		array_push(item_extend_ref,item_extend[i])	
	}
	
	global.item_nbr = 0 // how many point item collected
	global.graze = 0;
}
else
{
	global.stage_number = global.replay_stage_nbr - 2;
	global.score = global.replay_score;
	event_step = global.replay_event_step; // current event step
	obj_player.x = global.replay_x;
	obj_player.y = global.replay_y;
	
	global.life = global.replay_life;
	global.bomb = global.replay_bomb;
	global.item_nbr = global.replay_item;
	
	item_extend = extend_full;
	while(item_extend[0] < global.item_nbr)
	{
		array_delete(item_extend,0,1);	
	}
	
	global.graze = global.replay_graze;
}


global.danmaku_id = 0; //the id of the next danmaku_id to spawn (or the last one spawn if not using it)
global.danmaku_color = 0;
global.danmaku_angle = 0;
global.danmaku_speed = 0;

global.boss = BOSS_APPLE;


score_to_draw = 0;


global.continues = global.continues_max;

global.bomb_used = 0;
global.miss = 0;
global.spell_captured = 0;

global.item = 0;//

hud_hiscore = get_text("hud_hiscore");
hud_score = get_text("hud_score");
hud_lives = get_text("hud_lives");
hud_bombs = get_text("hud_bombs");
hud_graze = get_text("hud_graze");
hud_item = get_text("hud_item");

global.spell_life = 1; //use for sharing heath bar between nons and spells

global.enemy_type = 0;


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
global.piv = global.game_type == GAME_EXTRA ? 300000 : global.piv;

global.stage = 1;


replay = [];
next_input_time_index = 0;



if(global.play_type == PLAY_MANUAL)
{
	var ev_str = "ev = "
	var wait_str = "wait = "
	for(var i = 0; i < array_length(global.event_list); i += 1)
	{
		var ev = global.event_list[i];
		if(ev != act_end)
		{
			ev_str += string(ev) + ",";
			wait_str += string(global.wait_list[i]) + ",";
		}
	}
	
	var file = file_text_open_write(working_directory + "Replay_Write.txt");
	file_text_write_string(file,ev_str);
	file_text_writeln(file);
	file_text_write_string(file,wait_str);
	file_text_writeln(file);
	file_text_write_string(file,"version = " + global.ver);
	file_text_writeln(file);
	file_text_write_string(file,"game_type = " + string(global.game_type));
	file_text_writeln(file);
	file_text_write_string(file,"player = " + string(global.player_chosen));
	file_text_writeln(file);
	file_text_write_string(file,"difficulty = " + string(global.difficulty));
	file_text_writeln(file);
	file_text_write_string(file,"rng = " + string(global.rng_patch));
	
	file_text_close(file);
}


last_event_step = -1;
event_time = 0; //since how long the current event as been going on
wait_time = 0;

end_wait = 0;


pause_type = PAUSE_MANUAL;
pause_state = 0;
old_pause_state = 0;
pause_state_time = -1;
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

continue_song = false;

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


replay_menu =
[
	{
		title : get_text("pause_restart_replay"),
		active_offset : 0,
		action : MENU_RESTART
	},
	{
		title : get_text("pause_title"),
		active_offset : 0,
		action : MENU_TITLE
	}
]

yingying_rot = 0;
yingying_rot_spd = 0;

step = 0;

old_fps = 60;

pause_lockout = 0;

pause_title_pause = get_text("pause_pause");
pause_title_endreplay = get_text("pause_endreplay");
pause_title_gameover = get_text("pause_gameover");

pause_continue = get_text("pause_continue");
pause_sure = get_text("pause_sure");
