/// @description Insert description here
// You can write your code in this editor
var full = !window_get_fullscreen()
window_set_fullscreen(full)

data_write("Data.ini","option","fullscreen",full);