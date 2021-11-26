/// @function room_transition(room)
///@param room room
function room_transition(to_room){
	var inst = instance_create_depth(0,0,0,obj_transition);
	inst.room_to = to_room;
}