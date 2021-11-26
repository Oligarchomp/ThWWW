/// @description Insert description here
// You can write your code in this editor

cursor = [0,0,0,0];
level = 0;

menu = 
[
	{
		title : "START",
		action : MENU_MENU,
		param :
		[
			{
			title : "difficulty(dummy)",
			action : MENU_MENU,
			param :
			[
				{
				title : "player(dummy)",
				action : MENU_START,
				}
			]
			}
		]
	},
	{
		title : "EXTRA START"
	},
	{
		title : "PRACTICE"
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