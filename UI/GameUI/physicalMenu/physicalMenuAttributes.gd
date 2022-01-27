extends VBoxContainer

onready var might = get_node("might");
onready var hardy = get_node("hardy");
onready var agility = get_node("agility");
onready var aware = get_node("aware");
onready var intel = get_node("intel");
onready var spirit = get_node("spirit");
onready var will = get_node("will");
onready var luck = get_node("luck");
onready var fame = get_node("fame");
onready var accept = get_node("accept");

func set_attributes(character):
	might.text = "Might: " + str(character.get_ability(global.ABILITIES.MIGHT));
	hardy.text = "Hardy: " + str(character.get_ability(global.ABILITIES.HARDY));
	agility.text = "Agility: " + str(character.get_ability(global.ABILITIES.AGILITY));
	aware.text = "Aware: " + str(character.get_ability(global.ABILITIES.AWARE));
	intel.text = "Intel: " + str(character.get_ability(global.ABILITIES.INTEL));
	spirit.text = "Spirit: " + str(character.get_ability(global.ABILITIES.SPIRIT));
	will.text = "Will: " + str(character.get_ability(global.ABILITIES.WILL));
	luck.text = "Luck: " + str(character.get_ability(global.ABILITIES.LUCK));
	fame.text = "Fame: " + str(character.get_ability(global.ABILITIES.FAME));
	accept.text = "Accept: " + str(character.get_ability(global.ABILITIES.ACCEPT));
