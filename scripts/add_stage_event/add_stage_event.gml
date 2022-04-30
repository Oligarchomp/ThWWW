/// add_stage_event(event_object,wait)
///@param event_object instance
///@param wait real

function add_stage_event(argument0,argument1){
	
	array_push(global.event_list,argument0);
	array_push(global.wait_list,argument1);
}