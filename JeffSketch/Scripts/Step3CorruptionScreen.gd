extends Sprite

var screenSize = Vector2(0,0)

func _ready():
	screenSize = OS.get_real_window_size()


func _on_CorruptionScreen_visibility_changed():
	if visible == true:
		position = Vector2(0,0)
