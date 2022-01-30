extends Reference
class_name stock
#this is called stock because it represent an inventory slot.

var source : itemResource;
var amount : int;
var stolenAmount : int = 0;

func _init(s, a):
	assert(s is itemResource)
	source = s;
	amount = a;
	
		
	

 
