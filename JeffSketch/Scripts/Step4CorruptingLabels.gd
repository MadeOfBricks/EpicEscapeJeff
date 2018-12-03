extends Label


var charArray = ['J','6',' ','#','X','A','0','1']

func _ready():
	pass


func _on_Timer_timeout():
	if $Timer.wait_time/2 > 0:
		$Timer.wait_time /= 2
	var randInt
	var randChars = ""
	for i in range(4):
		randInt = int(rand_range(0,8))
		randChars += charArray[randInt]
	text += randChars
