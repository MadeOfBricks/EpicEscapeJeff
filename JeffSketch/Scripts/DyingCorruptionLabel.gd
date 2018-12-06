extends Label

var origX
var origY
const SHAKE_RANGE = 10

func _ready():
	origX = rect_position.x
	origY = rect_position.y
	set_process(true)

func _process(delta):
	rect_position.x = origX + rand_range(-1*SHAKE_RANGE,SHAKE_RANGE)
	rect_position.y = origY + rand_range(-1*SHAKE_RANGE,SHAKE_RANGE)


func _on_Timer_timeout():
	queue_free()
