extends Control

var Dice
var Dice2
var Dice3
var Dice4
var victory_number = 0
var limited_dice = 2
var Dice_active
var Dice2_active
var Dice3_active
var Dice4_active
var Dice_active_mass = 0 #количество выбранных костей
var first_dice = true

var Dice_test
var Dice2_test
var count_test

func _ready():
	$Apperiance.play("Appearance")
	Dice = 1
	Dice2 = 1
	Dice3 = 1
	Dice4 = 1
	Dice_test = get_node("NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice")
	Dice2_test = get_node("NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice2")

func _on_Dice4_ready():
	Dice_update()

func Dice_update():
	Dice = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice.my_random_number
	Dice2 = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice2.my_random_number
	Dice3 = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice3.my_random_number
	Dice4 = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice4.my_random_number

func counter():
	victory_number = Dice + Dice2 + Dice3 + Dice4
	$Label.text = str(victory_number)
	count_test = Dice_test.my_random_number + Dice2_test.my_random_number
	print(count_test)

func number_update_plus():
	if Dice_active_mass < limited_dice:
		Dice_active_mass = Dice_active_mass + 1
		limit_control()
		button_blocker()
		
func number_update_minus():
	if Dice_active_mass != 0:
		Dice_active_mass = Dice_active_mass - 1
		limit_control()
		button_blocker()

func limit_control():
	if Dice_active_mass == limited_dice:
		get_tree().call_group("Dice2", "block_cross")
	elif Dice_active_mass < limited_dice:
		get_tree().call_group("Dice2", "unblock_cross")

func button_blocker():
	if Dice_active_mass == 0:
		$Button.disabled = true
	elif Dice_active_mass > 0:
		$Button.disabled = false

func _on_Button_button_up():
	if first_dice == true or $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice.picked == true:
		$RollDice.play("RollDice")
	elif $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice.picked == false:
		$RollDice2.play("RollDice")

func _on_Dice_texture_changed():
	Dice = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice.my_random_number
	counter()

func _on_Dice2_texture_changed():
	Dice2 = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice2.my_random_number
	counter()

func _on_Dice3_texture_changed():
	Dice3 = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice3.my_random_number
	counter()

func _on_Dice4_texture_changed():
	Dice4 = $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice4.my_random_number
	counter()

func _on_RollDice_animation_finished(RollDice):
	if first_dice == true or $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice.picked == true:
		$RollDice2.play("RollDice")
	elif $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice.picked == false:
		$RollDice3.play("RollDice")

func _on_RollDice2_animation_finished(anim_name):
	if first_dice == true or $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice2.picked == true:
		$RollDice3.play("RollDice")
	elif $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice2.picked == false:
		$RollDice4.play("RollDice")

func _on_RollDice3_animation_finished(anim_name):
	if first_dice == true or $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice3.picked == true:
		$RollDice4.play("RollDice")
	elif $NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice3.picked == false:
		finish_of_rolldice()

func _on_RollDice4_animation_finished(anim_name):
	finish_of_rolldice()
		
func finish_of_rolldice():
	if first_dice == true:
		get_tree().call_group("Dice2", "first_dice")
		counter()
		$Button.text = "Перебросить"
		first_dice = false
		$Label.visible = true
		button_blocker()
	elif first_dice == false:
		get_tree().call_group("Dice2", "redice")
		$Button.visible = false
		get_tree().call_group("Dice2", "hidecross")
