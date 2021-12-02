/// @description Insert description here
// You can write your code in this editor

menu = [];


for(var i = 0; i < 20; i += 1)
{
	var check = "Replay" + string(i);
	
	if(file_exists(check))
	{
		menu[i] = {}
	
		menu[i].nom = get_text_file("name",check);
		menu[i].date = get_text_file("date",check);
		menu[i].hour = get_text_file("hour",check);
		switch(get_text_file("player",check))
		{
			case "0":
				var plr = "Reimu ";
			break;
			case "1":
				var plr = "Marisa";
			break;
			case "2":
				var plr = "Sanae ";
			break;
		}
		menu[i].player = plr;
	
		var is_extra = false;
		
		switch(get_text_file("game_type",check))
		{
			case "2":	
				var is_extra = true;
			case "0":
				var type = "All";
			break;
			case "1":	
				var type = "Stg";
			break;
			case "3":	
				var type = "Spl";
			break;
		}
		menu[i].game_type = type;
		
		
		switch(get_text_file("difficulty",check))
		{
			case "0":
				var diff = "Easy   ";
			break;
			case "1":
				if(!is_extra)
				{
					var diff = "Normal  ";
				}
				else
				{
					var diff = "Extra  ";
				}
			break;
			case "2":
				var diff = "Hard   ";
			break;
			case "3":
				var diff = "Lunatic";
			break;
		}
		menu[i].difficulty = plr;
	}
	else
	{
		menu[i].nom = "-------";
		menu[i].date = "--/--/--";
		menu[i].hour = "--:--";
		menu[i].player = "------";
		menu[i].difficulty = "-------"
		menu[i].game_type = "---";
	}
}