extends Node2D

func _ready():
	pass

signal correct_password

func _on_Step4_visibility_changed():
	$BackgroundAnimPlayer.play("Fade")
	$J_E_F_FlTimer.start()
	$BackgroundAnimPlayer/Background.visible = true


func _on_J_E_F_FlTimer_timeout():
	$J_E_F_FlTimer/JeffTitlePlayer.play("Fade In")


func _on_JeffTitlePlayer_animation_finished(anim_name):
	if anim_name == "Fade In":
		$LoginBox.visible = true

func _unhandled_input(event):
	if visible:
		if event.is_action("EnterKey"):
			if $LoginBox/TextEdit.text == "Janet\n":
				$LoginBox/TextEdit.text = ""
				$LoginBox/NotificationLabel.text = "Welcome back"
			else:
				$LoginBox/NotificationLabel.text = "Incorrect password"
				$LoginBox/TextEdit.text = ""
