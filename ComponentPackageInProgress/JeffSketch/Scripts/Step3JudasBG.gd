extends Sprite

var screenSize = Vector2(0,0)

func _ready():
	screenSize = get_tree().get_root().get_viewport().size
	position = screenSize/2
	scale *= 4
	set_process(false)
