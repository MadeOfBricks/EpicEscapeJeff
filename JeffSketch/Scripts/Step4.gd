extends Node

onready var children = get_children()

func _ready():
	var item = get_tree().get_root().get_children()
	#Why does it say this is an Array, not an ItemTree?