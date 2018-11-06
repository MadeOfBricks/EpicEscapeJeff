extends Node



onready var step4Label = get_node("Step4/Label")

var puzzleStep = 1
onready var screenSize = get_tree().get_root().get_viewport().size

func _ready():
	pass#print(String(Environment.background_color))
	
	

func dir_contents(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")