extends TextEdit


func _ready():
	pass

func _on_Step5_visibility_changed():
	grab_focus()
	select_all()
	deselect()
