extends TouchScreenButton

var boundary = 5 #переменная отвечающая за дальность переноса карты мышью
var start_positionX #запоминает стартовую позицию по X, чтобы от неё вести рассчеты наклона и события лево-право
var CharacterCard # для запоминания карты, чтобы влиять на её позицию
var CharacterBack # тоже самое, что и сверху но для заднего фона карты
var LeftPosition # точка приломляющая левый выбор
var RightPosition # точка приломляющая правый выбор
var MiddlePosition # точка приломляющая карту к центру
var IsInTouch = false #используем, чтобы игра понимала, что сейчас мы держим палец на экране
var LeftChoosePosition # используем 
var	RightChoosePosition 
var fingerseek #переменная для срабатывания анимации шторки ответа
var timeout = false #переменная для таймера

func _ready():
	#yield(get_tree(), "idle_frame")
	$CharacterCard/CharacterPortrait.texture = load(Global.CardImage)
	$CharacterCard/Control/RightChooseRect/RChooseText.text = Global.CardRAnswer
	$CharacterCard/Control/LeftChooseRect/LChooseText.text = Global.CardLAnswer
	start_positionX = position.x
	CharacterBack = $CharacterCard
	LeftPosition = $LeftPosition
	RightPosition = $RightPosition
	MiddlePosition = $MiddlePosition
	LeftChoosePosition = $LeftChoose
	RightChoosePosition = $RightChoose
	$CharacterCard/Control/AnimationPlayer.play("Appearance")

func _process(delta):
	print($CharacterCard.position.x)
	print($LeftChoose.position.x)
	pass
	choosedone()

func _get_button_pos(): #нужна для получения позиции карты
	return position

func _input(event): # если мы касаемся экрана или тянем карту и пока палец нажат, работает поворот и анимация влево-вправо
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		global_position = event.position
		rotationos()
		_leftrightanimation()
		chooseanimationRight()
		chooseanimationLeft()

		if _get_button_pos().length() > boundary:
			set_position(_get_button_pos().normalized() * boundary)
			rotationos()
			
	if event is InputEventScreenTouch:
		if not event.pressed:
			_on_touch_released(event)

func _on_touch_released(event):
	if position.x < -3:
		$Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		LeftChoosePosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()


	if position.x > 3:
		$Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		RightChoosePosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()


func _leftrightanimation(): #анимация плавного перекана влево-вправо-вцентр
	if (position.x) > 7:
		$Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		RightPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

	elif (position.x) < -7:
		$Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		LeftPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

	elif (position.x) > -2 and (position.x) < 2:
		$Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		MiddlePosition.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

func rotationos(): # анимация поворота при смещении влево-вправо
	if (position.x) > start_positionX:
		rotation_degrees = position.x * 2
	elif (position.x) < start_positionX:
		rotation_degrees = position.x * 2

func chooseanimationRight ():
	$CharacterCard/Control/AnimationPlayer.play("RChooseText")
	fingerseek = position.x/50
	$CharacterCard/Control/AnimationPlayer.seek(fingerseek, true)
	$CharacterCard/Control/AnimationPlayer.stop()


func chooseanimationLeft ():
	$CharacterCard/Control/AnimationPlayer.play("LChooseText")
	fingerseek = position.x/-50
	$CharacterCard/Control/AnimationPlayer.seek(fingerseek, true)
	$CharacterCard/Control/AnimationPlayer.stop()


func choosedone ():
	if $CharacterCard.position == $LeftChoose.position:
		print("yes")
		queue_free()
		Global.CardOnScreen == false
		spawn()
	if $CharacterCard.position == $RightChoose.position:
		print("yes")
		queue_free()
		Global.CardOnScreen == false
		spawn()
		
func spawn():
#	var scene = load("res://Scenes/Character.tscn")
#	var card = scene.instance()
#	add_child(card)
	Global.spawn()

func _on_Timer_timeout():
	timeout = false
	queue_free()
