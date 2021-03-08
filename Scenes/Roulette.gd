extends Control

onready var CardY1 = $RouletteController/MiniCard1.global_position.y
onready var CardY2 = $RouletteController/MiniCard2.global_position.y
onready var CardY3 = $RouletteController/MiniCard3.global_position.y
onready var CardY4 = $RouletteController/MiniCard4.global_position.y
onready var CardY5 = $RouletteController/MiniCard5.global_position.y
onready var CardY6 = $RouletteController/MiniCard6.global_position.y
var AllYPositions
onready var BallanceChange = Scriptwriter.IventInfo[5]

#переменные сложности в данной мини-игре
var easy = ["SmallSuccess", "Nothing", "SmallLose", "SmallSuccess", "Nothing", "SmallLose"]
var middle = ["BigSuccess", "Nothing", "BigLose", "BigSuccess", "Nothing", "BigLose"]
var hard = ["SmallSuccess", "SmallLose", "BigLose", "SmallSuccess", "SmallLose", "BigLose"]
var easyMoneyUp = ["SmallSuccess", "MoneyUp", "SmallLose", "SmallSuccess", "MoneyUp", "SmallLose"]
var middleTeamDown = ["BigSuccess", "TeamDown", "BigLose", "BigSuccess", "TeamDown", "BigLose"]
var HardCustomersDown = ["SmallSuccess", "CustomersDown", "BigLose", "SmallSuccess", "CustomersDown", "BigLose"]
var difficult = [easy, middle, hard, easyMoneyUp, middleTeamDown, HardCustomersDown]
var Difficulty = 3

var ChoosenCardY
var choosen_picture

func _ready():
	Difficulty = difficult[Difficulty]
	$RouletteController/Timer.start()
	$RouletteController/AnimationPlayer.play("Appearance")
	MiniCardsGeneration()

func _process(delta):
	$RouletteController/MiniCard1/Coords.text = str($RouletteController/MiniCard1.global_position.y)
	$RouletteController/MiniCard2/Coords.text = str($RouletteController/MiniCard2.global_position.y)
	$RouletteController/MiniCard3/Coords.text = str($RouletteController/MiniCard3.global_position.y)
	$RouletteController/MiniCard4/Coords.text = str($RouletteController/MiniCard4.global_position.y)
	$RouletteController/MiniCard5/Coords.text = str($RouletteController/MiniCard5.global_position.y)
	$RouletteController/MiniCard6/Coords.text = str($RouletteController/MiniCard6.global_position.y)
	

func MiniCardsGeneration():
	#применяем свойства к первой карточке
	$RouletteController/MiniCard1/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[0], ".png"))
	$RouletteController/MiniCard1/Cardcontainer/MiniCardName.text = Difficulty[0]
#	MiniCardsGeneration_helper(Difficulty[0], $RouletteController/MiniCard1/Cardcontainer/MiniCardDescription)
	
	#применяем свойства к второй карточке
	$RouletteController/MiniCard2/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[1], ".png"))
	$RouletteController/MiniCard2/Cardcontainer/MiniCardName.text = Difficulty[1]
#	MiniCardsGeneration_helper(Difficulty[1], $RouletteController/MiniCard2/Cardcontainer/MiniCardDescription)
	
	#применяем свойства к третьей карточке
	$RouletteController/MiniCard3/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[2], ".png"))
	$RouletteController/MiniCard3/Cardcontainer/MiniCardName.text = Difficulty[2]
#	MiniCardsGeneration_helper(Difficulty[2], $RouletteController/MiniCard3/Cardcontainer/MiniCardDescription)
	
	#применяем свойства к четвертой карточке
	$RouletteController/MiniCard4/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[3], ".png"))
	$RouletteController/MiniCard4/Cardcontainer/MiniCardName.text = Difficulty[3]
#	MiniCardsGeneration_helper(Difficulty[3], $RouletteController/MiniCard4/Cardcontainer/MiniCardDescription)
	
	#применяем свойства к пятой карточке
	$RouletteController/MiniCard5/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[4], ".png"))
	$RouletteController/MiniCard5/Cardcontainer/MiniCardName.text = Difficulty[4]
