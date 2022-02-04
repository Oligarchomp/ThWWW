///clear_charge()
function clear_charge(){
	with(obj_rowcharge)
	{
		instance_destroy();
	}
	
	with(obj_circlecharge)
	{
		instance_destroy();	
	}
}