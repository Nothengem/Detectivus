extends NinePatchRect

var Dice = "Dice"
var DiceImage
var DicePicked
var my_random_number = 1
var picked = false #параметр, того что кубик выбран
var cross_active = 0

func _ready():
	my_random_number = 1

func first_dice():
	randomdice()
	image_generator()
	$Cross.visible = true
	
func redice():
	if picked:
		randomdice()
		image_generator()
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
		cross_active = 1
		get_tree().call_group("Dice", "number_update_plus")
	elif picked == true:
		$Cross2.visible = false
		picked = false
		cross_active = 0
		get_tree().call_group("Dice", "number_update_minus")

func block_cross():
	if !picked:
		$Cross.visible = false

func unblock_cross():
	$Cross.visible = true
	
func hidecross():
	$Cross.visible = false
