/// @description Insert description here
// You can write your code in this editor

window_set_fullscreen(data_read("Data.ini","option","fullscreen"));
global.rng_patch = data_read("Data.ini","option","rng")


global.sound_mult = 1.1;

var sfx = data_read("Data.ini","option","sfx");
if(sfx == 0)
{
	data_write("Data.ini","option","sfx",7);
	global.sfx_volume = 7;
}
else
{
	global.sfx_volume = sfx;
}
global.sfx_emitter = audio_emitter_create();
audio_emitter_gain(global.sfx_emitter,(global.sfx_volume - 1) * global.sound_mult / 10);


var bgm = data_read("Data.ini","option","bgm");
if(bgm == 0)
{
	data_write("Data.ini","option","bgm",7);
	global.bgm_volume = 7;
}
else
{
	global.bgm_volume = bgm;
}

global.bgm_emitter = audio_emitter_create();
audio_emitter_gain(global.bgm_emitter,(global.bgm_volume - 1) * global.sound_mult / 10);


global.default_shot_btn = gp_face1;
global.default_focused_btn = gp_face3;
global.default_bomb_btn = gp_face2;
global.default_pause_btn = gp_shoulderl;

global.default_shot_vk = ord("A");
global.default_focused_vk = ord("S");
global.default_bomb_vk = ord("X");
global.default_pause_vk = vk_enter;


var shot_btn = data_read("Data.ini","option","shot_btn");
global.shot_btn = shot_btn == 0 ? global.default_shot_btn : shot_btn;
data_write("Data.ini","option","shot_btn",global.shot_btn);

var shot_vk = data_read("Data.ini","option","shot_vk");
global.shot_vk = shot_vk == 0 ? global.default_shot_vk : shot_vk;
data_write("Data.ini","option","shot_vk",global.shot_vk);


var focused_btn = data_read("Data.ini","option","focused_btn");
global.focused_btn = focused_btn == 0 ? global.default_focused_btn : focused_btn;
data_write("Data.ini","option","focused_btn",global.focused_btn);

var focused_vk = data_read("Data.ini","option","focused_vk");
global.focused_vk = focused_vk == 0 ? global.default_focused_vk : focused_vk;
data_write("Data.ini","option","focused_vk",global.focused_vk);


var bomb_btn = data_read("Data.ini","option","bomb_btn");
global.bomb_btn = bomb_btn == 0 ? global.default_bomb_btn : bomb_btn;
data_write("Data.ini","option","bomb_btn",global.bomb_btn);

var bomb_vk = data_read("Data.ini","option","bomb_vk");
global.bomb_vk = bomb_vk == 0 ? global.default_bomb_vk : bomb_vk;
data_write("Data.ini","option","bomb_vk",global.bomb_vk);


var pause_btn = data_read("Data.ini","option","pause_btn");
global.pause_btn = pause_btn == 0 ? global.default_pause_btn : pause_btn;
data_write("Data.ini","option","pause_btn",global.pause_btn);

var pause_vk = data_read("Data.ini","option","pause_vk");
global.pause_vk = pause_vk == 0 ? global.default_pause_vk : pause_vk;
data_write("Data.ini","option","pause_vk",global.pause_vk);


global.need_change_rng = false;

window_set_cursor(cr_none);

instance_create_depth(0,0,0,obj_bgm);

global.need_intro = true;

//room_goto(room_score);
room_goto(room_main);
//room_goto(room_gp);

global.game_x_offset =  156;
global.game_y_offset =  20;


global.bg_depth = -170;
global.player_hitbox_depth = 0;
global.danmaku_depth = 1;
global.player_depth = 30;
global.item_depth = 33;
global.player_shot_depth = 35;
global.boss_depth = 40;
global.spell_bg_depth = 50;

global.gp_active = true;

global.score = 0;
global.hiscore = 0;
global.score_lenght = 12;

global.spell_file = "SpellData.ini"
//SpellDataPractice.ini

global.player_chosen = P_REIMU;
global.difficulty = 3;
// 0 = easy;
// 1 = normal;
// 2 = hard;
// 3 = lunatic;

global.continues_max = 3;
global.continues = global.continues_max;

