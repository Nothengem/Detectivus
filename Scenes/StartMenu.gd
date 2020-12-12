extends Control

func _ready():
	$AnimationPlayer.play("PressTapText")
#	MainScene.StartScreenTouchBlock = true
	
	
func _input(event): # если мы касаемся экрана или тянем карту и пока палец нажат, работает поворот и анимация влево-вправо
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and not event.is_pressed()):
		queue_free()

