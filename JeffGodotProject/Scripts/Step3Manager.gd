extends Node2D

onready var crptSprite = preload("res://CorruptionSprite.tscn")

const SPRITE_COUNT = 8

var screenSize = Vector2(0,0)
var spritesLeft = SPRITE_COUNT

signal server_pulled

func _ready():
	randomize()
	screenSize = OS.get_real_window_size()
	connect("server_pulled",self,"_on_server_pulled")



func sensor_file_read():
	var readFile = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	readFile.open(fileString,File.READ)
	var levState = parse_json(readFile.get_line())
	#print("Lever state: " + levState)
	var servState = parse_json(readFile.get_line())
	#print("Server state: " + servState)
	
	if servState != "X":
		emit_signal("server_pulled")
		print("server pulled")


func _on_Step3FileChecker_timeout():
	sensor_file_read()

func _on_server_pulled():
	pass

func _on_Step3_visibility_changed():
	$Step3FileChecker.start()
	$CorruptionScreen.visible = true
	$CorruptionSpriteTimer.start()

func _on_CorruptionSpriteTimer_timeout():
	if spritesLeft > 0:
		spritesLeft -= 1
		var thisSprite = crptSprite.instance()
		var randX = rand_range(0,screenSize.x)
		var randY = rand_range(0,screenSize.y)
		var randScaleX = rand_range(10,20)
		var randScaleY = rand_range(10,20)
		var randRot = int(rand_range(0,3))
		randRot = float(randRot * 90)
		
		thisSprite.position = Vector2(randX,randY)
		thisSprite.frames.set_animation_speed("default",rand_range(2,8))
		thisSprite.scale = Vector2(randScaleX,randScaleY)
		thisSprite.frame = int(rand_range(0,3))
		add_child(thisSprite)
	else:
		$CorruptionSpriteTimer.stop()
		$WarningWindow.visible = true
