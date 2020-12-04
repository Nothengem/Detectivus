extends TouchScreenButton

signal CardDie 
var boundary = 5 #переменная отвечающая за дальность переноса карты мышью
var start_positionX #запоминает стартовую позицию по X, чтобы от неё вести рассчеты наклона и события лево-право
var start_positionY
var fingerseek #переменная для срабатывания анимации шторки ответа
var info = {
	card_image = "",
	card_name = "",
	card_text = "",
	card_r_answer = "",
	card_l_answer = ""
}

func _ready():
	$CharacterCard/CharacterPortrait.texture = load(Global.CardImage)
	$CharacterCard/Control/RightChooseRect/RChooseText.text = Global.CardRAnswer
	$CharacterCard/Control/LeftChooseRect/LChooseText.text = Global.CardLAnswer
	start_positionX = position.x
	start_positionY = position.y
	$AnimationPlayer.play("Appearance")
#	boundary = $MiddlePosition.position

#func _process(delta):
#	choosedone()
#	print (position)

func _get_button_pos(): #нужна для получения позиции карты
	return position
#	print (position)

func _input(event): # если мы касаемся экрана или тянем карту и пока палец нажат, работает поворот и анимация влево-вправо
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		global_position = event.position
#		rotationos()
#		leftrightanimation()
#		chooseanimationRight()
#		chooseanimationLeft()

		if _get_button_pos().length() > boundary:
			print(_get_button_pos().normalized())
			set_position(_get_button_pos().normalized() * boundary)
#			rotationos()

	if event is InputEventScreenTouch:
		if not event.pressed:
			pass
#			_on_touch_released(event)


#func _on_touch_released(event):
#	if position.x < start_positionX -7:
#		$Tween.interpolate_property($CharacterCard, "position", $CharacterCard.position, 
#		$LeftChoose.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		$Tween.start()
#
#
#	if position.x > start_positionX +7:
#		$Tween.interpolate_property($CharacterCard, "position", $CharacterCard.position, 
#		$RightChoose.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		$Tween.start()
#
#
#func leftrightanimation(): #анимация плавного перекана влево-вправо-вцентр
#	if (position.x) > start_positionX +35:
#		$Tween.interpolate_property($CharacterCard, "position", $CharacterCard.position, 
#		$RightPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		$Tween.start()
#
#	elif (position.x) < start_positionX -35:
#		$Tween.interpolate_property($CharacterCard, "position", $CharacterCard.position, 
#		$LeftPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		$Tween.start()
#
#	elif (position.x) > -2 and (position.x) < 2:
#		$Tween.interpolate_property($CharacterCard, "position", $CharacterCard.position, 
#		$MiddlePosition.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		$Tween.start()
#
#func rotationos(): # анимация поворота при смещении влево-вправо
#	if (position.x) > start_positionX:
#		rotation_degrees = position.x * 2
#	elif (position.x) < start_positionX:
#		rotation_degrees = position.x * 2
#
#func chooseanimationRight ():
#	$AnimationPlayer.play("RChooseText")
#	fingerseek = position.x/50
#	$AnimationPlayer.seek(fingerseek, true)
#	$AnimationPlayer.stop()
#
#
#func chooseanimationLeft ():
#	$AnimationPlayer.play("LChooseText")
#	fingerseek = position.x/-50
#	$AnimationPlayer.seek(fingerseek, true)
#	$AnimationPlayer.stop()
#
#func choosedone (): #в инпут
#	if $CharacterCard.position == $LeftChoose.position:
#		emit_signal("CardDie")
#		queue_free()
#
#	if $CharacterCard.position == $RightChoose.position:
#		emit_signal("CardDie")
#		queue_free()
#
