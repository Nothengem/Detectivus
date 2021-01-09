extends Control

onready var Dice = get_node("NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice")
onready var Dice2 = get_node("NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer/Dice2")
onready var Dice3 = get_node("NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice3")
onready var Dice4 = get_node("NinePatchRect/CenterContainer/VBoxContainer/HBoxContainer2/Dice4")
var victory_number = 0
var limited_dice = 2
var Dice_active
var Dice2_active
var Dice3_active
var Dice4_active
var Dice_active_mass = 0 #количество выбранных костей
var first_dice = true
var difficult = Scriptwriter.IventDifficulty
onready var Resuilt = get_node("NinePatchRect/CenterContainer/Label")

func _ready():
	get_tree().call_group("IventCard", "cardupdate_dice")
	$Apperiance.play("Appearance")
	print("1 ", victory_number)

func counter():
	victory_number = Dice.my_random_number + Dice2.my_random_number + Dice3.my_random_number + Dice4.my_random_number
	Resuilt.text = str(victory_number)
	print("2 ", victory_number)

func number_update_plus():
	if Dice_active_mass < limited_dice:
		Dice_active_mass = Dice_active_mass + 1
		limit_control()
		button_blocker()
		print("3 ", victory_number)
		
func number_update_minus():
	if Dice_active_mass != 0:
		Dice_active_mass = Dice_active_mass - 1
		limit_control()
		button_blocker()
		print("4 ", victory_number)

func limit_control():
	if Dice_active_mass == limited_dice:
		get_tree().call_group("Dice2", "block_cross")
		print("5 ", victory_number)
	elif Dice_active_mass < limited_dice:
		get_tree().call_group("Dice2", "unblock_cross")
		print("6 ", victory_number)

func button_blocker():
	if Dice_active_mass == 0:
		$Button.disabled = true
		print("7 ", victory_number)
	elif Dice_active_mass > 0:
		$Button.disabled = false
		print("8 ", victory_number)

func _on_Button_button_up():
	get_tree().call_group("Dice2", "hidecross2")
	print("9 ", victory_number)
	if first_dice == true:
		$RollDice.play("RollDice")
		print("10 ", victory_number)
	elif !first_dice:
		reroll_dice_chainc_check()
		print("11 ", victory_number)

func _on_RollDice_animation_finished(RollDice):
	if first_dice == true or Dice2.picked == true:
		$RollDice2.play("RollDice")
		print("12 ", victory_number)
	elif !first_dice:
		reroll_dice_chainc_check()
		print("13 ", victory_number)

func _on_RollDice2_animation_finished(RollDice):
	if first_dice == true or Dice3.picked == true:
		$RollDice3.play("RollDice")
		print("14 ", victory_number)
	elif !first_dice:
		reroll_dice_chainc_check()
		print("15 ", victory_number)

func _on_RollDice3_animation_finished(RollDice):
	if first_dice == true or Dice4.picked == true:
		$RollDice4.play("RollDice")
		print("16 ", victory_number)
	elif !first_dice:
		finish_of_rolldice()
		print("17 ", victory_number)

func _on_RollDice4_animation_finished(RollDice):
	finish_of_rolldice()
	counter()
	Resuilt.visible = true
	print("18 ", victory_number)
	
func reroll_dice_chainc_check():
	if Dice.picked:
		$RollDice.play("RollDice")
		Dice.picked = false
		print("19 ", victory_number)
	elif Dice2.picked:
		$RollDice2.play("RollDice")
		Dice2.picked = false
		print("20 ", victory_number)
	elif Dice3.picked:
		$RollDice3.play("RollDice")
		Dice3.picked = false
		print("21 ", victory_number)
	elif Dice4.picked:
		$RollDice4.play("RollDice")
		Dice4.picked = false
		print("22 ", victory_number)
	elif !Dice.picked and !Dice2.picked and !Dice3.picked and !Dice4.picked:
		finish_of_rolldice()
		print("23 ", victory_number)

func finish_of_rolldice():
	if first_dice == true:
		get_tree().call_group("Dice2", "first_dice")
		counter()
		$Button.text = "Перебросить"
		Resuilt.visible = true
		button_blocker()
		$AgreeButton.visible = true
		print("24 ", victory_number)
	elif first_dice == false:
		$Button.visible = false
		$AgreeButton.visible = false
		get_tree().call_group("Dice2", "redice")
		get_tree().call_group("Dice2", "hidecross")
		counter()
		print("25 ", victory_number)

func _on_Dice_texture_changed():
	counter()
	print("26 ", victory_number)
	win_lose_animation()

func _on_Dice2_texture_changed():
	counter()
	print("27 ", victory_number)
	win_lose_animation()

func _on_Dice3_texture_changed():
	counter()
	print("28 ", victory_number)
	win_lose_animation()

func _on_Dice4_texture_changed():
	counter()
	print("29 ", victory_number)
	win_lose_animation()

func _on_AgreeButton_button_up():
	get_tree().call_group("MainScene", "spawn")
	queue_free()

func win_lose_animation():
	if victory_number > difficult or victory_number == difficult:
		$Win.play("Win")
		get_tree().call_group("IventCard", "cardupdate_ivent_win")
		print("30 ", victory_number)
	elif victory_number < difficult:
		print("31 ", victory_number)
		if first_dice:
			$Lose.play("Lose")
			print("32 ", victory_number)
		elif !first_dice:
			$Lose.play("Lose")
			get_tree().call_group("IventCard", "cardupdate_ivent_lose")
			print("33 ", victory_number)

		
func _on_Lose_animation_finished(Lose):
	if first_dice:
		first_dice = false
		pass
		print("34 ", victory_number)
	elif !first_dice:
		Scriptwriter.CardChoose = Scriptwriter.NextCardLeft
		get_tree().call_group("MainScene", "spawn")
		if victory_number < difficult:
			get_tree().call_group("BalanceGUI", "change_proportions_ivent_loose")
		elif victory_number >= difficult:
			print("условие выполнено")
			get_tree().call_group("BalanceGUI", "change_proportions_ivent_win")
		queue_free()
		print("35 ", victory_number)


func _on_Win_animation_finished(Win):
	Scriptwriter.CardChoose = Scriptwriter.NextCardLeft
	get_tree().call_group("MainScene", "spawn")
	get_tree().call_group("BalanceGUI", "change_proportions_ivent_win")
	queue_free()
	print("36 ", victory_number)
	
	
