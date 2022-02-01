/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	y += vsp;
	y %= height;
	
	
	if(step % 2 == 0)
	{
		var x_pos = -240 + rng(room_width + 240 * 2,false,1);
		var inst = instance_create_depth(x_pos,-420,depth - 12,obj_agra_flower);
		inst.vsp = vsp;
	}
	
	
	obj_camera_3d.x_lookat = x_lookat_ref + sin(step / 80) * 5;
	obj_camera_3d.x = x_cam_ref + sin(step / 80) * 5;
	
	
	step += 1;
}