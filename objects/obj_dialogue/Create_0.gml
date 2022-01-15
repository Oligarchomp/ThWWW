/// @description Insert description here
// You can write your code in this editor


screen_clear(false,true);

state = 0;
old_state = -1;
state_time = 0;


var middle = global.game_x_offset + room_width / 2
x_offset = 170; // from the middle of the game window
y_offset = 280; //from the top of the game window

x_plr_ref = middle - x_offset  // when not active
y_plr_ref = global.game_y_offset + y_offset;

x_boss_ref = middle + x_offset  // when not active
y_boss_ref = global.game_y_offset + y_offset;

plr_active = 0; //goes from 0 to 1;
plr_active_to = 0;

boss_active = 0; //goes from 0 to 1;
boss_active_to = 0;

active_offset = 50; //goes that closer ot he middle when active
active_angle = 30;

x_plr = x_plr_ref;
y_plr = y_plr_ref;

x_boss = x_boss_ref;
y_boss = y_boss_ref;

alpha_min = 0.3;

plr_alpha = 1;
boss_alpha = 1;

art_alpha = 0;

plr_spr = spr_nothing;
boss_spr = spr_nothing;

plr_im = 0;
boss_im = 0;

diag_alpha = 0;
diag_alpha_max = 0.85

x_diag = middle;
y_diag = 443;

text_alpha = 1;
text_alpha_diag = 0;

current_nbr = 0;
current_step = 0;

// all of these always need to have the same number of info
plr_spr_list = ds_list_create();
boss_spr_list = ds_list_create();

plr_im_list = ds_list_create();
boss_im_list = ds_list_create();

plr_active_list = ds_list_create();
boss_active_list = ds_list_create();

text_list = ds_list_create()

wait_list = ds_list_create();

skip_time_ref = 30;
skip_time = 0;

auto_skip = 500; // when 0, go to next
auto_skip_ref = auto_skip;

boss_step = 0;
bgm_step = 0;
title_step = 0;

need_boss_info = false;
need_clear_bonus = false;



