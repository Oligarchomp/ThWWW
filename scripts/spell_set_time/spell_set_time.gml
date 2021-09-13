///spell_set_time(time,is_timeout,spell_wait)
///@param time real
///@param is_timeout boolean
///@param spell_wait real
function spell_set_time(argument0,argument1,argument2){
	
	time = argument0 * 60;
	time_left = time;
	
	is_timeout = argument1;
	
	spell_wait = argument2;
}