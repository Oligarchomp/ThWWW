/// @description Insert description here
// You can write your code in this editor



window_set_cursor(cr_none);

instance_create_depth(0,0,0,obj_bgm);

//room_goto(room_score);
room_goto(room_main);
//room_goto(room_gp);

global.bg_depth = -170;
global.player_hitbox_depth = 0;
global.danmaku_depth = 1;
global.player_depth = 30;
global.item_depth = 33;
global.player_shot_depth = 35;
global.boss_depth = 40;
global.spell_bg_depth = 50;

global.gp_active = true;

global.hiscore = 0;

global.spell_file = "SpellData.ini"
//SpellDataPractice.ini

global.player_chosen = P_REIMU;
global.difficulty = 3;
// 0 = easy;
// 1 = normal;
// 2 = hard;
// 3 = lunatic;


// to know what will be played
global.event_list = ds_list_create();
global.wait_list = ds_list_create();

global.score_name = ["er","nr","hr","lr","exr","em","nm","hm","lm","exm","es","ns","hs","ls","exs"]

global.replay_input = [];
global.replay_input_time = [];
global.replay_seed = [];

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
#macro EN_BIG 3
#macro EN_DEATH 4
#macro EN_YY 5
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
