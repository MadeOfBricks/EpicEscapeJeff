extends Node2D

var quitStep = 0

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_pressed():
		if quitStep == 0:
			if Input.is_action_pressed("Quit1"):
				quitStep += 1
			else:
				quitStep = 0
		elif quitStep == 1:
			if Input.is_action_pressed("Quit2"):
				quitStep +=1
			else:
				quitStep = 0
		elif quitStep == 2:
			if Input.is_action_pressed("Quit3"):
				quitStep +=1
			else:
				quitStep = 0
		elif quitStep == 3:
			if Input.is_action_pressed("Quit4"):
				quitStep +=1
			else:
				quitStep = 0
		elif quitStep == 4:
			if Input.is_action_pressed("Quit5"):
				quitStep +=1
			else:
				quitStep = 0
		elif quitStep == 5:
			if Input.is_action_pressed("Quit6"):
				quitStep +=1
			else:
				quitStep = 0
		elif quitStep == 6:
			if Input.is_action_pressed("Quit7"):
				get_tree().quit()
			else:
				quitStep = 0