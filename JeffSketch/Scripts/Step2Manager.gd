extends Node2D

onready var step3 = get_parent().get_node("Step3")



func _ready():
	connect("lever_pulled",self,"_on_lever_pulled")

signal lever_pulled

func _on_Step2_visibility_changed():
	if visible == true:
		$Step2J_E_F_FlTimer.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Fade In":
		$Step2NetWait.visible = true
		$Step2NetWait/Timer.start()
		$Step2FileChecker.start()


func _on_Step2J_E_F_FlTimer_timeout():
	$Step2J_E_F_FlTimer/AnimationPlayer.play("Fade In")



func sensor_file_read():
	var readFile = File.new()
	var fileString = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS) + "/testFile.txt"
	readFile.open(fileString,File.READ)
	var levState = readFile.get_line()
	
	
	var servState = readFile.get_line()
	
	if levState != "X":
		emit_signal("lever_pulled")

func _on_Step2FileChecker_timeout():
	sensor_file_read()

func _on_lever_pulled():
	step3.visible = true
	visible = false
	$Step2J_E_F_FlTimer/AnimationPlayer/J_E_F_F.visible = false
	$Step2NetWait.visible = false
	$Step2NetWait/Timer.stop()
	$Step2FileChecker.stop()