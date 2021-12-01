/// @description Insert description here
// You can write your code in this editor

instance_create_depth(0,0,0,obj_score_fadein);

state = 0;

global.name_entry = "";

var dif = ["e","n","h","l","ex"];
var plr = ["r","m","s"];

var true_dif = global.game_type = GAME_FULL ? global.difficulty : 4;

index = dif[true_dif] + plr[global.player_chosen];

scores = []
names = [];
for (var i = 0; i < 10; i += 1)
{
	scores[i] = add_zero(data_read("Data.ini",index,i),global.score_lenght);	
	var name = data_read_string("Data.ini",index + "_name",i);
	names[i] = name == "0" ? "-------" : name;
}

score_pos = 0;
while (score_pos < array_length(scores)) and (scores[score_pos] > global.score)
{
	score_pos += 1;
}

if(score_pos < 10)
{
	for(var j = array_length(scores) - 1; j > score_pos; j -= 1)
	{
		scores[j] = scores[j - 1];	
		names[j] = names[j - 1];
	}

	scores[score_pos] = add_zero(global.score,global.score_lenght);
	names[score_pos] = global.name_entry;

	instance_create_depth(x + 30,y + 320,depth - 1,obj_name_entry);
}
else
{
	state = 1;
}


menu_alpha = 0;
cursor = 1;
cursor_lockout = 0;

menu =
[
	{
		title : get_text("pause_yes"),
		action : MENU_REPLAY
	},
	{
		title : get_text("pause_no"),
		action : MENU_TITLE
	}
]

