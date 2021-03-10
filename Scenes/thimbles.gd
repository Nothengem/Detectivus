extends Control

#приваивание переменных нодам, для оптимизации кода
onready var Animator = get_node("AnimationPlayer")
onready var Time = get_node("Timer_start")
onready var Twee = get_node("MiniCards/Tween")

#переменные точек где располагаются карты
onready var LeftPosition = get_node("Positions/LeftPosition")
onready var CentrePosition = get_node("Positions/CentrePosition")
onready var RightPosition = get_node("Positions/RightPosition")
onready var PositionsMassive = [LeftPosition.position, CentrePosition.position, RightPosition.position]
var card_layer_position = [0, 1, 2]

#переменная для рандомайзера
var my_random_number

#переменные для точек куда заходят карты
var points_siquence

#переменная для остановки анимации перемешивания
var stoper = 0

#переменные для выбора какие карты будут меняться местами
var first_card
var second_card

#переменная обозначающая выбранную карту
var choosen_mini_card
#картинка карты, которую выбрал игрок
var choosen_picture

#массив сложностей с ключами карт из MiniCardDataBase
var easy = ["SmallSuccess", "Nothing", "SmallLose"]
var middle = ["BigSuccess", "Nothing", "BigLose"]
var hard = ["SmallSuccess", "SmallLose", "BigLose"]
var easyMoneyUp = ["SmallSuccess", "MoneyUp", "SmallLose"]
var middleTeamDown = ["BigSuccess", "TeamDown", "BigLose"]
var HardCustomersDown = ["SmallSuccess", "CustomersDown", "BigLose"]
var difficult = [easy, middle, hard, easyMoneyUp, middleTeamDown, HardCustomersDown]

#присваивание переменных ивента
onready var IventName = Scriptwriter.IventInfo[0]
onready var Difficulty = Scriptwriter.IventInfo[1]
onready var CardBadText = Scriptwriter.IventInfo[2]
onready var CardGoodText = Scriptwriter.IventInfo[3]
onready var CardNeutralText = Scriptwriter.IventInfo[4]
onready var BallanceChange = Scriptwriter.IventInfo[5]



func _ready():
	Animator.play("Apperiance")
	$Timer_start.wait_time = 3
	$Timer_start.start()
	Difficulty = difficult[Difficulty]
	MiniCardsGeneration()


func MiniCardsGeneration():
	#применяем свойства к первой карточке
	$MiniCards/MiniCard1/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[0], ".png"))
	$MiniCards/MiniCard1/Cardcontainer/MiniCardName.text = Difficulty[0]
	MiniCardsGeneration_helper(Difficulty[0], $MiniCards/MiniCard1/Cardcontainer/MiniCardDescription)
	#второй
	$MiniCards/MiniCard2/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[1], ".png"))
	$MiniCards/MiniCard2/Cardcontainer/MiniCardName.text = Difficulty[1]
	MiniCardsGeneration_helper(Difficulty[1], $MiniCards/MiniCard2/Cardcontainer/MiniCardDescription)
	#третьей
	$MiniCards/MiniCard3/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[2], ".png"))
	$MiniCards/MiniCard3/Cardcontainer/MiniCardName.text = Difficulty[2]
	MiniCardsGeneration_helper(Difficulty[2], $MiniCards/MiniCard3/Cardcontainer/MiniCardDescription)

func MiniCardsGeneration_helper(a, b):
	if a == "SmallLose" or a == "BigLose":
		b.text = CardBadText
	elif a == "SmallSuccess" or a == "BigSuccess":
		b.text = CardGoodText
	elif a == "Nothing" or a != "SmallLose" or a != "BigLose":
		b.text = CardNeutralText

func randomazer():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	my_random_number = int(rng.randf_range(1, 6))



func _on_Timer_start_timeout():
	get_tree().call_group("MiniCard", "flip_the_shirt")
	cards_mix_generate()



func _on_Timer_midle_timeout():
		cards_mix_generate()
		$MiniCards/MiniCard1.z_index = card_layer_position[0]
		$MiniCards/MiniCard2.z_index = card_layer_position[1]
		$MiniCards/MiniCard3.z_index = card_layer_position[2]
		$Timer_repeat.wait_time = 0.5
		$Timer_repeat.start()




