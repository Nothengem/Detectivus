extends Area2D

#переменная фиксирующая предыдущую позицию мыши
var previous_mouse_position = Vector2()
var is_dragging = false

#переменная размера экрана
onready var screensize: Vector2 = get_parent().get_viewport().size
var screen_center

var start_position #запоминает стартовую позицию по X, чтобы от неё вести рассчеты наклона и события лево-право
onready var LChoosePos = get_node("LeftChoose") #точка, куда уходит карта при выборе на лево
onready var RChoosePos = get_node("RightChoose") #точка, куда уходит карта при выборе на право
onready var CardRAnswer = get_node("CharacterCard/Control/RightChooseRect/RChooseText") #текст правого ответа
onready var CardLAnswer = get_node("CharacterCard/Control/LeftChooseRect/LChooseText") #текст левого ответа
onready var Animator = get_node("AnimationPlayer") #текст левого ответа
var fingerseek #переменная для срабатывания анимации шторки ответа


#переменные для облегчения кода
onready var portrait = get_node("CharacterCard/CharacterPortrait")

func _ready():
	start_position = screensize/2
	Animator.play("Apperiance")
	
#	if !Scriptwriter.Heath_var <= 0 and !Scriptwriter.Law_var <= 0 and !Scriptwriter.Banditism_var <= 0 and !Scriptwriter.Luck_var <= 0 and !Scriptwriter.Heath_var >= 100 and !Scriptwriter.Law_var >= 100 and !Scriptwriter.Banditism_var >= 100 and !Scriptwriter.Luck_var >= 100:
#		if Scriptwriter.FirstCard == true:
#			Scriptwriter.CardChoose = "Tutorial1"
#			Scriptwriter.card_var_generator()
#			Scriptwriter.FirstCard = false
#
#		elif !Scriptwriter.FirstCard and Scriptwriter.CardType == "Tutorial" and Scriptwriter.CardType != "Characters":
#			Scriptwriter.card_var_generator()
#			Animator.play("Appearance")
#
#		elif !Scriptwriter.FirstCard and Scriptwriter.CardChoose == "Random":
#			Scriptwriter.card_var_generator()
#
#		elif !Scriptwriter.FirstCard and !Scriptwriter.CardChoose == "Random" and !Scriptwriter.CardChoose == "Tutorial":
#			Scriptwriter.card_var_generator()
#			Animator.play("Appearance")
#
#	elif Scriptwriter.Heath_var <= 0 or Scriptwriter.Law_var <= 0 or Scriptwriter.Banditism_var <= 0 or Scriptwriter.Luck_var <= 0 or Scriptwriter.Heath_var >= 100 or Scriptwriter.Law_var >= 100 or Scriptwriter.Banditism_var >= 100 or Scriptwriter.Luck_var >= 100:
#		Scriptwriter.losecard()



func card_generation():
	portrait.texture = load(Scriptwriter.CardImage)
	if !Scriptwriter.Heath_var <= 0 and !Scriptwriter.Law_var <= 0 and !Scriptwriter.Banditism_var <= 0 and !Scriptwriter.Luck_var <= 0 and !Scriptwriter.Heath_var >= 100 and !Scriptwriter.Law_var >= 100 and !Scriptwriter.Banditism_var >= 100 and !Scriptwriter.Luck_var >= 100:
		CardRAnswer.text = Scriptwriter.CardRAnswer
		CardLAnswer.text = Scriptwriter.CardLAnswer
	elif Scriptwriter.Heath_var <= 0 or Scriptwriter.Law_var <= 0 or Scriptwriter.Banditism_var <= 0 or Scriptwriter.Luck_var <= 0 or Scriptwriter.Heath_var >= 100 or Scriptwriter.Law_var >= 100 or Scriptwriter.Banditism_var >= 100 or Scriptwriter.Luck_var >= 100:
		CardRAnswer.text = "Ой, кажется банку конец..."
		CardLAnswer.text = "У нас случилось ЧП..."



func _process(delta):
	choosedone()



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



func choosedone_next_card_left():
	if Scriptwriter.victory_count < Scriptwriter.count_to_victory:
			
		if Scriptwriter.NextCardLeft == "Ivent":
			get_tree().call_group("MainScene", "spawn_dice")
		elif Scriptwriter.NextCardLeft != "Ivent":
			get_tree().call_group("MainScene", "spawn")
		
	elif Scriptwriter.victory_count == Scriptwriter.count_to_victory:
		get_tree().call_group("MainScene", "win_the_game")
	queue_free()



func choosedone_next_card_right():	
	get_tree().call_group("BalanceGIU", "debug_print")
	if Scriptwriter.victory_count < Scriptwriter.count_to_victory:
			
		if Scriptwriter.NextCardRight == "Ivent":
			get_tree().call_group("MainScene", "spawn_dice")
		elif Scriptwriter.NextCardRight != "Ivent":
			get_tree().call_group("MainScene", "spawn")
		
	elif Scriptwriter.victory_count == Scriptwriter.count_to_victory:
		get_tree().call_group("MainScene", "win_the_game")
	queue_free()



func choosedone_loose():
	Scriptwriter.victory_count = 0
	get_tree().call_group("MainScene", "restart_game")
	queue_free()



#событие срабатывающие при касанию пальца по экрану
func _on_CharacterControl2_input_event(viewport, event, shape_idx):
		if event.is_action_pressed("ui_touch"):
			get_tree().set_input_as_handled()
			previous_mouse_position = event.position
			is_dragging = true



func _input(event):
	if not is_dragging:
		return
		
	if event.is_action_released("ui_touch"):
		previous_mouse_position = Vector2()
		is_dragging = false
		
	if is_dragging and event is InputEventMouseMotion:
		position += event.position - previous_mouse_position
		previous_mouse_position = event.position
		rotationos()
		chooseanimationRight()
		chooseanimationLeft()
		if Scriptwriter.CardType == "Characters" or Scriptwriter.CardType == "Tutorial":
			chooseanimationRight()
			chooseanimationLeft()



func rotationos(): # анимация поворота при смещении влево-вправо
	if (position.x) > start_position.x:
		var a = position.x - start_position.x
		a = a * 0.08
		rotation_degrees = a
	elif (position.x) < start_position.x:
		var a = position.x - start_position.x
		a = a * 0.08
		rotation_degrees = a


func chooseanimationRight():
	Animator.play("RChooseText")
	var a = start_position.x
	var b = start_position.x*3
	fingerseek = (position.x - a)/b
	Animator.seek(fingerseek, true)
	Animator.stop()



func chooseanimationLeft():
	Animator.play("LChooseText")
	var a = start_position.x
	var b = start_position.x*3
	fingerseek = -(position.x - a)/b
	print(fingerseek)
	Animator.seek(fingerseek, true)
	Animator.stop()