#	MiniCardsGeneration_helper(Difficulty[4], $RouletteController/MiniCard5/Cardcontainer/MiniCardDescription)
	
	#применяем свойства к шестой карточке
	$RouletteController/MiniCard6/Cardcontainer/Picture.texture = load (str ("res://Resources/GFX/mini_cards", "/", Difficulty[5], ".png"))
	$RouletteController/MiniCard6/Cardcontainer/MiniCardName.text = Difficulty[5]
#	MiniCardsGeneration_helper(Difficulty[5], $RouletteController/MiniCard6/Cardcontainer/MiniCardDescription)




#func MiniCardsGeneration_helper(a, b):
#	if a == "SmallLose" or a == "BigLose":
#		b.text = CardBadText
#	elif a == "SmallSuccess" or a == "BigSuccess":
#		b.text = CardGoodText
#	elif a == "Nothing" or a != "SmallLose" or a != "BigLose":
#		b.text = CardNeutralText



func _on_Timer_timeout():
	$RouletteController/Tween.interpolate_property($RouletteController, "rotation_degrees", $RouletteController.rotation_degrees, int($RouletteController.rotation_degrees+360), $RouletteController/Timer.wait_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$RouletteController/Tween.start()
	



func _on_TouchScreenButton_released():
	roulette_stop()



func _on_AnimationPlayer_animation_finished(Appearance):
	$TouchScreenButton.visible = true



func roulette_stop():
	$RouletteController/Timer.stop()
	$TouchScreenButton.visible = false
	$RouletteController/Tween.interpolate_property($RouletteController, "rotation_degrees", $RouletteController.rotation_degrees, int($RouletteController.rotation_degrees+180), 3, Tween.TRANS_BACK, Tween.EASE_OUT)
	$RouletteController/Tween.start()
	$RouletteController/UpdateVarY.start()


func _on_UpdateVarY_timeout():
	CardY1 = $RouletteController/MiniCard1.global_position.y
	CardY2 = $RouletteController/MiniCard2.global_position.y
	CardY3 = $RouletteController/MiniCard3.global_position.y
	CardY4 = $RouletteController/MiniCard4.global_position.y
	CardY5 = $RouletteController/MiniCard5.global_position.y
	CardY6 = $RouletteController/MiniCard6.global_position.y
	AllYPositions = [CardY1, CardY2, CardY3, CardY4, CardY5, CardY6]
	position_calculate()
	result()
	get_tree().call_group("BalanceGUI", "change_proportions_ivent_cardmix") #ну на самом деле это не луз. Просто эта функция подходит для выполнения поставленной задачи
	get_tree().call_group("MainScene", "spawn")
	queue_free()

func position_calculate():
	ChoosenCardY = AllYPositions[0]
	var uno = 0
	for i in 6:
		print(ChoosenCardY)
		print(uno)
		if ChoosenCardY <= AllYPositions[uno]:
			ChoosenCardY = AllYPositions[uno]
		uno += 1
			
	if ChoosenCardY == CardY1:
		choosen_picture = Difficulty[0]
	elif ChoosenCardY == CardY2:
		choosen_picture = Difficulty[1]
	elif ChoosenCardY == CardY3:
		choosen_picture = Difficulty[2]
	elif ChoosenCardY == CardY4:
		choosen_picture = Difficulty[3]
	elif ChoosenCardY == CardY5:
		choosen_picture = Difficulty[4]
	elif ChoosenCardY == CardY6:
		choosen_picture = Difficulty[5]
	print(choosen_picture)



func result():
	choosen_picture = Scriptwriter.MiniCardDataBase.DATA.get(choosen_picture)
	print(choosen_picture)
	print(BallanceChange)
	if choosen_picture[0] == "ChangeBalance":
		choosen_picture = choosen_picture[1]
		print(choosen_picture)
		if BallanceChange == "Team":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var + choosen_picture
		elif BallanceChange == "Customers":
			Scriptwriter.Law_var = Scriptwriter.Law_var + choosen_picture
		elif BallanceChange == "CentralBank":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + choosen_picture
		elif BallanceChange == "Money":
			print("1. Money = ", Scriptwriter.Luck_var)
			Scriptwriter.Luck_var = Scriptwriter.Luck_var + choosen_picture
			print("2. Money = ", Scriptwriter.Luck_var)
		Scriptwriter.CardChoose = Scriptwriter.NextCardLeft
	elif choosen_picture[0] == "Status":
		Scriptwriter.CardChoose = choosen_picture[1]

