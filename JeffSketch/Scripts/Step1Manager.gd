extends Node
onready var myText = get_node("TextEdit")
onready var step2 = get_parent().get_node("Step2")
onready var BGAnimationPlayer = get_node("AnimationPlayer")

func _ready():
	myText.connect("step_complete",self,"_on_step_complete")

func _on_step_complete():
	if has_node("TextEdit"):
		$TextEdit.queue_free()
	BGAnimationPlayer.play("Fade")
	step2.visible = true