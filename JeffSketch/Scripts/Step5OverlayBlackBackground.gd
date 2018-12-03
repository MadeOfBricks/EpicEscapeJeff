extends Sprite




func _ready():
	var screenSize = get_tree().get_root().get_viewport().size
	position = screenSize/2
	scale = screenSize
