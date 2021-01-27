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

func _ready():
	Animator.play("Apperiance")
	$Timer_start.wait_time = 3
	$Timer_start.start()



func randomazer():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	my_random_number = int(rng.randf_range(1, 6))
#	Dice = str(Dice) + str(my_random_number)
#	animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)



func animate_value_banditism(start, end):
	pass



func _on_Timer_start_timeout():
	print("сработал старт")
	get_tree().call_group("MiniCard", "flip_the_shirt")
	all_minicard_centre()



func _on_Timer_midle_timeout():
		all_minicard_parse()
		$MiniCards/MiniCard1.z_index = card_layer_position[0]
		$MiniCards/MiniCard2.z_index = card_layer_position[1]
		$MiniCards/MiniCard3.z_index = card_layer_position[2]
		$Timer_repeat.wait_time = 0.5
		$Timer_repeat.start()




func _on_Timer_repeat_timeout():
	if stoper != 3:
		all_minicard_centre()
		stoper = stoper +1
		print (stoper)
	elif stoper == 3:
		$Timer_start.one_shot = true
		get_tree().call_group("MiniCard", "activate_choose_button")




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
	print("timer done")
	var a
	if $MiniCards/MiniCard1/Shirt.visible == false:
		a = $MiniCards/MiniCard1
	elif $MiniCards/MiniCard2/Shirt.visible == false:
		a = $MiniCards/MiniCard2
	elif $MiniCards/MiniCard3/Shirt.visible == false:
		a = $MiniCards/MiniCard3
	
	var b: Vector2 = get_parent().get_viewport().size/2 #позиция центра экрана
	
	Twee.interpolate_property(a, "position", a.position, b, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()
	Twee.interpolate_property(a, "scale", $MiniCards/MiniCard3.scale, Vector2(2, 2), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	Twee.start()
