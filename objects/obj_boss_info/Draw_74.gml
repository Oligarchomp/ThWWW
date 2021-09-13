/// @description Insert description here
// You can write your code in this editor
draw_set_font(font_spell)

draw_text(x,y,name);

var size = sprite_get_width(sprite_index) * 1.4
for(var i = 0; i < spell_nbr; i += 1)
{
	draw_sprite(sprite_index,0,x + size * i + string_width(name) + 10,y + 9);
}