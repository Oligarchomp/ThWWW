/// @description Insert description here
// You can write your code in this editor


character = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"0","1","2","3","4","5","6","7","8","9",
"!","?","_","-","(",")",":",";","+","-","=","*","/","|","BACK","ENTER"]	

panel_width = 13;

cursor = array_length(character) - 1;

vhold = 0;
hhold = 0;

var name = data_read_string("Data.ini","data","name");
global.name_entry = name == "0" ? "" : name;