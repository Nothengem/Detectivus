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
var RightChoosePosition 
var fingerseek #переменная для срабатывания анимации шторки ответа

func _ready():
	start_positionX = position.x
	CharacterBack = $CharacterCard
	LeftPosition = $LeftPosition
	RightPosition = $RightPosition
	MiddlePosition = $MiddlePosition
	LeftChoosePosition = $LeftChoose
	RightChoosePosition = $RightChoose
	if !Scriptwriter.Heath_var <= 0 and !Scriptwriter.Law_var <= 0 and !Scriptwriter.Banditism_var <= 0 and !Scriptwriter.Luck_var <= 0 and !Scriptwriter.Heath_var >= 100 and !Scriptwriter.Law_var >= 100 and !Scriptwriter.Banditism_var >= 100 and !Scriptwriter.Luck_var >= 100:
		if Scriptwriter.FirstCard == true:
			Scriptwriter.CardChoose = "Tutorial1"
			Scriptwriter.card_var_generator()
			Scriptwriter.FirstCard = false
			
		elif !Scriptwriter.FirstCard and Scriptwriter.CardType == "Tutorial" and Scriptwriter.CardType != "Characters":
			Scriptwriter.card_var_generator()
			$CharacterCard/Control/AnimationPlayer.play("Appearance")
			
		elif !Scriptwriter.FirstCard and Scriptwriter.CardChoose == "Random":
			Scriptwriter.card_var_generator()
			
		elif !Scriptwriter.FirstCard and !Scriptwriter.CardChoose == "Random" and !Scriptwriter.CardChoose == "Tutorial":
			Scriptwriter.card_var_generator()
			$CharacterCard/Control/AnimationPlayer.play("Appearance")
			
	elif Scriptwriter.Heath_var <= 0 or Scriptwriter.Law_var <= 0 or Scriptwriter.Banditism_var <= 0 or Scriptwriter.Luck_var <= 0 or Scriptwriter.Heath_var >= 100 or Scriptwriter.Law_var >= 100 or Scriptwriter.Banditism_var >= 100 or Scriptwriter.Luck_var >= 100:
		Scriptwriter.losecard()
		get_tree().call_group("MainScene", "background_fade")

func _process(delta):
	choosedone()
	
func card_generation():
	$CharacterCard/CharacterPortrait.texture = load(Scriptwriter.CardImage)
	if !Scriptwriter.Heath_var <= 0 and !Scriptwriter.Law_var <= 0 and !Scriptwriter.Banditism_var <= 0 and !Scriptwriter.Luck_var <= 0 and !Scriptwriter.Heath_var >= 100 and !Scriptwriter.Law_var >= 100 and !Scriptwriter.Banditism_var >= 100 and !Scriptwriter.Luck_var >= 100:
		$CharacterCard/Control/RightChooseRect/RChooseText.text = Scriptwriter.CardRAnswer
		$CharacterCard/Control/LeftChooseRect/LChooseText.text = Scriptwriter.CardLAnswer
	elif Scriptwriter.Heath_var <= 0 or Scriptwriter.Law_var <= 0 or Scriptwriter.Banditism_var <= 0 or Scriptwriter.Luck_var <= 0 or Scriptwriter.Heath_var >= 100 or Scriptwriter.Law_var >= 100 or Scriptwriter.Banditism_var >= 100 or Scriptwriter.Luck_var >= 100:
		$CharacterCard/Control/RightChooseRect/RChooseText.text = "Ой, кажется банку конец..."
		$CharacterCard/Control/LeftChooseRect/LChooseText.text = "У нас случилось ЧП..."

func _get_button_pos(): #нужна для получения позиции карты
	return position

