/// @description Insert description here
// You can write your code in this editor

//to let the time to danmaku to spawn
var cancel_max = 20;
var cancel_nbr = 0;
if(cancel)
{
	var x_list = [];
	var y_list = [];
	var inst_list = [];
		
	while(place_meeting(x,y,obj_danmaku) and (cancel_nbr < cancel_max))
	{
		var meet = instance_place(x,y,obj_danmaku);
		if(true) //(meet.is_cancelable)
		{
			create_item(ITEM_CANCEL,meet.x,meet.y);
			cancel_bullet(meet);
			cancel_nbr += 1;
		}
		else
		{
			array_push(x_list,meet.x)
			array_push(y_list,meet.y)
			array_push(inst_list,meet)
			meet.x = -1000;
			meet.y = -1000;
		}
	}
		
	for(var i = 0; i < array_length(x_list); i += 1)
	{
		var inst = inst_list[i]
		inst.x = x_list[i]
		inst.y = y_list[i]
	}
}