extends TextEdit
onready var root = get_parent()
onready var label = root.get_node("Label")

func _ready():
	print(String(root.puzzleStep))
	set_process_input(true)

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		label.text = text
		if text == "password" or text == "\npassword":
			root.puzzleStep += 1
			print(String(root.puzzleStep))
			if root.puzzleStep >= 2:
				visible = false
				queue_free()
				label.text = "Password Accepted"
		text = ""
	