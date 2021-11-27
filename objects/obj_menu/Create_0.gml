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
						data_name : "s1_mid",
						param : act_s1_6_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s1_mida"),
						data_name : "s1_mid",
						param : act_s1_6_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s1_midb"),
						data_name : "s1_mid",
						param : act_s1_6_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s1_midb"),
						data_name : "s1_mid",
						param : act_s1_6_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s1_1a"),
						data_name : "s1_1",
						param : boss_s1_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s1_1a"),
						data_name : "s1_1",
						param : boss_s1_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s1_1b"),
						data_name : "s1_1",
						param : boss_s1_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s1_1c"),
						data_name : "s1_1",
						param : boss_s1_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s1_2a"),
						data_name : "s1_2",
						param : boss_s1_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s1_2a"),
						data_name : "s1_2",
						param : boss_s1_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s1_2b"),
						data_name : "s1_2",
						param : boss_s1_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s1_2b"),
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
						param : act_s2_6_midspell,
						diff : 0
					},
					{
						title : get_text("spell_s2_mida"),
						data_name : "s2_mid",
						param : act_s2_6_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s2_midb"),
						data_name : "s2_mid",
						param : act_s2_6_midspell,
						diff : 2
					},
					{
						title : get_text("spell_s2_midb"),
						data_name : "s2_mid",
						param : act_s2_6_midspell,
						diff : 3
					},
					{
						title : get_text("spell_s2_1a"),
						data_name : "s2_1",
						param : boss_s2_2_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_1a"),
						data_name : "s2_1",
						param : boss_s2_2_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_1b"),
						data_name : "s2_1",
						param : boss_s2_2_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_1b"),
						data_name : "s2_1",
						param : boss_s2_2_spell,
						diff : 3
					},
					{
						title : get_text("spell_s2_2a"),
						data_name : "s2_2",
						param : boss_s2_4_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_2a"),
						data_name : "s2_2",
						param : boss_s2_4_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_2b"),
						data_name : "s2_2",
						param : boss_s2_4_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_2b"),
						data_name : "s2_2",
						param : boss_s2_4_spell,
						diff : 3
					},
					{
						title : get_text("spell_s2_3a"),
						data_name : "s2_3",
						param : boss_s2_5_spell,
						diff : 0
					},
					{
						title : get_text("spell_s2_3a"),
						data_name : "s2_3",
						param : boss_s2_5_spell,
						diff : 1
					},
					{
						title : get_text("spell_s2_3a"),
						data_name : "s2_3",
						param : boss_s2_5_spell,
						diff : 2
					},
					{
						title : get_text("spell_s2_3b"),
						data_name : "s2_3",
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
						title : get_text("spell_s3_2c"),
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
						param : act_s7_53_midspell,
						diff : 1
					},
					{
						title : get_text("spell_s7_1"),
						data_name : "s7_1",
						param : boss_s7_15_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_2"),
						data_name : "s7_2",
						param : boss_s7_25_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_3"),
						data_name : "s7_3",
						param : boss_s7_35_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_4"),
						data_name : "s7_4",
						param : boss_s7_45_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_5"),
						data_name : "s7_5",
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
						param : boss_s7_85_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_9"),
						data_name : "s7_9",
						param : boss_s7_9_spell,
						diff : 1
					},
					{
						title : get_text("spell_s7_10"),
						data_name : "s7_10",
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
for(var i = 0; i < array_length(menu[3].param); i += 1)//stage 
{
	for(var j = 0; j < array_length(menu[3].param[i].param); j += 1)//spell
	{
		variable_struct_set(menu[3].param[i].param[j],"action",MENU_SPELL);
		variable_struct_set(menu[3].param[i].param[j],"active_offset",0);
		variable_struct_set(menu[3].param[i].param[j],"cap_game",data_read("SpellData.ini",menu[3].param[i].param[j].data_name,get_difficulty_key(0,menu[3].param[i].param[j].diff)));
		variable_struct_set(menu[3].param[i].param[j],"try_game",data_read("SpellData.ini",menu[3].param[i].param[j].data_name,get_difficulty_key(1,menu[3].param[i].param[j].diff)));
		variable_struct_set(menu[3].param[i].param[j],"cap_prac",data_read("SpellDataPractice.ini",menu[3].param[i].param[j].data_name,get_difficulty_key(0,menu[3].param[i].param[j].diff)));
		variable_struct_set(menu[3].param[i].param[j],"try_prac",data_read("SpellDataPractice.ini",menu[3].param[i].param[j].data_name,get_difficulty_key(1,menu[3].param[i].param[j].diff)));
	}
}

//create bubble

for(var y_bubble = 300; y_bubble > 0; y_bubble -= 50)
{
	instance_create_depth(80 - 100 + rng(200,false,6),y_bubble - rng(60,false,3),depth + 1,obj_bubble_main);
}


step = 0;