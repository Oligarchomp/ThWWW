/// @function get_text_file(string,file)
/// @description Get the correct string in the external text file
/// @param {string} string the name of the string to look at for
function get_text_file(argument0,filename) {

	var string_name = argument0;
	var final_string = argument0;

	var file = file_text_open_read(working_directory + filename);
	
	do 
	{
		if(file_text_eof(file))
		{
			final_string = "0"
			break;
		}
		final_string = file_text_read_string(file);
		file_text_readln(file);
	}
	until (string_count(string_name,final_string) = 1)

		   
	// for editing the string   
	final_string = string_replace(final_string,string_name,"")
	final_string = string_replace(final_string," = ","")
	
	
	while(string_pos("$",final_string))
	{
		final_string = string_replace(final_string,"$","\n")//this makes no sense! Why does it only works like this ?
	}

	file_text_close(file);
		
	return final_string;
}
