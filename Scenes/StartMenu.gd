extends Control

func _ready():
	$AnimationPlayer.play("PressTapText")
	
	
func _input(event): # если мы касаемся экрана или тянем карту и пока палец нажат, работает поворот и анимация влево-вправо
	if  (event is InputEventScreenTouch and not event.is_pressed()): #event is InputEventScreenDrag or
		get_tree().change_scene("res://Scenes/MainScene.tscn")
#		get_tree().change_scene("res://Scenes/TestScene.tscn")
