extends Node



var puzzleStep = 1
onready var screenSize = get_tree().get_root().get_viewport().size

func _ready():
	print(121212)
	OS.window_fullscreen = true
	var file = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	if file.file_exists(fileString):
		file.open(fileString,File.READ)
		var thisLine
		while !file.eof_reached():
			thisLine = file.get_line()
			print(thisLine)
	else:
		OS.alert("File for Arduino data not detected. Please run 'ArduinoCommincator' and restart Jeff.")
		get_tree().quit()
	
	

func save_create():
	var file = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	file.open(fileString,File.WRITE)
	file.store_line("X")
	file.store_line("\r\n")
	file.store_line("X")
	file.close()