global.starting_life = 2;
global.starting_bomb = 2;

global.poc = 0;

// to know what will be played
global.event_list = ds_list_create();
global.wait_list = ds_list_create();

global.score_name = ["er","nr","hr","lr","exr","em","nm","hm","lm","exm","es","ns","hs","ls","exs"]

global.replay_input = [];
global.replay_input_time = [];
global.replay_seed = [];

global.name_entry = "";

//define player_id
#macro P_REIMU 0
#macro P_MARISA 1
#macro P_SANAE 2
#macro P_SUIKA 3

//define boss_id
#macro BOSS_APPLE 1
#macro BOSS_SERENE 2
#macro BOSS_PALE 3
#macro BOSS_IKU 4
#macro BOSS_YUUTO 5
#macro BOSS_FEZA 6
#macro BOSS_NUA 7
#macro BOSS_REVERENCE 8
#macro BOSS_DOVE 9

//define enn_id
#macro EN_RED 0
#macro EN_BLUE 1
#macro EN_GREEN 2
#macro EN_WHITE 3
#macro EN_CRAB 6
#macro EN_FAMILIAR 7
#macro EN_DOVE 8
#macro EN_CIRNO 9


// define danmaku_id
#macro DAN_AMULET 0
#macro DAN_ANCHOR 1
#macro DAN_ARROW 2
#macro DAN_ARROWHEAD 3
#macro DAN_BALL 4
#macro DAN_BUBBLE 5
#macro DAN_BULLET 6
#macro DAN_FIREBALL 7
#macro DAN_HEART 8
#macro DAN_JELLYBEAN 9
#macro DAN_KNIFE 10
#macro DAN_KUNAI 11
#macro DAN_MENTOS 12
#macro DAN_NOTE 13
#macro DAN_PELLET 14
#macro DAN_RAINDROP 15
#macro DAN_REST 16
#macro DAN_RICE 17
#macro DAN_STARBIG 18
#macro DAN_STARSMALL 19
#macro DAN_CRAB 20
#macro DAN_ROCK 21
#macro DAN_BIRD 22

//define rot_type
#macro ROT_FOLLOW 0
#macro ROT_SET 1
#macro ROT_SPIN 2

//define pos_type
#macro POS_ANGLE 0
#macro POS_SP 1
#macro POS_MANUAL 2

//define item_type
#macro ITEM_POINT 0
#macro ITEM_CANCEL 1
#macro ITEM_LIFE 2
#macro ITEM_BOMB 3
#macro ITEM_LIFEPIECE 4
#macro ITEM_BOMBPIECE 5

//define spawn_type
#macro SPAWN_ALPHA 0
#macro SPAWN_SCALE 1

//define menu action
#macro MENU_MENU 0
#macro MENU_START_GAME 1
#macro MENU_START_STAGE 2
#macro MENU_RESTART 3
#macro MENU_TITLE 4
#macro MENU_BACK 5
#macro MENU_SPELL 6
#macro MENU_MUSIC 7
#macro MENU_CONTINUE 8
#macro MENU_QUIT 9
#macro MENU_INVALID 10
#macro MENU_REPLAY 11
#macro MENU_NOTHING 12
#macro MENU_PLAY_REPLAY 13
#macro MENU_NAME 14
#macro MENU_MAKE_SOUND 15


//define pause type
#macro PAUSE_MANUAL 0
#macro PAUSE_GAMEOVER 1
#macro PAUSE_END 2

//define game type
#macro GAME_FULL 0
#macro GAME_STAGE 1
#macro GAME_EXTRA 2
#macro GAME_SPELL 3

global.game_type = GAME_FULL;

//define play type
#macro PLAY_MANUAL 0
#macro PLAY_REPLAY 1

global.play_type = PLAY_MANUAL;

//define replay parameter
#macro REPLAY_INPUT 0
#macro REPLAY_EVENT 1
#macro REPLAY_WAIT 2 
#macro REPLAY_GAMETYPE 3
#macro REPLAY_SEED 4
#macro REPLAY_INPUT_TIME 5
#macro REPLAY_PLAYER 6
#macro REPLAY_DIFFICULTY 7
#macro REPLAY_STAGE_NBR 8

