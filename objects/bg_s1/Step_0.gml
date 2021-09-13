/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	y += vsp;
	y %= height;
	
	

	
	if (step % wait_tree == 0)
	{
		var x_pos = room_width / 2 + x_pos_min + rng(x_var,true,1);
		for(var i = 0; i < 3; i += 1)
		{
			var inst = instance_create_depth(x_pos,y_pos,depth - depth_dif * i - depth_plus,obj_tree);
			inst.vsp = vsp;
			inst.image_index = i;
		}
	}
	
	if (step % wait_tree == wait_tree / 2)
	{
		var x_pos = room_width / 2 - x_pos_min - rng(x_var,true,1);
		for(var i = 0; i < 3; i += 1)
		{
			var inst = instance_create_depth(x_pos,y_pos,depth - depth_dif * i - depth_plus,obj_tree);
			inst.vsp = vsp;
			inst.image_index = i;
		}
	}
	
	
	obj_camera_3d.x_lookat = x_lookat_ref + sin(step / 80) * 5;
	obj_camera_3d.x = x_cam_ref + sin(step / 80) * 5;
	
	
	
	
	step += 1;
}