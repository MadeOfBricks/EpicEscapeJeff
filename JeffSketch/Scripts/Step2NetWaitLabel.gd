extends Label


var ellipsisArr = []
var ellipsisIndex = 0

func _ready():
	ellipsisArr = [".",". .",". . ."]
	var ellipsis = ellipsisArr[ellipsisIndex]
	text = "Waiting for network connection " + ellipsis


func _on_Timer_timeout():
	ellipsisIndex += 1
	if ellipsisIndex == 3:
		ellipsisIndex = 0
	
	var ellipsis = ellipsisArr[ellipsisIndex]
	text = "Waiting for network connection " + ellipsis