func _input(event): # если мы касаемся экрана или тянем карту и пока палец нажат, работает поворот и анимация влево-вправо
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		global_position = event.position
		rotationos()
		_leftrightanimation()
		if Scriptwriter.CardType == "Characters" or Scriptwriter.CardType == "Tutorial":
			chooseanimationRight()
			chooseanimationLeft()
			
		if _get_button_pos().length() > boundary:
			set_position(_get_button_pos().normalized() * boundary)
			rotationos()
			
	if event is InputEventScreenTouch:
		if not event.pressed:
			_on_touch_released(event)
			choosedone()
			

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
	if (position.x) > 5:
		$Tween.interpolate_property(CharacterBack, "position", CharacterBack.position, 
		RightPosition.position, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()

	elif (position.x) < -5:
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

func chooseanimationRight():
	$CharacterCard/Control/AnimationPlayer.play("RChooseText")
	fingerseek = position.x/250
	$CharacterCard/Control/AnimationPlayer.seek(fingerseek, true)
	$CharacterCard/Control/AnimationPlayer.stop()
	
	
	
func chooseanimationLeft():
	$CharacterCard/Control/AnimationPlayer.play("LChooseText")
	fingerseek = position.x/-250
	$CharacterCard/Control/AnimationPlayer.seek(fingerseek, true)
	$CharacterCard/Control/AnimationPlayer.stop()



func choosedone():
	if $CharacterCard.position == $LeftChoose.position:
		if Scriptwriter.CardType =="Tutorial":
			Scriptwriter.CardChoose = Scriptwriter.NextCardLeft
			choosedone_next_card_left()
		
		elif Scriptwriter.CardType == "Characters" or Scriptwriter.CardType == "Tutorial" or Scriptwriter.CardType == "Resuilt":
			if Scriptwriter.CardType == "Characters":
				Scriptwriter.victory_count += 1
			Scriptwriter.CardChoose = Scriptwriter.NextCardLeft
			get_tree().call_group("BalanceGUI", "victory_count_update")
			get_tree().call_group("BalanceGUI", "change_proportions_left")
			choosedone_next_card_left()

			
		elif Scriptwriter.CardType == "LooseScreen":
			choosedone_loose()
			

	if $CharacterCard.position == $RightChoose.position:
		if Scriptwriter.CardType =="Tutorial":
			Scriptwriter.CardChoose = Scriptwriter.NextCardRight
			choosedone_next_card_right()
		
		elif Scriptwriter.CardType == "Characters" or Scriptwriter.CardType == "Tutorial" or Scriptwriter.CardType == "Resuilt":
			if Scriptwriter.CardType == "Characters":
				Scriptwriter.victory_count += 1
			Scriptwriter.CardChoose = Scriptwriter.NextCardRight
			get_tree().call_group("BalanceGUI", "victory_count_update")
			get_tree().call_group("BalanceGUI", "change_proportions_right")
			choosedone_next_card_right()

			
		elif Scriptwriter.CardType == "LooseScreen":
			choosedone_loose()


#func choosedone_next_card():
#	if Scriptwriter.victory_count < Scriptwriter.count_to_victory:
#
#		if Scriptwriter.NextCardRight == "Ivent":
#			get_tree().call_group("MainScene", "spawn_dice")
#		elif Scriptwriter.NextCardRight != "Ivent":
#			get_tree().call_group("MainScene", "spawn")

func choosedone_next_card_right():	
	get_tree().call_group("BalanceGIU", "debug_print")
	if Scriptwriter.victory_count < Scriptwriter.count_to_victory:
		
		if Scriptwriter.NextCardRight == "Ivent":
			get_tree().call_group("MainScene", "spawn_dice")
		elif Scriptwriter.NextCardRight != "Ivent":
			get_tree().call_group("MainScene", "spawn")
			
	elif Scriptwriter.victory_count == Scriptwriter.count_to_victory:
		get_tree().call_group("MainScene", "win_the_game")
	$"..".queue_free()
	


func choosedone_next_card_left():
	if Scriptwriter.victory_count < Scriptwriter.count_to_victory:
		
		if Scriptwriter.NextCardLeft == "Ivent":
			get_tree().call_group("MainScene", "spawn_dice")
		elif Scriptwriter.NextCardLeft != "Ivent":
			get_tree().call_group("MainScene", "spawn")
			
	elif Scriptwriter.victory_count == Scriptwriter.count_to_victory:
		get_tree().call_group("MainScene", "win_the_game")
	$"..".queue_free()
		
		
		
func choosedone_loose():
	Scriptwriter.victory_count = 0
	get_tree().call_group("MainScene", "restart_game")
	$"..".queue_free()
		
#func dark_theme_card():
#	$CharacterCard/Control/DarkTheme.play("DarkThemeCard")
