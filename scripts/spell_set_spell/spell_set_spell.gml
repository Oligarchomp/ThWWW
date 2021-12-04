///spell_set_spell(spell_name,user_id,bonus)
///@param spell_name string
///@param user_id real
///@param bonus real
function spell_set_spell(argument0,argument1,argument2){

	data_name = argument0;
	is_spell = true;
	is_capturing = true;
	need_cancel_bonus = true;
	
	if(global.game_type != GAME_SPELL)
	{
		item_nbr = item_nbr_spell;
	}
	
	bonus = argument2;
	bonus_max = bonus;
	user_id = argument1;
	
	
	var cap = get_difficulty_key(0,global.difficulty);
	var attempt = get_difficulty_key(1,global.difficulty);

	cap_history = data_read(global.spell_file,data_name,cap);
	try_history = data_read(global.spell_file,data_name,attempt);
	
	if(global.play_type == PLAY_MANUAL) and (!global.rng_patch)
	{
		try_history += 1;
		data_write(global.spell_file,data_name,attempt,try_history);
	}
	
}