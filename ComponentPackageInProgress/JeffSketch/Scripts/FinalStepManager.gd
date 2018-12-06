extends Node2D


func _ready():
	set_process(true)
	



func _on_FinalStep_visibility_changed():
	pass


func _process(delta):
	$NotificationLabel.text = $NotificationLabel.text + get_parent().stepFinalBlackBoxCode
	set_process(false)