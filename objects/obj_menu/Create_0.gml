/// @description Insert description here
// You can write your code in this editor

ds_list_clear(global.event_list);
ds_list_clear(global.wait_list);

cursor = [0,0,0,0];
level = 0;

menu = 
[
	{
		title : "START",
		active_offset : 0,
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
		active_offset : 0,
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
		active_offset : 0,
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
		active_offset : 0,
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
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s1_6_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s1_mida"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s1_6_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s1_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s1_6_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s1_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s1_6_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s1_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s1_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s1_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s1_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s1_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s1_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s1_1c"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s1_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s1_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s1_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s1_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s1_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s1_2b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s1_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s1_2b"),
						active_offset : 0,
						action : MENU_SPELL,
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
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s2_6_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s2_mida"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s2_6_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s2_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s2_6_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s2_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s2_6_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s2_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s2_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_2b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_2b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s2_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_5_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_5_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s2_5_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_3b"),
						active_offset : 0,
						action : MENU_SPELL,
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
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s3_7_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s3_mida"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s3_7_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s3_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s3_7_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s3_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s3_7_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s3_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s3_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_2b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_2c"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s3_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s3_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s3_3b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s3_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s3_3b"),
						active_offset : 0,
						action : MENU_SPELL,
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
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s4_5_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s4_mida"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s4_5_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s4_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s4_5_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s4_midb"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s4_5_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s4_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_2b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_2c"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_3b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_3b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4r"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7r_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4r"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7r_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4r"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7r_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4r"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7r_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4m"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7m_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4m"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7m_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4m"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7m_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4m"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7m_spell,
						diff : 3
					},
					{
						title : get_text("spell_s4_4s"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7s_spell,
						diff : 0
					},
					{
						title : get_text("spell_s4_4s"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7s_spell,
						diff : 1
					},
					{
						title : get_text("spell_s4_4s"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s4_7s_spell,
						diff : 2
					},
					{
						title : get_text("spell_s4_4s"),
						active_offset : 0,
						action : MENU_SPELL,
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
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_1c"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_2b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_2c"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_3b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_3b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s5_4a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_7_spell,
						diff : 0
					},
					{
						title : get_text("spell_s5_4a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_7_spell,
						diff : 1
					},
					{
						title : get_text("spell_s5_4b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s5_7_spell,
						diff : 2
					},
					{
						title : get_text("spell_s5_4b"),
						active_offset : 0,
						action : MENU_SPELL,
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
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s6_5_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_mid"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s6_5_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_mid"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s6_5_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_mid"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s6_5_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_1a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_1b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_2a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_2b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_2c"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_6_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_3a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_6_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_3b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_6_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_3c"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_6_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_4a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_8_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_4a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_8_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_4b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_8_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_4b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_8_spell,
						diff : 3
					},
					{
						title : get_text("spell_s6_5a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_9_spell,
						diff : 0
					},
					{
						title : get_text("spell_s6_5a"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_9_spell,
						diff : 1
					},
					{
						title : get_text("spell_s6_5b"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s6_9_spell,
						diff : 2
					},
					{
						title : get_text("spell_s6_5b"),
						active_offset : 0,
						action : MENU_SPELL,
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
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s7_51_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_mid2"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s7_52_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_mid3"),
						active_offset : 0,
						action : MENU_SPELL,
						param : act_s7_53_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_1"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_15_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_2"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_25_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_3"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_35_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_4"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_45_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_5"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_55_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_6"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_65_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_7"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_75_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_8"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_85_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_9"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_9_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_10"),
						active_offset : 0,
						action : MENU_SPELL,
						param : boss_s7_95_spell,
						diff : 1
					},
				]
			},
		]
	},
	{
		title : "PLAYER DATA",
		active_offset : 0,
	},
	{
		title : "REPLAY",
		active_offset : 0,
	},
	{
		title : "OPTION",
		active_offset : 0,
	},
	{
		title : "QUIT",
		active_offset : 0,
		action : MENU_QUIT
	}
]

cursor_lockout = 0;

over_offset = 26;



difficuly =
[
	{
		x_is : 0,
		x_to : 0,
		y_is : 0,
		y_to : 0,
		scale : 1,
		scale_to : 1,
		alpha : 1,
		alpha_to : 1 
	},
	{
		x_is : 0,
		x_to : 0,
		y_is : 0,
		y_to : 0,
		scale : 1,
		scale_to : 1,
		alpha : 1,
		alpha_to : 1 
	},
	{
		x_is : 0,
		x_to : 0,
		y_is : 0,
		y_to : 0,
		scale : 1,
		scale_to : 1,
		alpha : 1,
		alpha_to : 1 
	},
	{
		x_is : 0,
		x_to : 0,
		y_is : 0,
		y_to : 0,
		scale : 1,
		scale_to : 1,
		alpha : 1,
		alpha_to : 1 
	},
	{
		x_is : 0,
		x_to : 0,
		y_is : 0,
		y_to : 0,
		scale : 1,
		scale_to : 1,
		alpha : 1,
		alpha_to : 1 
	}
]


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



//create bubble

for(var y_bubble = 300; y_bubble > 0; y_bubble -= 50)
{
	instance_create_depth(80 - 100 + rng(200,false,6),y_bubble - rng(60,false,3),depth + 1,obj_bubble_main);
}


step = 0;