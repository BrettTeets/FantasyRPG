extends PanelContainer

onready var textureRect = get_node("TextureRect");

func set_item(texture, tooltip):
	textureRect.set_texture(texture);
	textureRect.hint_tooltip = tooltip;
