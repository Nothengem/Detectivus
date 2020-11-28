extends Sprite

var boundary = 5 #переменная отвечающая за дальность переноса карты мышью
var start_positionX #запоминает стартовую позицию по X, чтобы от неё вести рассчеты наклона и события лево-право
var CharacterCard # для запоминания карты, чтобы влиять на её позицию
var CharacterBack # тоже самое, что и сверху но для заднего фона карты
var LeftPosition # точка приломляющая левый выбор
var RightPosition # точка приломляющая правый выбор
var MiddlePosition # точка приломляющая карту к центру
var IsInTouch = false #используем, чтобы игра понимала, что сейчас мы держим палец на экране
var LeftChoosePosition
var	RightChoosePosition

func _ready():
	#yield(get_tree(), "idle_frame")
	$CharacterControl/CharacterPortrait.texture = load(Global.CardImage)
	print(Global.CardName)
	print(position)
	start_positionX = position.x
	CharacterCard = $CharacterControl/CharacterPortrait
	CharacterBack = $CharacterControl/CharacterCard
	LeftPosition = $CharacterControl/LeftPosition
	RightPosition = $CharacterControl/RightPosition
	MiddlePosition = $CharacterControl/MiddlePosition
	LeftChoosePosition = $CharacterControl/LeftChoose
	RightChoosePosition = $CharacterControl/RightChoose
	
	
func get_button_pos(): #нужна для получения позиции карты
	return position

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			_on_touch_pressed(event)
		elif not event.pressed:
			_on_touch_released(event)
	
func _on_touch_pressed(event):
	pass
	
func _on_touch_released(event):
	if position.x < -3:
		$CharacterControl/Tween.interpolate_property(CharacterCard, "position", CharacterCard.position, 
		LeftChoosePosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()
		
		$CharacterControl/Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		LeftChoosePosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()
	
	if position.x > 3:
		$CharacterControl/Tween.interpolate_property(CharacterCard, "position", CharacterCard.position, 
		RightChoosePosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()
		
		$CharacterControl/Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		RightChoosePosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()
	print(position.x, "< ", -4)
		


func _input(event): # если мы касаемся экрана или тянем карту и пока палец нажат, работает поворот и анимация влево-вправо
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		global_position = event.position
		#print (event is InputEventScreenTouch and event.is_pressed())
		rotationos()
		leftrightanimation()

		if get_button_pos().length() > boundary:
			set_position(get_button_pos().normalized() * boundary)
			rotationos()


func leftrightanimation(): #анимация плавного перекана влево-вправо-вцентр
	if (position.x) > 7:
		$CharacterControl/Tween.interpolate_property(CharacterCard, "position", CharacterCard.position, 
		RightPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()
	
		$CharacterControl/Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		RightPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()

	elif (position.x) < -7:
		$CharacterControl/Tween.interpolate_property(CharacterCard, "position", CharacterCard.position, 
		LeftPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()
		
		$CharacterControl/Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		LeftPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()

	elif (position.x) > -2 and (position.x) < 2:
		$CharacterControl/Tween.interpolate_property(CharacterCard, "position", CharacterCard.position, 
		MiddlePosition.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()
		
		$CharacterControl/Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		MiddlePosition.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CharacterControl/Tween.start()

#func leftrightchoose():
#	if (position.x) > 0:
#		boundary = 50
#		$AnimationPlayer.play("LeftChoose")
	
func rotationos(): # анимация поворота при смещении влево-вправо
	if (position.x) > start_positionX:
		rotation_degrees = position.x * 2
	elif (position.x) < start_positionX:
		rotation_degrees = position.x * 2
