/// @function unlock_stage(number)
///@param number real 
function unlock_stage(nbr){
	
	var stage_then = data_read("Data.ini","data","stage_unlock");
	if(nbr > stage_then)
	{
		data_write("Data.ini","data","stage_unlock",nbr);	
	}
}