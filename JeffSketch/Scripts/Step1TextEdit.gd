extends TextEdit

onready var root = get_parent().get_parent()

signal step_complete

func _ready():
	grab_focus()
	
	var screenSize = OS.get_real_window_size()#get_tree().get_root().get_viewport().size
	margin_left = screenSize.x/2 - 100
	margin_top = screenSize.y * .35


func _unhandled_input(event):
	if event is InputEventKey:
		queue_free()
		emit_signal("step_complete")



func _on_Timer5_timeout():
	select_all()

func delete_self():
	queue_free()
