/// load_sprite(name,image_number,xorig,yorig)
///@param name string
///@param image_number real
///@param xorig real
///@param yorig real

function load_sprite(name,image,xorig,yorig){
	
	switch(global.lan)
	{
		case LAN_ENG:
			var lan = "eng";
		break;
		case LAN_JAP:
			var lan = "j";
		break;
	}
	
	var spr = sprite_add("sprite/" + lan + "/" + name + "_" + string(image) + ".png",image,false,false,xorig,yorig);
	
	return spr;
}