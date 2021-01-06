extends NinePatchRect

var Dice = "Dice"
var DiceImage
var Dice_reroll = false #параметр для разделения на те которые нужно перебрасывать и те, которые не нужно
var my_random_number = 1
var picked = false #параметр, того что кубик выбран

func _ready():
	my_random_number = 1

func first_dice():
	randomdice()
	image_generator()
	$Cross.visible = true
	
	
func redice():
	if Dice_reroll == true:
		randomdice()
		image_generator()
		Dice_reroll = false
	$Cross.visible = false
	$Cross2.visible = false
	get_tree().call_group("Dice", "Dice_update")

func randomdice():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	my_random_number = int(rng.randf_range(1, 6))
	Dice = str(Dice) + str(my_random_number)

func image_generator():
	DiceImage = str("res://Resources/GFX/Dice", "/", Dice, ".png")
	texture = load(DiceImage)
	Dice = "Dice"

func _on_Cross_released():
	if picked == false:
		$Cross2.visible = true
		picked = true
		Dice_reroll = true
		get_tree().call_group("Dice", "number_update_plus")
	elif picked == true:
		$Cross2.visible = false
		picked = false
		get_tree().call_group("Dice", "number_update_minus")

func block_cross():
	if !picked:
		$Cross.visible = false

func unblock_cross():
	$Cross.visible = true
	
func hidecross():
	$Cross.visible = false

func hidecross2():
	$Cross2.visible = false
