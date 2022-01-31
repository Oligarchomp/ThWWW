/// @description Insert description here
// You can write your code in this editor


global.gp_active = true; //for music, mostly

if(global.need_intro) //and (!global.debug)
{
	instance_create_depth(0,0,0,obj_intro)	
	global.need_intro = false;
}
else
{
	set_bgm(mus_title);
}
need_music_time = -1;


if(global.need_change_rng)
{
	global.rng_patch = !global.rng_patch;
	global.need_change_rng = false;
}


ds_list_clear(global.event_list);
ds_list_clear(global.wait_list);


hold_direction_time = 0;

last_controle = 0;
//0 = keyboard;
//1 = controller

for(var i = ord("0"); i <= ord("Z"); i += 1)
{
	key[i] = chr(i);	
}
key[vk_enter] = "Enter"
key[vk_shift] = "Shift"
key[vk_control] = "Control"
key[vk_alt] = "Alt"
key[vk_ralt] = "Alt"
key[vk_backspace] = get_text("controle_backspace");
key[vk_space] = get_text("controle_space");
key[vk_escape] = "Esc"

btn[gp_face1] = get_text("controle_button") + " 1";
btn[gp_face2] = get_text("controle_button") + " 2";
btn[gp_face3] = get_text("controle_button") + " 3";
btn[gp_face4] = get_text("controle_button") + " 4";
btn[gp_shoulderl] = "L " + get_text("controle_shoulder");
btn[gp_shoulderlb] = "Lb " + get_text("controle_shoulder");
btn[gp_shoulderr] = "R " + get_text("controle_shoulder");
btn[gp_shoulderrb] = "Rb " + get_text("controle_shoulder");
btn[gp_select] = "Select"
btn[gp_start] = "Start"


rng_unlock = data_read("Data.ini","data","rng_unlock");
stage_unlock = data_read("Data.ini","data","stage_unlock")

extra_unlock[P_REIMU] = data_read("Data.ini","data","reimu_extra");
extra_unlock[P_MARISA] = data_read("Data.ini","data","marisa_extra");
extra_unlock[P_SANAE] = data_read("Data.ini","data","sanae_extra");
var res = 0;
for(var i = P_REIMU; i < P_SANAE; i += 1)
{
	res += extra_unlock[i];
}
is_extra_valid = sign(res);

// to avoid having the player stuck on rng patch if they somehow activate it without having it unlock
if(global.rng_patch)
{
	data_write("Data.ini","data","rng_unlock",1); 
}


if(!variable_global_exists("menu_level"))
{
	global.menu_cursor = [0,0,0,0];
	global.menu_level = 0;
}

cursor = global.menu_cursor;
level = global.menu_level;

global.menu_cursor = [0,0,0,0];
global.menu_level = 0;


