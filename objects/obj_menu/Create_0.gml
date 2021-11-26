/// @description Insert description here
// You can write your code in this editor

cursor = [0,0,0,0];
level = 0;

menu = 
[
	{
		title : "START",
		action : MENU_MENU,
		lockout : 10,
		param :
		[
			{//difficulty
			action : MENU_MENU,
			lockout : 10,
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
		action : MENU_MENU,
		lockout : 10,
		param :
		[
			{//difficulty
			action : MENU_MENU,
			lockout : 10,
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
		action : MENU_MENU,
		lockout : 10,
		param :
		[
			{//difficulty
			action : MENU_MENU,
			lockout : 10,
			param :
			[
				{//player
				action : MENU_MENU,
				lockout : 10,
				param : 
				[
					{
						title : "STAGE 1",
						action : MENU_START_STAGE,
						param : 1
					},
					{
						title : "STAGE 2",
						action : MENU_START_STAGE,
						param : 2
					},
					{
						title : "STAGE 3",
						action : MENU_START_STAGE,
						param : 3
					},
					{
						title : "STAGE 4",
						action : MENU_START_STAGE,
						param : 4
					},
					{
						title : "STAGE 5",
						action : MENU_START_STAGE,
						param : 5
					},
					{
						title : "STAGE 6",
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
		title : "SPELL PRACTICE"
	},
	{
		title : "PLAYER DATA"
	},
	{
		title : "REPLAY"
	},
	{
		title : "OPTION"
	},
	{
		title : "QUIT",
		action : MENU_QUIT
	}
]


cursor_lockout = 0;