extends LineEdit

func _ready():
	pass
	

func _on_LoginBox_visibility_changed():
	grab_focus()
	select_all()
	deselect()
