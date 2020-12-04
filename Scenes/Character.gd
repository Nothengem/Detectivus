extends Sprite

signal CardDie 
var boundary = 5 #переменная отвечающая за дальность переноса карты мышью
var card_radius = Vector2(32, 32)
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
	$Stick/CharacterCard/CharacterPortrait.texture = load(Global.CardImage)
	$Stick/CharacterCard/Control/RightChooseRect/RChooseText.text = Global.CardRAnswer
	$Stick/CharacterCard/Control/LeftChooseRect/LChooseText.text = Global.CardLAnswer
	start_positionX = $Stick.position.x
	start_positionY = $Stick.position.y
	$AnimationPlayer.play("Appearance")


func _process(delta):
	choosedone()


func _get_button_pos(): #нужна для получения позиции карты
	return $Stick.position


func _input(event): # если мы касаемся экрана или тянем карту и пока палец нажат, работает поворот и анимация влево-вправо
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		global_position = event.position
		rotationos()
		leftrightanimation()
		chooseanimationRight()
		chooseanimationLeft()

		if _get_button_pos().length() > boundary:
			print(_get_button_pos().length())
			set_position(_get_button_pos().normalized() * boundary)
			rotationos()

	if event is InputEventScreenTouch:
		if not event.pressed:
			_on_touch_released(event)


func _on_touch_released(event):
	if $Stick.position.x < start_positionX -70:
		$Tween.interpolate_property($Stick/CharacterCard, "position", $Stick/CharacterCard.position, 
		$Stick/LeftChoose.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()


	if $Stick.position.x > start_positionX +70:
		$Tween.interpolate_property($Stick/CharacterCard, "position", $Stick/CharacterCard.position, 
		$Stick/RightChoose.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()


func leftrightanimation(): #анимация плавного перекана влево-вправо-вцентр
	if ($Stick.position.x) > start_positionX +35:
		$Tween.interpolate_property($Stick/CharacterCard, "position", $Stick/CharacterCard.position, 
		$Stick/RightPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

	elif ($Stick.position.x) < start_positionX -35:
		$Tween.interpolate_property($Stick/CharacterCard, "position", $Stick/CharacterCard.position, 
		$Stick/LeftPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

	elif ($Stick.position.x) > -2 and ($Stick.position.x) < 2:
		$Tween.interpolate_property($Stick/CharacterCard, "position", $Stick/CharacterCard.position, 
		$Stick/MiddlePosition.position, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

func rotationos(): # анимация поворота при смещении влево-вправо
	if ($Stick.position.x) > start_positionX:
		$Stick.rotation_degrees = $Stick.position.x * 2
	elif ($Stick.position.x) < start_positionX:
		$Stick.rotation_degrees = $Stick.position.x * 2

func chooseanimationRight ():
	$AnimationPlayer.play("RChooseText")
	fingerseek = $Stick.position.x/50
	$AnimationPlayer.seek(fingerseek, true)
	$AnimationPlayer.stop()


func chooseanimationLeft ():
	$AnimationPlayer.play("LChooseText")
	fingerseek = $Stick.position.x/-50
	$AnimationPlayer.seek(fingerseek, true)
	$AnimationPlayer.stop()

func choosedone (): #в инпут
	if $Stick/CharacterCard.position == $Stick/LeftChoose.position:
		emit_signal("CardDie")
		queue_free()

	if $Stick/CharacterCard.position == $Stick/RightChoose.position:
		emit_signal("CardDie")
		queue_free()
