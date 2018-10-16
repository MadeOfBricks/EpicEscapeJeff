extends Node

var puzzleStep = 1


func _ready():
	save_test()

func save_test():
	var testSave = File.new()
	testSave.open("user://testSave.txt", File.WRITE)
	testSave.store_line("This is a line of test text.")
	
	