extends Node

var remainingCorruption = null

var puzzleStep = 1
var step2Code
var step4Password
var step5Sector
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
		file.close()
	else:
		OS.alert("File for Arduino data not detected. Please run 'ArduinoCommincator' and restart Jeff.")
		get_tree().quit()
	
	#Open and record codes, create file if needed
	file = File.new()
	fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/JeffCodes.txt"
	
	if !file.file_exists(fileString):
		create_codes()
	
	file.open(fileString,File.READ)
	step2Code = file.get_line()
	step4Password = file.get_line()
	step5Sector = file.get_line()
	
	print(step2Code + ", " + step4Password + ", " + step5Sector)
	
	
	

func save_create():
	var file = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	file.open(fileString,File.WRITE)
	file.store_line("X")
	file.store_line("\r\n")
	file.store_line("X")
	file.close()

func create_codes():
	var file = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/JeffCodes.txt"
	file.open(fileString,File.WRITE)
	#Step 2 JUDAS cell key
	file.store_line("RGBG")
	#Step 4 Admin password
	file.store_line("Janet")
	#Step 5 Sector code
	file.store_line("64")
