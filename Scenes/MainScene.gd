extends Node


func _process(delta):
	if Global.CardOnScreen == false:
		Global.spawn()
		Global.CardOnScreen == true
