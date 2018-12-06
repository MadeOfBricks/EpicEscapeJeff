extends Node2D

onready var root = get_parent()

var checkString
var charArray = ['J','6',' ','RECLAIM','X','MINE','0','1']
var charsAdded = 0

var corruptionLabel = preload("res://Packed/Step5CorruptingLabel.tscn")

func _ready():
	randomize()
	pass

func _unhandled_input(event):
	if visible:
		if event.is_action("EnterKey"):
			if $TextEdit/VerifyTimer.is_stopped():
				checkString = $TextEdit.text
				$TextEdit.text = ""
				$TextEdit/VerifyTimer.start()
				$NotificationLabel.text = "Verifying . . ."
			


func _on_VerifyTimer_timeout():
	if checkString == root.step5Sector:
		$NotificationLabel.text = "Sector verified. Prepare for code delivery. . ."
		$TextEdit.editable = false
		$CorruptionTimer.start()
	else:
		$NotificationLabel.text = "Sector verification failed."


func _on_CorruptionTimer_timeout():
	var waitTime = $CorruptionTimer.wait_time
	if waitTime == 1:
		$NotificationLabel.text = "\nDORMANT INTRUSION"
		var randVec
		var corrLabInst = corruptionLabel.instance()
		for i in range(3):
			randVec = Vector2(rand_range(0,200),rand_range(0,20))
			corrLabInst.position = randVec
			add_child(corrLabInst)
			
		$CorruptionTimer.wait_time = .5
	
	if waitTime/2 > 0:
		$CorruptionTimer.wait_time= waitTime/2
	
	var randInt
	var randChars = ""
	for i in range(4):
		charsAdded += 4
		randInt = int(rand_range(0,8))
		randChars += charArray[randInt]
	$NotificationLabel.text = $NotificationLabel.text + randChars
	
	if charsAdded > 800 || !visible:
		$CorruptionTimer.stop()
		$BlackBackAnim.play("Flicker In")
		


func _on_BlackBackAnim_animation_finished(anim_name):
	visible = false
	get_parent().get_node("Step4/J_E_F_FlTimer/JeffTitlePlayer/J_E_F_F")\
	.visible = false
	$BlackBackAnim/BlackBack.visible = false
	get_parent().get_node("Step6").visible = true
	if root.remainingCorruption != null:
		root.remainingCorruption.queue_free()
	queue_free()
