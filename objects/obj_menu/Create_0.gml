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
				]
			},
			{
				title : "Stage 4",
				action : MENU_MENU,
				param : 
				[
				
				]
			},
			{
				title : "Stage 5",
				action : MENU_MENU,
				param : 
				[
				
				]
			},
			{
				title : "Stage 6",
				action : MENU_MENU,
				param : 
				[
				
				]
			},
			{
				title : "Extra Stage",
				action : MENU_MENU,
				param : 
				[
				
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