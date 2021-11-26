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


//create bubble

for(var y_bubble = 300; y_bubble > 0; y_bubble -= 30)
{
	instance_create_depth(80 - 100 + rng(200,false,6),y_bubble - rng(60,false,3),depth + 1,obj_bubble_main);
}


step = 0;