menu = 
[
	{
		title : "START",
		description : get_text("menu_start"),
		action : MENU_MENU,
		param :
		[
			{//difficulty
			action : MENU_MENU,
			param :
			[
				{//player
				action : MENU_START_GAME,
				}
			]
			}
		]
	},
	{
		title : "EXTRA START",
		description : get_text("menu_extra"),
		action : is_extra_valid ? MENU_MENU : MENU_INVALID,
		param :
		[
			{//difficulty
			action : MENU_MENU,
			param :
			[
				{//player
				action : MENU_START_STAGE,
				param : 7
				}
			]
			}
		]
	},
	{
		title : "PRACTICE",
		description : get_text("menu_practice"),
		action : stage_unlock > 0 ? MENU_MENU : MENU_INVALID,
		param :
		[
			{//difficulty
			action : MENU_MENU,
			param :
			[
				{//player
				action : MENU_MENU,
				param : 
				[
					{
						title : "Stage 1",
						action : stage_unlock >= 1 ? MENU_START_STAGE : MENU_INVALID,
						param : 1
					},
					{
						title : "Stage 2",
						action : stage_unlock >= 2 ? MENU_START_STAGE : MENU_INVALID,
						param : 2
					},
					{
						title : "Stage 3",
						active_offset : 0,
						action : stage_unlock >= 3 ? MENU_START_STAGE : MENU_INVALID,
						param : 3
					},
					{
						title : "Stage 4",
						action : stage_unlock >= 4 ? MENU_START_STAGE : MENU_INVALID,
						param : 4
					},
					{
						title : "Stage 5",
						action : stage_unlock >= 5 ? MENU_START_STAGE : MENU_INVALID,
						param : 5
					},
					{
						title : "Stage 6",
						action : stage_unlock >= 6 ? MENU_START_STAGE : MENU_INVALID,
						param : 6
					}
				]
				}
			]
			}
		]
	},
	{
		title : "SPELL PRACTICE",
		description : get_text("menu_spell"),
		action: stage_unlock > 0 ? MENU_MENU : MENU_INVALID,
		param : 
		[
			{
				title : "Stage 1",
				action : stage_unlock >= 1 ? MENU_MENU : MENU_INVALID,
				bg : act_s1_0,
				param : 
				[
					{
						title : get_text("spell_s1_mida"),
						data_name : "s1_mid",
						comment : get_text("com_s1_mide"),
						param : act_s1_6_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s1_mida"),
						data_name : "s1_mid",
						comment : get_text("com_s1_midn"),
						param : act_s1_6_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s1_midb"),
						data_name : "s1_mid",
						comment : get_text("com_s1_midh"),
						param : act_s1_6_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s1_midb"),
						data_name : "s1_mid",
						comment : get_text("com_s1_midl"),
						param : act_s1_6_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s1_1a"),
						data_name : "s1_1",
						comment : get_text("com_s1_1e"),
						param : boss_s1_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s1_1a"),
						comment : get_text("com_s1_1n"),
						data_name : "s1_1",
						param : boss_s1_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s1_1b"),
						data_name : "s1_1",
						comment : get_text("com_s1_1h"),
						param : boss_s1_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s1_1c"),
						data_name : "s1_1",
						comment : get_text("com_s1_1l"),
						param : boss_s1_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s1_2a"),
						comment : get_text("com_s1_2e"),
						data_name : "s1_2",
						param : boss_s1_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s1_2a"),
						comment : get_text("com_s1_2n"),
						data_name : "s1_2",
						param : boss_s1_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s1_2b"),
						comment : get_text("com_s1_2h"),
						data_name : "s1_2",
						param : boss_s1_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s1_2b"),
						comment : get_text("com_s1_2l"),
						data_name : "s1_2",
						param : boss_s1_4_spell,
						diff : 3
					}
				]
			},
			{
				title : "Stage 2",
				action : stage_unlock >= 2 ? MENU_MENU : MENU_INVALID,
				bg : act_s2_0,
				param : 
				[
					{
						title : get_text("spell_s2_mida"),
						data_name : "s2_mid",
						comment : get_text("com_s2_mide"),
						param : act_s2_6_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s2_mida"),
						data_name : "s2_mid",
						comment : get_text("com_s2_midn"),
						param : act_s2_6_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s2_midb"),
						data_name : "s2_mid",
						comment : get_text("com_s2_midh"),
						param : act_s2_6_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s2_midb"),
						data_name : "s2_mid",
						comment : get_text("com_s2_midl"),
						param : act_s2_6_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s2_1a"),
						data_name : "s2_1",
						comment : get_text("com_s2_1e"),
						param : boss_s2_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_1a"),
						data_name : "s2_1",
						comment : get_text("com_s2_1n"),
						param : boss_s2_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_1b"),
						data_name : "s2_1",
						comment : get_text("com_s2_1h"),
						param : boss_s2_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_1b"),
						data_name : "s2_1",
						comment : get_text("com_s2_1l"),
						param : boss_s2_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s2_2a"),
						data_name : "s2_2",
						comment : get_text("com_s2_2e"),
						param : boss_s2_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_2a"),
						data_name : "s2_2",
						comment : get_text("com_s2_2n"),
						param : boss_s2_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_2b"),
						data_name : "s2_2",
						comment : get_text("com_s2_2h"),
						param : boss_s2_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_2b"),
						data_name : "s2_2",
						comment : get_text("com_s2_2l"),
						param : boss_s2_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s2_3a"),
						data_name : "s2_3",
						comment : get_text("com_s2_3e"),
						param : boss_s2_5_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_3a"),
						data_name : "s2_3",
						comment : get_text("com_s2_3n"),
						param : boss_s2_5_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_3a"),
						data_name : "s2_3",
						comment : get_text("com_s2_3h"),
						param : boss_s2_5_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_3b"),
						data_name : "s2_3",
						comment : get_text("com_s2_3l"),
						param : boss_s2_5_spell,
						diff : 3
					}
				]
			},
			{
				title : "Stage 3",
				action : stage_unlock >= 3 ? MENU_MENU : MENU_INVALID,
				bg : act_s3_0,
				param : 
				[
					{
						title : get_text("spell_s3_mida"),
						data_name : "s3_mid",
						comment : get_text("com_s3_mide"),
						param : act_s3_7_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s3_mida"),
						data_name : "s3_mid",
						comment : get_text("com_s3_midn"),
						param : act_s3_7_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s3_midb"),
						data_name : "s3_mid",
						comment : get_text("com_s3_midh"),
						param : act_s3_7_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s3_midb"),
						data_name : "s3_mid",
						comment : get_text("com_s3_midl"),
						param : act_s3_7_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s3_1a"),
						data_name : "s3_1",
						comment : get_text("com_s3_1e"),
						param : boss_s3_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_1a"),
						data_name : "s3_1",
						comment : get_text("com_s3_1n"),
						param : boss_s3_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_1b"),
						data_name : "s3_1",
						comment : get_text("com_s3_1h"),
						param : boss_s3_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_1b"),
						data_name : "s3_1",
						comment : get_text("com_s3_1l"),
						param : boss_s3_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s3_2a"),
						data_name : "s3_2",
						comment : get_text("com_s3_2e"),
						param : boss_s3_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_2a"),
						data_name : "s3_2",
						comment : get_text("com_s3_2n"),
						param : boss_s3_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_2b"),
						data_name : "s3_2",
						comment : get_text("com_s3_2h"),
						param : boss_s3_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_2b"),
						data_name : "s3_2",
						comment : get_text("com_s3_2l"),
						param : boss_s3_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s3_3a"),
						data_name : "s3_3",
						comment : get_text("com_s3_3e"),
						param : boss_s3_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_3a"),
						data_name : "s3_3",
						comment : get_text("com_s3_3n"),
						param : boss_s3_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_3b"),
						data_name : "s3_3",
						comment : get_text("com_s3_3h"),
						param : boss_s3_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_3b"),
						data_name : "s3_3",
						comment : get_text("com_s3_3l"),
						param : boss_s3_6_spell,
						diff : 3
					},
				]
			},
			{
				title : "Stage 4",
				action : stage_unlock >= 4 ? MENU_MENU : MENU_INVALID,
				bg : act_s4_0,
				param : 
				[
					{
						title : get_text("spell_s4_mida"),
						data_name : "s4_mid",
						comment : get_text("com_s4_mide"),
						param : act_s4_5_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s4_mida"),
						data_name : "s4_mid",
						comment : get_text("com_s4_midn"),
						param : act_s4_5_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s4_midb"),
						data_name : "s4_mid",
						comment : get_text("com_s4_midh"),
						param : act_s4_5_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s4_midb"),
						data_name : "s4_mid",
						comment : get_text("com_s4_midl"),
						param : act_s4_5_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s4_1a"),
						data_name : "s4_1",
						comment : get_text("com_s4_1e"),
						param : boss_s4_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_1a"),
						data_name : "s4_1",
						comment : get_text("com_s4_1n"),
						param : boss_s4_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_1b"),
						data_name : "s4_1",
						comment : get_text("com_s4_1h"),
						param : boss_s4_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_1b"),
						data_name : "s4_1",
						comment : get_text("com_s4_1l"),
						param : boss_s4_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_2a"),
						data_name : "s4_2",
						comment : get_text("com_s4_2e"),
						param : boss_s4_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_2a"),
						data_name : "s4_2",
						comment : get_text("com_s4_2n"),
						param : boss_s4_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_2b"),
						data_name : "s4_2",
						comment : get_text("com_s4_2h"),
						param : boss_s4_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_2c"),
						data_name : "s4_2",
						comment : get_text("com_s4_2l"),
						param : boss_s4_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_3a"),
						data_name : "s4_3",
						comment : get_text("com_s4_3e"),
						param : boss_s4_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_3a"),
						data_name : "s4_3",
						comment : get_text("com_s4_3n"),
						param : boss_s4_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_3b"),
						data_name : "s4_3",
						comment : get_text("com_s4_3h"),
						param : boss_s4_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_3b"),
						data_name : "s4_3",
						comment : get_text("com_s4_3l"),
						param : boss_s4_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						comment : get_text("com_s4_4re"),
						param : boss_s4_7r_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						comment : get_text("com_s4_4rn"),
						param : boss_s4_7r_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						comment : get_text("com_s4_4rh"),
						param : boss_s4_7r_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						comment : get_text("com_s4_4rl"),
						param : boss_s4_7r_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						comment : get_text("com_s4_4me"),
						param : boss_s4_7m_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						comment : get_text("com_s4_4mn"),
						param : boss_s4_7m_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						comment : get_text("com_s4_4mh"),
						param : boss_s4_7m_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						comment : get_text("com_s4_4ml"),
						param : boss_s4_7m_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						comment : get_text("com_s4_4se"),
						param : boss_s4_7s_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						comment : get_text("com_s4_4sn"),
						param : boss_s4_7s_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						comment : get_text("com_s4_4sh"),
						param : boss_s4_7s_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						comment : get_text("com_s4_4sl"),
						param : boss_s4_7s_spell,
						diff : 3
					},
				]
			},
			{
				title : "Stage 5",
				action : stage_unlock >= 5 ? MENU_MENU : MENU_INVALID,
				bg : act_s5_0,
				param : 
				[
					{
						title : get_text("spell_s5_1a"),
						data_name : "s5_1",
						comment : get_text("com_s5_1e"),
						param : boss_s5_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_1a"),
						data_name : "s5_1",
						comment : get_text("com_s5_1n"),
						param : boss_s5_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_1b"),
						data_name : "s5_1",
						comment : get_text("com_s5_1h"),
						param : boss_s5_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_1c"),
						data_name : "s5_1",
						comment : get_text("com_s5_1l"),
						param : boss_s5_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_2a"),
						data_name : "s5_2",
						comment : get_text("com_s5_2e"),
						param : boss_s5_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_2a"),
						data_name : "s5_2",
						comment : get_text("com_s5_2n"),
						param : boss_s5_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_2b"),
						data_name : "s5_2",
						comment : get_text("com_s5_2h"),
						param : boss_s5_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_2c"),
						data_name : "s5_2",
						comment : get_text("com_s5_2l"),
						param : boss_s5_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_3a"),
						data_name : "s5_3",
						comment : get_text("com_s5_3e"),
						param : boss_s5_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_3a"),
						data_name : "s5_3",
						comment : get_text("com_s5_3n"),
						param : boss_s5_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_3b"),
						data_name : "s5_3",
						comment : get_text("com_s5_3h"),
						param : boss_s5_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_3b"),
						data_name : "s5_3",
						comment : get_text("com_s5_3l"),
						param : boss_s5_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_4a"),
						data_name : "s5_4",
						comment : get_text("com_s5_4e"),
						param : boss_s5_7_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_4a"),
						data_name : "s5_4",
						comment : get_text("com_s5_4n"),
						param : boss_s5_7_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_4b"),
						data_name : "s5_4",
						comment : get_text("com_s5_4h"),
						param : boss_s5_7_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_4b"),
						data_name : "s5_4",
						comment : get_text("com_s5_4l"),
						param : boss_s5_7_spell,
						diff : 3
					},
				]
			},
			{
				title : "Stage 6",
				action : stage_unlock >= 6 ? MENU_MENU : MENU_INVALID,
				bg : act_s6_0,
				param : 
				[
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						comment : get_text("com_s6_mide"),
						param : act_s6_5_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						comment : get_text("com_s6_midn"),
						param : act_s6_5_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						comment : get_text("com_s6_midh"),
						param : act_s6_5_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						comment : get_text("com_s6_midl"),
						param : act_s6_5_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_1a"),
						data_name : "s6_1",
						comment : get_text("com_s6_1e"),
						param : boss_s6_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_1a"),
						data_name : "s6_1",
						comment : get_text("com_s6_1n"),
						param : boss_s6_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_1b"),
						data_name : "s6_1",
						comment : get_text("com_s6_1h"),
						param : boss_s6_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_1b"),
						data_name : "s6_1",
						comment : get_text("com_s6_1l"),
						param : boss_s6_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_2a"),
						data_name : "s6_2",
						comment : get_text("com_s6_2e"),
						param : boss_s6_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_2a"),
						data_name : "s6_2",
						comment : get_text("com_s6_2n"),
						param : boss_s6_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_2b"),
						data_name : "s6_2",
						comment : get_text("com_s6_2h"),
						param : boss_s6_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_2c"),
						data_name : "s6_2",
						comment : get_text("com_s6_2l"),
						param : boss_s6_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_3a"),
						data_name : "s6_3",
						comment : get_text("com_s6_3e"),
						param : boss_s6_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_3a"),
						data_name : "s6_3",
						comment : get_text("com_s6_3n"),
						param : boss_s6_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_3b"),
						data_name : "s6_3",
						comment : get_text("com_s6_3h"),
						param : boss_s6_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_3c"),
						data_name : "s6_3",
						comment : get_text("com_s6_3l"),
						param : boss_s6_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_4a"),
						data_name : "s6_4",
						comment : get_text("com_s6_4e"),
						param : boss_s6_8_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_4a"),
						data_name : "s6_4",
						comment : get_text("com_s6_4n"),
						param : boss_s6_8_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_4b"),
						data_name : "s6_4",
						comment : get_text("com_s6_4h"),
						param : boss_s6_8_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_4b"),
						data_name : "s6_4",
						comment : get_text("com_s6_4l"),
						param : boss_s6_8_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_5a"),
						data_name : "s6_5",
						comment : get_text("com_s6_5e"),
						param : boss_s6_9_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_5a"),
						data_name : "s6_5",
						comment : get_text("com_s6_5n"),
						param : boss_s6_9_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_5b"),
						data_name : "s6_5",
						comment : get_text("com_s6_5h"),
						param : boss_s6_9_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_5b"),
						data_name : "s6_5",
						comment : get_text("com_s6_5l"),
						param : boss_s6_9_spell,
						diff : 3
					},
				]
			},
			{
				title : "Extra Stage",
				action : stage_unlock >= 7 ? MENU_MENU : MENU_INVALID,
				bg : act_s7_0,
				param : 
				[
					{
						title : get_text("spell_s7_mid1"),
						data_name : "s7_mid1",
						comment : get_text("com_s7_mid1"),
						param : act_s7_51_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_mid2"),
						data_name : "s7_mid2",
						comment : get_text("com_s7_mid2"),
						param : act_s7_52_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_mid3"),
						data_name : "s7_mid3",
						comment : get_text("com_s7_mid3"),
						param : act_s7_53_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_1"),
						data_name : "s7_1",
						comment : get_text("com_s7_1"),
						param : boss_s7_15_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_2"),
						data_name : "s7_2",
						comment : get_text("com_s7_2"),
						param : boss_s7_25_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_3"),
						data_name : "s7_3",
						comment : get_text("com_s7_3"),
						param : boss_s7_35_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_4"),
						data_name : "s7_4",
						comment : get_text("com_s7_4"),
						param : boss_s7_45_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_5"),
						data_name : "s7_5",
						comment : get_text("com_s7_5"),
						param : boss_s7_55_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_6"),
						data_name : "s7_6",
						comment : get_text("com_s7_6"),
						param : boss_s7_65_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_7"),
						data_name : "s7_7",
						comment : get_text("com_s7_7"),
						param : boss_s7_75_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_8"),
						data_name : "s7_8",
						comment : get_text("com_s7_8"),
						param : boss_s7_85_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_9"),
						data_name : "s7_9",
						comment : get_text("com_s7_9"),
						param : boss_s7_9_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_10"),
						data_name : "s7_10",
						comment : get_text("com_s7_10"),
						param : boss_s7_95_spell,
						diff : 1
					},
				]
			},
		]
	},
	{
		title : "PLAYER DATA",
		description : get_text("menu_player"),
		action : MENU_MENU,
		param : []
		//set below
	},
	{
		title : "REPLAY",
		description : get_text("menu_replay"),
		action : MENU_MENU,
		param :
		[
			
		]
	},
	{
		title : "OPTION",
		description : get_text("menu_option"),
		action : MENU_MENU,
		param :
		[
			{
				title : get_text("menu_fullscreen"),
				action : MENU_MAKE_SOUND
			},
			{
				title : get_text("menu_sfx_volume"),
				action : MENU_NOTHING
			},
			{
				title : get_text("menu_bgm_volume"),
				action : MENU_NOTHING,
			},
			{
				title : get_text("menu_controle"),
				action : MENU_MENU,
				param : 
				[
					{
						title : get_text("menu_shoot"),
						action : MENU_MAKE_SOUND
					},
					{
						title : get_text("menu_focus"),
						action : MENU_MAKE_SOUND
					},
					{
						title : get_text("menu_bomb"),
						action : MENU_MAKE_SOUND
					},
					{
						title : get_text("menu_pause"),
						action : MENU_MAKE_SOUND
					},
					{
						title : get_text("menu_default"),
						action : MENU_MAKE_SOUND
					},
					{
						title : get_text("menu_back"),
						action : MENU_BACK
					}
				]
			},
			{
				title : rng_unlock ? get_text("menu_rng") : get_text("menu_rng_lock"),
				action : rng_unlock ? MENU_MAKE_SOUND : MENU_INVALID
			}
		]
	},
	{
		title : "MUSIC ROOM",
		description : get_text("menu_music"),
		action : MENU_MENU,
		param :
		[
			{
				title : get_text("mus_room_title"),
				comment : get_text("mus_com_title"),
				action : MENU_MUSIC,
				music : mus_title,
			},
			{
				title : get_text("mus_room_s1"),
				comment : get_text("mus_com_s1"),
				action : MENU_MUSIC,
				music : mus_stage1,
			},
			{
				title : get_text("mus_room_b1"),
				comment : get_text("mus_com_b1"),
				action : MENU_MUSIC,
				music : mus_boss1,
			},
			{
				title : get_text("mus_room_s2"),
				comment : get_text("mus_com_s2"),
				action : MENU_MUSIC,
				music : mus_stage2,
			},
			{
				title : get_text("mus_room_b2"),
				comment : get_text("mus_com_b2"),
				action : MENU_MUSIC,
				music : mus_boss2,
			},
			{
				title : get_text("mus_room_s3"),
				comment : get_text("mus_com_s3"),
				action : MENU_MUSIC,
				music : mus_stage3,
			},
			{
				title : get_text("mus_room_b3"),
				comment : get_text("mus_com_b3"),
				action : MENU_MUSIC,
				music : mus_boss3,
			},
			{
				title : get_text("mus_room_s4"),
				comment : get_text("mus_com_s4"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_b4"),
				comment : get_text("mus_com_b4"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_s5"),
				comment : get_text("mus_com_s5"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_b5"),
				comment : get_text("mus_com_b5"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_s6"),
				comment : get_text("mus_com_s6"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_b6"),
				comment : get_text("mus_com_b6"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_s7"),
				comment : get_text("mus_com_s7"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_b7"),
				comment : get_text("mus_com_b7"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_end"),
				comment : get_text("mus_com_end"),
				action : MENU_MUSIC,
				music : noone,
			},
			{
				title : get_text("mus_room_score"),
				comment : get_text("mus_com_score"),
				action : MENU_MUSIC,
				music : mus_score,
			},
		]
	},
	{
		title : "MANUAL",
		description : get_text("menu_manual"),
		action : MENU_MENU,
		param :
		[
			{
				title : get_text("menu_manual_howtoplay"),
				action : MENU_NOTHING
			},
			{
				title : get_text("menu_manual_controle"),
				action : MENU_NOTHING
			},
			{
				title : get_text("menu_manual_story"),
				action : MENU_NOTHING
			},
			{
				title : get_text("menu_manual_item"),
				action : MENU_NOTHING
			},
			{
				title : get_text("menu_manual_scoring"),
				action : MENU_NOTHING
			},
		]
	},
	{
		title : "CREDIT",
		description : get_text("menu_credit"),
		action : is_extra_valid ? MENU_MENU : MENU_INVALID,
		param : 
		[
			{
				action : MENU_NOTHING
			}
		]
	},
	{
		title : "QUIT",
		description : get_text("menu_quit"),
		action : MENU_QUIT
	}
]



//high scores
for ( var i = 0 ; i < 10; i += 1) // score nbr
{
	menu[4].param[i] = {};
	variable_struct_set(menu[4].param[i],"action",MENU_NOTHING);
	
	for ( var j = 0; j < array_length(global.score_name); j += 1)
	{
		variable_struct_set(menu[4].param[i],global.score_name[j],add_zero(data_read("Data.ini",global.score_name[j],i),global.score_lenght));
		
		var txt = string(data_read_string("Data.ini",global.score_name[j] + "_name",i));
		txt = txt == "0" ? "-------" : txt;
		variable_struct_set(menu[4].param[i],global.score_name[j] + "_name",txt);
	}
}

// replay
var rep = 5;
for(var i = 0; i < 20; i += 1)
{
	var replay_check = "Replay" + string(i) +".txt";

	menu[rep].param[i] = {}

	if(file_exists(replay_check))
	{
		menu[rep].param[i].nom = get_text_file("name",replay_check);
		menu[rep].param[i].date = get_text_file("date",replay_check);
		menu[rep].param[i].hour = get_text_file("hour",replay_check);
		switch(get_text_file("player",replay_check))
		{
			case P_REIMU:
				var plr = "Reimu";
			break;
			case P_MARISA:
				var plr = "Marisa";
			break;
			case P_SANAE:
				var plr = "Sanae";
			break;
		}
		menu[rep].param[i].player = plr;
	
		var is_extra = false;
		
		switch(get_text_file("game_type",replay_check))
		{
			case GAME_EXTRA:	
				var is_extra = true;
			case GAME_FULL:
				var type = "All";
			break;
			case GAME_STAGE:	
				var type = "Stage Practice";
			break;
			case GAME_SPELL:	
				var type = "Spell Practice";
			break;
		}
		
		type += get_text_file("rng",replay_check) ? "-RNG" : "";
		
		menu[rep].param[i].game_type = type;
		
		switch(get_text_file("difficulty",replay_check))
		{
			case 0:
				var diff = "Easy";
			break;
			case 1:
				var arr = get_replay(REPLAY_EVENT,replay_check,0);
				if(arr[0] != act_s7_0)
				{
					var diff = "Normal";
				}
				else
				{
					var diff = "Extra";
				}
			break;
			case 2:
				var diff = "Hard";
			break;
			case 3:
				var diff = "Lunatic";
			break;
		}
		menu[rep].param[i].difficulty = diff;
		
		var stage = get_replay(REPLAY_STAGE_NBR,replay_check,0);
		
		if(stage == 1)
		{
			if(get_text_file("game_type",replay_check) != GAME_EXTRA)
			{
				menu[rep].param[i].action = MENU_PLAY_REPLAY;
			}
			else
			{
				menu[rep].param[i].action = MENU_MENU;
				menu[rep].param[i].param = 
				[
					{
						title : "StageEx",
						action : MENU_PLAY_REPLAY,
						scr : add_zero(real(get_text_file("score2",replay_check)),global.score_lenght)
					}
				];
			}
		}
		else
		{
			menu[rep].param[i].action = MENU_MENU;
			menu[rep].param[i].param = [];
			for(var j = 0; j < 6; j += 1)
			{
				if(j + 1 <= stage)
				{
					menu[rep].param[i].param[j] = 
					{
						title : "Stage " + string(j + 1),
						action : MENU_PLAY_REPLAY,
						scr : add_zero(real(get_text_file("score" + string(j + 2),replay_check)),global.score_lenght)
					};
				}
				else
				{
					menu[rep].param[i].param[j] = 
					{
						title : "Stage " + string(j + 1),
						action : MENU_INVALID,
						scr : add_zero("0",global.score_lenght)
					};
				}
			}
		}
	}
	else
	{
		menu[rep].param[i].nom = "-------";
		menu[rep].param[i].date = "00/00/00";
		menu[rep].param[i].hour = "00:00";
		menu[rep].param[i].player = "------";
		menu[rep].param[i].difficulty = "-------"
		menu[rep].param[i].game_type = "-----------------";
		menu[rep].param[i].action = MENU_NOTHING;
	}
}




score_difficulty = 0;

menu_description_alpha = 0;

cursor_lockout = 2;

over_offset = 26;


difficuly = [{},{},{},{},{}]

for(var i = 0; i < 5; i += 1)
{
	if(i < 4)
	{
		var xpos = 450 + i * 30;
		var ypos = 100 + i * 110;
	}
	else
	{
		var xpos = 480;
		var ypos = 270;
	}
	
	variable_struct_set(difficuly[i],"x_pos",xpos);
	variable_struct_set(difficuly[i],"y_pos",ypos);
	variable_struct_set(difficuly[i],"x_is",xpos);
	variable_struct_set(difficuly[i],"x_to",xpos);
	variable_struct_set(difficuly[i],"y_is",ypos);
	variable_struct_set(difficuly[i],"y_to",ypos);
}


player_center = 285;
player = []

for(var i = P_REIMU; i <= P_SANAE; i += 1)
{
	player[i] = {};
	variable_struct_set(player[i],"alpha",i == global.player_chosen);
	variable_struct_set(player[i],"alpha_to",i == global.player_chosen);
	variable_struct_set(player[i],"x_is",player_center);
	variable_struct_set(player[i],"x_to",player_center);
}




//setting active_offset for everything
for(var i = 0; i < array_length(menu); i += 1)
{
	variable_struct_set(menu[i],"active_offset",0);
	
	if(variable_struct_get(menu[i],"action") == MENU_MENU)
	{
		for(var j = 0; j < array_length(menu[i].param); j+= 1)
		{
			variable_struct_set(menu[i].param[j],"active_offset",0);
			
			if(variable_struct_get(menu[i].param[j],"action") == MENU_MENU)
			{
				for(var k = 0; k < array_length(menu[i].param[j].param); k+= 1)
				{
					variable_struct_set(menu[i].param[j].param[k],"active_offset",0);
				}
			}
		}
	}
	
	
}

//settings things for spell practice
for(var i = 0; i < array_length(menu[3].param); i += 1)//stage 
{
	var cap = 0;
	for(var j = array_length(menu[3].param[i].param) - 1; j >= 0 ; j -= 1)//spell
	{
		var extra_is = (i == 6);
		
		if(j % (1 + !extra_is * 3) == !extra_is * 3)
		{
			cap = 0;	
		}
		
		var check = menu[3].param[i].param[j];
		
		
		var capgame = data_read("SpellData.ini",check.data_name,get_difficulty_key(0,check.diff));
		variable_struct_set(check,"cap_game",capgame);
		
		var trygame = data_read("SpellData.ini",check.data_name,get_difficulty_key(1,check.diff));
		variable_struct_set(check,"try_game",trygame);
		
		var capprac = data_read("SpellDataPractice.ini",check.data_name,get_difficulty_key(0,check.diff));
		variable_struct_set(check,"cap_prac",capprac);
		
		variable_struct_set(check,"try_prac",data_read("SpellDataPractice.ini",check.data_name,get_difficulty_key(1,check.diff)));
		
		cap += capgame + capprac;
		
		
		variable_struct_set(check,"action",MENU_SPELL);
			
		if(cap > 0)
		{
			if(!variable_struct_exists(check,"comment"))
			{
				variable_struct_set(check,"comment","No comment");
			}
		}
		else
		{
			if(extra_is)
			{
				variable_struct_set(check,"comment",get_text("menu_lock_comment_extra"));
			}
			else
			{
				variable_struct_set(check,"comment",get_text("menu_lock_comment"));
			}
		}
		
		
		if (extra_is) and (trygame == 0)
		{
			variable_struct_set(check,"action",MENU_INVALID);
			
			variable_struct_set(check,"title","????????????");
			variable_struct_set(check,"comment","???");
		}
	}
}

// locking musics
lock_name = "??????????";
for(var i = 1; i < array_length(menu[7].param) ; i += 1)
{
	if(!data_read("Data.ini","music",menu[7].param[i].music))
	{
		menu[7].param[i].title = lock_name
		menu[7].param[i].comment = get_text("menu_music_lock");
	}
}

music_lock_listen = 0;

//create bubbles
for(var y_bubble = 300; y_bubble > 0; y_bubble -= 50)
{
	instance_create_depth(80 - 100 + rng(200,false,6),y_bubble - rng(60,false,3),depth + 1,obj_bubble_main);
}


step = 0;