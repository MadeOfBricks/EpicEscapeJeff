extends Node2D

signal correct_password

func _ready():
	connect("correct_password",self,"_on_correct_password")

func _on_Step4_visibility_changed():
	if visible == true:
		$BackgroundAnimPlayer.play("Fade")
		$J_E_F_FlTimer.start()
		$BackgroundAnimPlayer/Background.visible = true


func _on_J_E_F_FlTimer_timeout():
	$J_E_F_FlTimer/JeffTitlePlayer.play("Fade In")


func _on_JeffTitlePlayer_animation_finished(anim_name):
	if anim_name == "Fade In":
		print("Make LoginBox visible")
		$LoginBoxAPlayer/LoginBox.visible = true

func _unhandled_input(event):
	if visible:
		if event.is_action("EnterKey"):
			if $LoginBoxAPlayer/LoginBox/TextEdit.text == "Janet\n":
				$LoginBoxAPlayer/LoginBox/TextEdit.text = ""
				$NotificationLabel.text = "Welcome back\nDirector Roberts"
				emit_signal("correct_password")
			else:
				$NotificationLabel.text = "Incorrect password"
				$PassWordHint.text = "Password hint: Best friend."
				$LoginBoxAPlayer/LoginBox/TextEdit.text = ""

func _on_correct_password():
	$LoginBoxAPlayer.play("Fade")


func _on_LoginBoxAPlayer_animation_finished(anim_name):
	if anim_name == "Fade":
		visible = false
		get_parent().get_node("Step5").visible = true
