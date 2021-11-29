/// @description Insert description here
// You can write your code in this editor

ds_list_clear(global.event_list);
ds_list_clear(global.wait_list);


hold_direction_time = 0;


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
		action : MENU_MENU,
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
		action : MENU_MENU,
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
						action : MENU_START_STAGE,
						param : 1
					},
					{
						title : "Stage 2",
						action : MENU_START_STAGE,
						param : 2
					},
					{
						title : "Stage 3",
						active_offset : 0,
						action : MENU_START_STAGE,
						param : 3
					},
					{
						title : "Stage 4",
						action : MENU_START_STAGE,
						param : 4
					},
					{
						title : "Stage 5",
						action : MENU_START_STAGE,
						param : 5
					},
					{
						title : "Stage 6",
						action : MENU_START_STAGE,
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
		action: MENU_MENU,
		param : 
		[
			{
				title : "Stage 1",
				action : MENU_MENU,
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
				action : MENU_MENU,
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
				action : MENU_MENU,
				bg : act_s3_0,
				param : 
				[
					{
						title : get_text("spell_s3_mida"),
						data_name : "s3_mid",
						param : act_s3_7_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s3_mida"),
						data_name : "s3_mid",
						param : act_s3_7_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s3_midb"),
						data_name : "s3_mid",
						param : act_s3_7_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s3_midb"),
						data_name : "s3_mid",
						param : act_s3_7_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s3_1a"),
						data_name : "s3_1",
						param : boss_s3_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_1a"),
						data_name : "s3_1",
						param : boss_s3_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_1b"),
						data_name : "s3_1",
						param : boss_s3_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_1b"),
						data_name : "s3_1",
						param : boss_s3_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s3_2a"),
						data_name : "s3_2",
						param : boss_s3_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_2a"),
						data_name : "s3_2",
						param : boss_s3_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_2b"),
						data_name : "s3_2",
						param : boss_s3_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_2b"),
						data_name : "s3_2",
						param : boss_s3_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s3_3a"),
						data_name : "s3_3",
						param : boss_s3_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_3a"),
						data_name : "s3_3",
						param : boss_s3_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_3b"),
						data_name : "s3_3",
						param : boss_s3_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_3b"),
						data_name : "s3_3",
						param : boss_s3_6_spell,
						diff : 3
					},
				]
			},
			{
				title : "Stage 4",
				action : MENU_MENU,
				bg : act_s4_0,
				param : 
				[
					{
						title : get_text("spell_s4_mida"),
						data_name : "s4_mid",
						param : act_s4_5_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s4_mida"),
						data_name : "s4_mid",
						param : act_s4_5_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s4_midb"),
						data_name : "s4_mid",
						param : act_s4_5_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s4_midb"),
						data_name : "s4_mid",
						param : act_s4_5_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s4_1a"),
						data_name : "s4_1",
						param : boss_s4_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_1a"),
						data_name : "s4_1",
						param : boss_s4_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_1b"),
						data_name : "s4_1",
						param : boss_s4_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_1b"),
						data_name : "s4_1",
						param : boss_s4_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_2a"),
						data_name : "s4_2",
						param : boss_s4_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_2a"),
						data_name : "s4_2",
						param : boss_s4_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_2b"),
						data_name : "s4_2",
						param : boss_s4_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_2c"),
						data_name : "s4_2",
						param : boss_s4_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_3a"),
						data_name : "s4_3",
						param : boss_s4_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_3a"),
						data_name : "s4_3",
						param : boss_s4_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_3b"),
						data_name : "s4_3",
						param : boss_s4_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_3b"),
						data_name : "s4_3",
						param : boss_s4_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						param : boss_s4_7r_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						param : boss_s4_7r_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						param : boss_s4_7r_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4r"),
						data_name : "s4_4r",
						param : boss_s4_7r_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						param : boss_s4_7m_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						param : boss_s4_7m_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						param : boss_s4_7m_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4m"),
						data_name : "s4_4m",
						param : boss_s4_7m_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						param : boss_s4_7s_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						param : boss_s4_7s_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						param : boss_s4_7s_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4s"),
						data_name : "s4_4s",
						param : boss_s4_7s_spell,
						diff : 3
					},
				]
			},
			{
				title : "Stage 5",
				action : MENU_MENU,
				bg : act_s5_0,
				param : 
				[
					{
						title : get_text("spell_s5_1a"),
						data_name : "s5_1",
						param : boss_s5_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_1a"),
						data_name : "s5_1",
						param : boss_s5_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_1b"),
						data_name : "s5_1",
						param : boss_s5_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_1c"),
						data_name : "s5_1",
						param : boss_s5_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_2a"),
						data_name : "s5_2",
						param : boss_s5_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_2a"),
						data_name : "s5_2",
						param : boss_s5_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_2b"),
						data_name : "s5_2",
						param : boss_s5_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_2c"),
						data_name : "s5_2",
						param : boss_s5_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_3a"),
						data_name : "s5_3",
						param : boss_s5_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_3a"),
						data_name : "s5_3",
						param : boss_s5_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_3b"),
						data_name : "s5_3",
						param : boss_s5_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_3b"),
						data_name : "s5_3",
						param : boss_s5_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_4a"),
						data_name : "s5_4",
						param : boss_s5_7_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_4a"),
						data_name : "s5_4",
						param : boss_s5_7_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_4b"),
						data_name : "s5_4",
						param : boss_s5_7_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_4b"),
						data_name : "s5_4",
						param : boss_s5_7_spell,
						diff : 3
					},
				]
			},
			{
				title : "Stage 6",
				action : MENU_MENU,
				bg : act_s6_0,
				param : 
				[
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						param : act_s6_5_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						param : act_s6_5_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						param : act_s6_5_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_mid"),
						data_name : "s6_mid",
						param : act_s6_5_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_1a"),
						data_name : "s6_1",
						param : boss_s6_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_1a"),
						data_name : "s6_1",
						param : boss_s6_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_1b"),
						data_name : "s6_1",
						param : boss_s6_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_1b"),
						data_name : "s6_1",
						param : boss_s6_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_2a"),
						data_name : "s6_2",
						param : boss_s6_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_2a"),
						data_name : "s6_2",
						param : boss_s6_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_2b"),
						data_name : "s6_2",
						param : boss_s6_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_2c"),
						data_name : "s6_2",
						param : boss_s6_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_3a"),
						data_name : "s6_3",
						param : boss_s6_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_3a"),
						data_name : "s6_3",
						param : boss_s6_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_3b"),
						data_name : "s6_3",
						param : boss_s6_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_3c"),
						data_name : "s6_3",
						param : boss_s6_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_4a"),
						data_name : "s6_4",
						param : boss_s6_8_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_4a"),
						data_name : "s6_4",
						param : boss_s6_8_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_4b"),
						data_name : "s6_4",
						param : boss_s6_8_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_4b"),
						data_name : "s6_4",
						param : boss_s6_8_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_5a"),
						data_name : "s6_5",
						param : boss_s6_9_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_5a"),
						data_name : "s6_5",
						param : boss_s6_9_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_5b"),
						data_name : "s6_5",
						param : boss_s6_9_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_5b"),
						data_name : "s6_5",
						param : boss_s6_9_spell,
						diff : 3
					},
				]
			},
			{
				title : "Extra Stage",
				action : MENU_MENU,
				bg : act_s7_0,
				param : 
				[
					{
						title : get_text("spell_s7_mid1"),
						data_name : "s7_mid1",
						param : act_s7_51_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_mid2"),
						data_name : "s7_mid2",
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
						param : boss_s7_65_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_7"),
						data_name : "s7_7",
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
		param : 
		[
			{},{},{},{},{},{},{},{},{},{}
		]
		//set below
	},
	{
		title : "REPLAY",
		description : get_text("menu_replay"),
	},
	{
		title : "OPTION",
		description : get_text("menu_option"),
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
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_s1"),
				comment : get_text("mus_com_s1"),
				action : MENU_MUSIC,
				music : mus_stage1,
				intro : noone
			},
			{
				title : get_text("mus_room_b1"),
				comment : get_text("mus_com_b1"),
				action : MENU_MUSIC,
				music : mus_boss1,
				intro : mus_boss1_intro
			},
			{
				title : get_text("mus_room_s2"),
				comment : get_text("mus_com_s2"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_b2"),
				comment : get_text("mus_com_b2"),
				action : MENU_MUSIC,
				music : mus_boss2,
				intro : mus_boss2_intro
			},
			{
				title : get_text("mus_room_s3"),
				comment : get_text("mus_com_s3"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_b3"),
				comment : get_text("mus_com_b3"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_s4"),
				comment : get_text("mus_com_s4"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_b4"),
				comment : get_text("mus_com_b4"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_s5"),
				comment : get_text("mus_com_s5"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_b5"),
				comment : get_text("mus_com_b5"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_s6"),
				comment : get_text("mus_com_s6"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_b6"),
				comment : get_text("mus_com_b6"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_s3"),
				comment : get_text("mus_com_s3"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_b7"),
				comment : get_text("mus_com_b7"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_end"),
				comment : get_text("mus_com_end"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_credit"),
				comment : get_text("mus_com_credit"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
			{
				title : get_text("mus_room_score"),
				comment : get_text("mus_com_score"),
				action : MENU_MUSIC,
				music : noone,
				intro : noone
			},
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
	variable_struct_set(menu[4].param[i],"action",MENU_NOTHING);
	
	for ( var j = 0; j < array_length(global.score_name); j += 1)
	{
		variable_struct_set(menu[4].param[i],global.score_name[j],add_zero(data_read("Data.ini",global.score_name[j],i),12));
		
		var txt = string(data_read_string("Data.ini",global.score_name[j] + "_name",i));
		txt = txt == "0" ? "NO NAME" : txt;
		variable_struct_set(menu[4].param[i],global.score_name[j] + "_name",txt);
	}
}

score_difficulty = 0;

menu_description_alpha = 0;

cursor_lockout = 0;

over_offset = 26;


difficuly = [{},{},{},{},{}]

for(var i = 0; i < 5; i += 1)
{
	variable_struct_set(difficuly[i],"x_is",0);
	variable_struct_set(difficuly[i],"x_to",0);
	variable_struct_set(difficuly[i],"y_is",0);
	variable_struct_set(difficuly[i],"y_to",0);
	variable_struct_set(difficuly[i],"scale",0);
	variable_struct_set(difficuly[i],"scale_to",0);
	variable_struct_set(difficuly[i],"alpha",0);
	variable_struct_set(difficuly[i],"alpha_to",0);
}


player =
[
	{
		alpha : 1,
		alpha_to : 1,
		x_is : 700,
		x_to : 700
	},
	{
		alpha : 1,
		alpha_to : 1,
		x_is : 700,
		x_to : 700
	},
	{
		alpha : 1,
		alpha_to : 1,
		x_is : 700,
		x_to : 700
	}
]




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
	for(var j = 0; j < array_length(menu[3].param[i].param); j += 1)//spell
	{
		var check = menu[3].param[i].param[j];
		variable_struct_set(check,"action",MENU_SPELL);
		variable_struct_set(check,"cap_game",data_read("SpellData.ini",check.data_name,get_difficulty_key(0,check.diff)));
		variable_struct_set(check,"try_game",data_read("SpellData.ini",check.data_name,get_difficulty_key(1,check.diff)));
		variable_struct_set(check,"cap_prac",data_read("SpellDataPractice.ini",check.data_name,get_difficulty_key(0,check.diff)));
		variable_struct_set(check,"try_prac",data_read("SpellDataPractice.ini",check.data_name,get_difficulty_key(1,check.diff)));
		
		if(!variable_struct_exists(check,"comment"))
		{
			variable_struct_set(check,"comment","No comment");
		}
	}
}





//create bubbles
for(var y_bubble = 300; y_bubble > 0; y_bubble -= 50)
{
	instance_create_depth(80 - 100 + rng(200,false,6),y_bubble - rng(60,false,3),depth + 1,obj_bubble_main);
}


step = 0;