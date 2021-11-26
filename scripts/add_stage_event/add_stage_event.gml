/// add_stage_event(event_object,wait)
///@param event_object instance
///@param wait real

function add_stage_event(argument0,argument1){
	
	ds_list_add(global.event_list,argument0);
	ds_list_add(global.wait_list,argument1);
}