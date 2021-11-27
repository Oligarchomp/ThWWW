/// @function get_difficulty_key(need_type,difficulty)
///@param need_type 
///@param difficulty real
// 0 = capture
// 1 = attempt
function get_difficulty_key(argument0,diff){
	switch(diff)
	{
		case 0:
			var cap = "ecap";
			var attempt = "etry"
		break;
		case 1:
			var cap = "ncap";
			var attempt = "ntry"
		break
		case 2:
			var cap = "hcap";
			var attempt = "htry"
		break
		case 3:
			var cap = "lcap";
			var attempt = "ltry"
		break
	}
	
	switch(argument0)
	{
		case 0:
			return cap;
		break;
		case 1:
			return attempt;
		break;
	}
}