/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)

var tex = sprite_get_texture(spr_road,0);
var cam = obj_camera_3d;
var mat = matrix_build(cam.x,cam.y,cam.depth,0,0,0,1,1,1);
vertex_submit(model, pr_trianglelist,tex);