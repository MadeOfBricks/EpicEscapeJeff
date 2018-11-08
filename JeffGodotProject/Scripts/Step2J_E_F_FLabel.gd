extends Label

func _ready():
	var screenSize = OS.get_real_window_size()
	rect_position.x = screenSize.x

