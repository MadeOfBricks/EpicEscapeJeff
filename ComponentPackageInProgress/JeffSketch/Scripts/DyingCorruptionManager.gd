extends Node2D

var labelAsset = preload("res://Packed/DyingCorruptionLabel.tscn")
var screenSize
var done = false

signal done

func _ready():
	connect("done",self,"_on_done")
	screenSize = OS.get_real_window_size()


func _on_Timer_timeout():
	print($Timer.wait_time)
	if $Timer.wait_time >= .35:
		$Timer.stop()
		done = true
		emit_signal("done")
	
	var newLabel = labelAsset.instance()
	var randX = rand_range(50,screenSize.x-50)
	var randY = rand_range(50,screenSize.y-50)
	
	newLabel.rect_position = Vector2(randX,randY)
	add_child(newLabel)
	
	$Timer.wait_time += .01

func _on_done():
	queue_free()