extends Node2D

var timeMode = "wait"

var labelPcked = preload("res://Packed/CorruptionRemnantLabel.tscn")

var texts = ["Still here","Remain",\
"Never die"]
var lastLabel
var screenSize

func _ready():
	screenSize = OS.get_real_window_size()




func _on_Timer_timeout():
	if timeMode == "wait":
		$Timer.wait_time = rand_range(5,15)
		lastLabel = labelPcked.instance()
		var randInt = int(floor(rand_range(0,2.9)))
		var randX = rand_range(50,screenSize.x*.5)
		var randY = rand_range(50,screenSize.y*.5)
		
		lastLabel.get_node("Label").text = texts[randInt]
		lastLabel.position = Vector2(randX,randY)
		
		add_child(lastLabel)
		timeMode = "show"
	elif timeMode == "show":
		timeMode = "wait"
		$Timer.wait_time = .5
		lastLabel.queue_free()
		
		
