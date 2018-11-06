extends Node2D

onready var step3 = get_parent().get_node("Step3")

func _ready():
	connect("lever_pulled",self,"_on_lever_pulled")

signal lever_pulled

func _on_Step2_visibility_changed():
	$Step2J_E_F_FlTimer.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade In":
		$Step2NetWait.visible = true
		$Step2NetWait/Timer.start()
		$Step2FileChecker.start()


func _on_Step2J_E_F_FlTimer_timeout():
	$Step2J_E_F_FlTimer/AnimationPlayer.play("Fade In")

func dummy_sensor_file_create():
	print("Attempting test save")
	var testFile = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	testFile.open(fileString,File.WRITE)
	testFile.store_line(to_json("X"))
	testFile.store_line(to_json("X"))
	testFile.close()

func sensor_file_read():
	var readFile = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	readFile.open(fileString,File.READ)
	var levState = parse_json(readFile.get_line())
	#print("Lever state: " + levState)
	var servState = parse_json(readFile.get_line())
	#print("Server state: " + servState)
	
	if levState != "X":
		emit_signal("lever_pulled")

func _on_Step2FileChecker_timeout():
	sensor_file_read()

func _on_lever_pulled():
	step3.visible = true