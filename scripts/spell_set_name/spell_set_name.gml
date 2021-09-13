///spell_set_name(name_easy,name_normal,name_hard,name_lunatic)
///@param easy_name string
///@param normal_name string
///@param hard_name string
///@param lunatic_name string

function spell_set_name(argument0,argument1,argument2,argument3){

	var result = "No Spell Card Sign - [Perish In This Very Moment]"
	switch(global.difficulty)
	{
		case 0:
			result = get_text(argument0);
		break;
		case 1:
			result = get_text(argument1);
		break;
		case 2:
			result = get_text(argument2);
		break;
		case 3:
			result = get_text(argument3);
		break;
	}
	
	spell_name = result;
}