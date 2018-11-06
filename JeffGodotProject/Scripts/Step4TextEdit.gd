extends TextEdit
onready var root = get_parent().get_parent()
onready var label = get_parent().get_node("Label")

func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		label.text = text
		if text == "password" or text == "\npassword":
			root.puzzleStep += 1
			if root.puzzleStep >= 2:
				visible = false
				queue_free()
				label.text = "Password Accepted"
		text = ""
	