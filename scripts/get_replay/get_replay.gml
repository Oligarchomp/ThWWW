///get_replay(param,name,index)
///@param param real
///@param name string
///@param index real
function get_replay(param,replay,index){

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
			var str = get_text_file("input" + string(index),replay);
			
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
			var str = get_text_file("input_time" + string(index),replay);
			
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
			var res = real(get_text_file("seed" + string(index),replay));
			
			file_text_close(file);
			
			return res;
		break;
		case REPLAY_STAGE_NBR:
			var res = real(get_text_file("stage_nbr",replay));
			
			file_text_close(file);
			
			return res;
		break;
	}
	
	file_text_close(file);
	
	return result;
}