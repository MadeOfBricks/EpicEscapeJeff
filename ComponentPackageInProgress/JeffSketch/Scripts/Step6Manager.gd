extends Node2D

var dyingCorruptionAsset = preload("res://Packed/DyingCorruptionManager.tscn")
var dyingCorruptionManager

signal correct_phrase

func _ready():
	connect("correct_phrase",self,"_on_correct_phrase")


func _on_Step6_visibility_changed():
	$AppearTimer.start()


func _on_AppearTimer_timeout():
	$TextEdit.visible = true
	$TextEdit.grab_focus()
	$TextEdit.select_all()
	$TextEdit.deselect()

func _unhandled_input(event):
	if $TextEdit.text.length() < 3:
		$TextEdit.text = "X:/"
		$TextEdit.select_all()
		$TextEdit.deselect()
	
	if event.is_action("EnterKey"):
		if $TextEdit.text == "X:/jos run j-purge\n":
			$TextEdit.readonly = true
			$TextEdit.text = "PURGING . . ."
			emit_signal("correct_phrase")
		else:
			$TextEdit.text = "X:/"
		
		$TextEdit.select_all()
		$TextEdit.deselect()

func _on_correct_phrase():
	dyingCorruptionManager = dyingCorruptionAsset.instance()
	add_child(dyingCorruptionManager)
	dyingCorruptionManager.connect("tree_exited",self,"_on_corruption_death")

func _on_corruption_death():
	$TextEdit.text = "Purge complete.\n Resuming user session. . ."
	$FinalScreenTimer.start()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Flicker In":
		get_parent().get_node("FinalStep").visible = true
		$AnimationPlayer/GreenBackground.visible = false
		visible = false
		


func _on_FinalScreenTimer_timeout():
	$AnimationPlayer.play("Flicker In")
