/// @function room_transition(room,stop_music)
///@param room room
///@param stop_music real 
function room_transition(to_room,stop_music){
	var inst = instance_create_depth(0,0,-10,obj_transition);
	inst.room_to = to_room;
	
	if(stop_music)
	{
		set_bgm("noone");	
	}
}