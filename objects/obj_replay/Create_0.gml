/// @description Insert description here
// You can write your code in this editor


cursor = 0;

cursor_lockout = 0;
menu = [];

name_mem = "";
entering_name = false;
for(var i = 0; i < 20; i += 1)
{
	var replay_check = "Replay" + string(i) +".txt";

	menu[i] = {}

	if(file_exists(replay_check))
	{
		menu[i].nom = get_text_file("name",replay_check);
		menu[i].date = get_text_file("date",replay_check);
		menu[i].hour = get_text_file("hour",replay_check);
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
		menu[i].player = plr;
	
		var is_extra = false;
		
		switch(get_text_file("game_type",replay_check))
		{
			case GAME_EXTRA:	
				var is_extra = true;
			case GAME_FULL:
				var type = "All";
			break;
			case GAME_STAGE:
				var num_full = get_text_file("ev",replay_check);
				
				var r = 1;
				var num_id = "";
				while(string_char_at(num_full,r) != ",")
				{
					num_id = num_id + string_char_at(num_full,r);
					r += 1;
				}
				
				var num = "0";
				switch(num_id)
				{
					case act_s1_0:
						num = "1";
					break;
					case act_s2_0:
						num = "2";
					break;
					case act_s3_0:
						num = "3";
					break;
					case act_s4_0:
						num = "4";
					break;
					case act_s5_0:
						num = "5";
					break;
					case act_s6_0:
						num = "6";
					break;
				}
				
				var type = "Stage " + num + " Practice";
			break;
			case GAME_SPELL:	
				var type = "Spell Practice";
			break;
		}
		
		type += get_text_file("rng",replay_check) ? "-RNG" : "";
		
		menu[i].game_type = type;
		
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
		menu[i].difficulty = diff;
		menu[i].action = MENU_NAME;
	}
	else
	{
		menu[i].nom = "--------";
		menu[i].date = "00/00/00";
		menu[i].hour = "00:00";
		menu[i].player = "------";
		menu[i].difficulty = "-------"
		menu[i].game_type = "-----------------";
		menu[i].action = MENU_NAME;
	}
}

vhold = 0;