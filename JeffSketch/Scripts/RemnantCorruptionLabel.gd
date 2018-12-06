extends Node2D

var origX 
var origY 

const SHAKE_RANGE = 5

func _ready():
	origX = position.x
	origY = position.y
	set_process(true)

func _process(delta):
	position.x = origX + rand_range(-1*SHAKE_RANGE,SHAKE_RANGE)
	position.y = origY + rand_range(-1*SHAKE_RANGE,SHAKE_RANGE)
