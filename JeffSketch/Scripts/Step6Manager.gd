extends Node2D



func _ready():
	pass



func _on_Step6_visibility_changed():
	$AppearTimer.start()


func _on_AppearTimer_timeout():
	$TextEdit.visible = true
	$TextEdit.grab_focus()
	$TextEdit.select_all()
	$TextEdit.deselect()

func _unhandled_input(event):
	if $TextEdit.text.length() < 3:
		$TextEdit.text = "X:/"
		$TextEdit.select_all()
		$TextEdit.deselect()
	
	if event.is_action("EnterKey"):
		print($TextEdit.text)
		if $TextEdit.text == "X:/jos run JPurge\n":
			$TextEdit.readonly = true
			$TextEdit.text = "PURGING . . ."
		else:
			$TextEdit.text = "X:/"
		