func _on_Timer_repeat_timeout():
	if stoper != 3:
		cards_mix_generate()
		stoper = stoper +1
	elif stoper == 3:
		$Timer_middle.stop()
		$Timer_start.one_shot = true
		get_tree().call_group("MiniCard", "activate_choose_button")



func cards_mix_generate():
	var mini_cards = [$MiniCards/MiniCard1, $MiniCards/MiniCard2, $MiniCards/MiniCard3]
	mini_cards.shuffle()
	var first_card = mini_cards[0]
	var second_card = mini_cards[1]
	cards_mix(first_card, second_card)



func cards_mix(start, end):
	Twee.interpolate_property(start, "position", start.position, end.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	Twee.start()
	Twee.interpolate_property(end, "position", end.position, start.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	Twee.start()
	$Timer_middle.start()



func all_minicard_centre():
	card_layer_position.shuffle()
	PositionsMassive.shuffle()
	$Timer_middle.start()
	Twee.interpolate_property($MiniCards/MiniCard1, "position", $MiniCards/MiniCard1.position, $Positions/CentrePosition.position, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Twee.start()
	Twee.interpolate_property($MiniCards/MiniCard3, "position", $MiniCards/MiniCard3.position, $Positions/CentrePosition.position, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Twee.start()
	Twee.interpolate_property($MiniCards/MiniCard2, "position", $MiniCards/MiniCard2.position, $Positions/CentrePosition.position, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Twee.start()



func all_minicard_parse():
	Twee.interpolate_property($MiniCards/MiniCard1, "position", $MiniCards/MiniCard1.position, PositionsMassive[0], 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()
	Twee.interpolate_property($MiniCards/MiniCard2, "position", $MiniCards/MiniCard2.position, PositionsMassive[1], 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()
	Twee.interpolate_property($MiniCards/MiniCard3, "position", $MiniCards/MiniCard3.position, PositionsMassive[2], 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()



func Timer_start_final_anim():
	$Timer_start_final_anim.start()



func _on_Timer_start_final_anim_timeout():
	if $MiniCards/MiniCard1/Shirt.visible == false:
		choosen_mini_card = $MiniCards/MiniCard1
		choosen_picture = Difficulty[0]
	elif $MiniCards/MiniCard2/Shirt.visible == false:
		choosen_mini_card = $MiniCards/MiniCard2
		choosen_picture = Difficulty[1]
	elif $MiniCards/MiniCard3/Shirt.visible == false:
		choosen_mini_card = $MiniCards/MiniCard3
		choosen_picture = Difficulty[2]
	
	var b: Vector2 = get_parent().get_viewport().size/2 #позиция центра экрана
	
	
	Twee.interpolate_property(choosen_mini_card, "position", choosen_mini_card.position, b, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()
	Twee.interpolate_property(choosen_mini_card, "scale", choosen_mini_card.scale, Vector2(2, 2), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()
	$Timer_fade.start()



func _on_Timer_fade_timeout():
	Twee.interpolate_property(choosen_mini_card, "modulate", choosen_mini_card.modulate, Color("00ffffff"), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()
	result()
	get_tree().call_group("BalanceGUI", "change_proportions_ivent_cardmix") #ну на самом деле это не луз. Просто эта функция подходит для выполнения поставленной задачи
	get_tree().call_group("MainScene", "spawn")
	queue_free()



func result():
	choosen_picture = Scriptwriter.MiniCardDataBase.DATA.get(choosen_picture)
	if choosen_picture[0] == "ChangeBalance":
		choosen_picture = choosen_picture[1]
		if BallanceChange == "Team":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var + choosen_picture
		elif BallanceChange == "Customers":
			Scriptwriter.Law_var = Scriptwriter.Law_var + choosen_picture
		elif BallanceChange == "CentralBank":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + choosen_picture
		elif BallanceChange == "Money":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var + choosen_picture
		Scriptwriter.CardChoose = Scriptwriter.NextCardLeft
	elif choosen_picture[0] == "Status":
		Scriptwriter.CardChoose = choosen_picture[1]

