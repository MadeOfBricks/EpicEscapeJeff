extends Node2D

var checkString

func _ready():
	pass

func _unhandled_input(event):
	if visible:
		if event.is_action("EnterKey"):
			if $TextEdit/VerifyTimer.is_stopped():
				checkString = $TextEdit.text
				$TextEdit.text = ""
				$TextEdit/VerifyTimer.start()
				$NotificationLabel.text = "Verifying . . ."
			else:
				$TextEdit.text = ""
				if $TextEdit.text == "12345\n":
					$TextEdit.text = ""
					$NotificationLabel.text = "Eyyy it werk"
				else:
					$NotificationLabel.text = "Incorrect password"
					$TextEdit.text = ""


func _on_VerifyTimer_timeout():
	if checkString == "12345\n":
		$NotificationLabel.text = "Sector verified. Prepare for code delivery. . ."
		$CorruptionTimer.start()
	else:
		$NotificationLabel.text = "Sector verification failed."


func _on_CorruptionTimer_timeout():
	var waitTime = $CorruptionTimer.wait_time
	if waitTime == 2:
		$CorruptionTimer.wait_time = 1
	elif waitTime > .16:
		$CorruptionTimer.wait_time = waitTime/2
	
	
	var randChars = ""
	$NotificationLabel.text = $NotificationLabel.text + randChars
