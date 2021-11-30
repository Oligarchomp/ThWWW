///get_replay(param,name)
///@param param real
///@param name string
function get_replay(param,replay){

	var file = file_text_open_read(working_directory + replay)
	var result = []
	
	switch(param)
	{
		case REPLAY_EVENT:
			var str = get_text_file("ev",replay);
			
			var s = ""
			for(var i = 1; i < string_length(str) + 1; i += 1)
			{
				var char = string_char_at(str,i)
				if(char != ",")
				{
					s += char;
				}
				else
				{
					array_push(result,real(s));
					s = "";
				}
			}
		break;
		case REPLAY_WAIT:
			var str = get_text_file("wait",replay);
			
			var s = ""
			for(var i = 1; i < string_length(str) + 1; i += 1)
			{
				var char = string_char_at(str,i)
				if(char != ",")
				{
					s += char;
				}
				else
				{
					array_push(result,real(s));
					s = "";
				}
			}
		break;
		case REPLAY_GAMETYPE:
			var res = real(get_text_file("game_type",replay));
			
			file_text_close(file);
			
			return res;
		break;
		case REPLAY_INPUT:
			var str = get_text_file("input",replay);
			
			var s = ""
			for(var i = 1; i < string_length(str) + 1; i += 1)
			{
				var char = string_char_at(str,i)
				if(char != ",")
				{
					s += char;
				}
				else
				{
					array_push(result,s);
					s = "";
				}
			}
		break;
		case REPLAY_INPUT_TIME:
			var str = get_text_file("input_time",replay);
			
			var s = ""
			for(var i = 1; i < string_length(str) + 1; i += 1)
			{
				var char = string_char_at(str,i)
				if(char != ",")
				{
					s += char;
				}
				else
				{
					array_push(result,real(s));
					s = "";
				}
			}
		break;
		case REPLAY_PLAYER:
			var res = real(get_text_file("player",replay));
			
			file_text_close(file);
			
			return res;
		break;
		case REPLAY_DIFFICULTY:
			var res = real(get_text_file("difficulty",replay));
			
			file_text_close(file);
			
			return res;
		break;
		case REPLAY_SEED:
			result[0] = real(get_text_file("seed",replay));
		break;
	}
	
	file_text_close(file);
	
	return result;
}