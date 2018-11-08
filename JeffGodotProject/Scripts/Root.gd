extends Node



var puzzleStep = 1
onready var screenSize = get_tree().get_root().get_viewport().size

func _ready():
	save_create()
	OS.window_fullscreen = true
	

func save_create():
	var file = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	file.open(fileString,File.WRITE)
	file.store_line("X")
	file.store_line("\r\n")
	file.store_line("X")
	file.close()

