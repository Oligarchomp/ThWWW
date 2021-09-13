/// create_enemy(enemy_type,x,y,life,id_number)
///@param enemy_type real
///@param x real
///@param y real
///@param life real
///@param id_number real
function create_enemy(argument0,argument1,argument2,argument3,argument4){
	

	switch(argument4)
	{
		case 1:
			var id_num = obj_enemy1;
		break;
		case 2:
			var id_num = obj_enemy2;
		break;
		case 3:
			var id_num = obj_enemy3;
		break;
		case 4:
			var id_num = obj_enemy4;
		break;
		default:// and 5
			var id_num = obj_enemy5;
		break;
	}
	
	global.enemy_type = argument0;
	var inst = instance_create_depth(argument1,argument2,0,id_num);
	inst.life = argument3;
	
	return inst;
}