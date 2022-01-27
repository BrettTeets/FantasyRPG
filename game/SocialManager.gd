extends Node

onready var menuManager = get_node("../menuManager");
var socialMenu;

#Line Tracking
var dialog
var lineCount = 1; #just start at one.
var reading = false; 

func start_dialog(character):
	socialMenu = menuManager.toggle_social_menu();
	socialMenu.add_character(character.characterName, mood_to_string(character.characterMood));
	var button = socialMenu.get_button();
	button.connect("pressed", self, "next_dialog");
	
	var d : Dictionary   = load_dialog("res://Dialog/socials/first.json")
	dialog = d;
	
	parse_dialog(dialog);
	
func next_dialog():
	var pre = lineCount;
	parse_dialog(dialog);
	print("previous lc: " + str(pre) + " current lc: " + str(lineCount));
	

func load_dialog(filePath):
	var file = File.new();
	
	file.open(filePath, file.READ);
	var dialog = parse_json(file.get_as_text())
	return dialog;

func parse_dialog(dialog):
	if get_dialog_type(dialog) == "text":
		display_text_dialog(dialog)
		lineCount += 1;
	elif get_dialog_type(dialog) == "query":
		display_question_dialog(dialog);
		#print(dialog[str(lc)].questions[0].prompt);
		lineCount = get_query_jump(0, dialog)
	elif get_dialog_type(dialog) == "jump": 
		lineCount = get_jump(dialog);
		parse_dialog(dialog);
	elif get_dialog_type(dialog) == "end":
		reading = false; 
	else:
		print("Error that type of dialog does not exist.")
			
func mood_to_string(mood):
	return Constants.MOOD.keys()[mood];
	
func display_text_dialog(dialog):
	socialMenu.add_dialog(get_character_name(dialog), get_dialog_text(dialog));

func display_question_dialog(dialog):
	socialMenu.add_dialog(get_character_name(dialog), get_dialog_text(dialog))

func get_query_jump(queryId, dialog):
	return int(dialog[str(lineCount)].query[queryId].jump);
func get_jump(dialog):
	return int(dialog[str(lineCount)].jump);
func get_character_name(dialog):
	return dialog[str(lineCount)].character;
func get_dialog_type(dialog):
	return dialog[str(lineCount)].type
func get_dialog_text(dialog):
	return dialog[str(lineCount)].text
