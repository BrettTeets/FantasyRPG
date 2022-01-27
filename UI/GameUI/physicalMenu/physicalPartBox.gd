extends Panel


func set_part(stringId, speciesId):
	
	var iconTexture = get_node("HBoxContainer/TextureRect");
	var labelText = get_node("HBoxContainer/partName");
	var speciesText = get_node("HBoxContainer/speciesName");
	
	labelText.text = stringId;
	speciesText.text= speciesId;
