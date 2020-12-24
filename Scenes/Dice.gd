extends Control

var Dice = "Dice"

var DiceImage1
var DiceImage2
var DiceImage3
var DiceImage4

var Dice1Picked
var Dice2Picked
var Dice3Picked
var Dice4Picked
var PickedLimit = 2

func _ready():
	dice_generator1()
	dice_generator2()
	dice_generator3()
	dice_generator4()

func randomdice():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = int(rng.randf_range(1, 6))
	print(my_random_number)
	Dice = str(Dice) + str(my_random_number)
	print(Dice)

func dice_generator1():
	randomdice()
	DiceImage1 = str("res://Resources/GFX/Dice", "/", Dice, ".png")
	print(DiceImage1)
	$CenterContainer/VBoxContainer/HBoxContainer/Dice1.texture = load(DiceImage1)
	Dice = "Dice"
	
func dice_generator2():
	randomdice()
	DiceImage2 = str ("res://Resources/GFX/Dice", "/", Dice, ".png")
	$CenterContainer/VBoxContainer/HBoxContainer/Dice2.texture = load(DiceImage2)
	Dice = "Dice"

func dice_generator3():
	randomdice()
	DiceImage3 = str ("res://Resources/GFX/Dice", "/", Dice, ".png")
	$CenterContainer/VBoxContainer/HBoxContainer2/Dice3.texture = load(DiceImage3)
	Dice = "Dice"

func dice_generator4():
	randomdice()
	DiceImage4 = str ("res://Resources/GFX/Dice", "/", Dice, ".png")
	$CenterContainer/VBoxContainer/HBoxContainer2/Dice4.texture = load(DiceImage4)
	Dice = "Dice"
