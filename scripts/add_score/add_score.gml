/// add_score(score)
///@param score real
function add_score(argument0){
	
	//global.score += argument0;
	global.score = goto_value(global.score,global.counterstop,argument0)
}