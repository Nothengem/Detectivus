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



func _ready():
	Animator.play("Apperiance")
	Time.wait_time = 3
	Time.start()



func randomazer():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	my_random_number = int(rng.randf_range(1, 6))
#	Dice = str(Dice) + str(my_random_number)
#	animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)



func animate_value_banditism(start, end):
	pass



func all_minicard_centre():
	Twee.interpolate_property($MiniCards/MiniCard1, "position", $MiniCards/MiniCard1.position, $Positions/CentrePosition.position, 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	Twee.start()
	Twee.interpolate_property($MiniCards/MiniCard3, "position", $MiniCards/MiniCard3.position, $Positions/CentrePosition.position, 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	Twee.start()



func _on_Timer_start_timeout():
	get_tree().call_group("MiniCard", "flip_the_shirt")
	all_minicard_centre()
	card_layer_position.shuffle()
	PositionsMassive.shuffle()
	$Timer_midle.wait_time = 1
	$Timer_midle.start()


func _on_Timer_midle_timeout():
	all_minicard_centre()
	$MiniCards/MiniCard1.z_index = card_layer_position[0]
	$MiniCards/MiniCard2.z_index = card_layer_position[1]
	$MiniCards/MiniCard3.z_index = card_layer_position[2]
	
	Twee.interpolate_property($MiniCards/MiniCard1, "position", $MiniCards/MiniCard1.position, PositionsMassive[0], 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	Twee.start()
	
	Twee.interpolate_property($MiniCards/MiniCard2, "position", $MiniCards/MiniCard2.position, PositionsMassive[1], 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	Twee.start()
	
	Twee.interpolate_property($MiniCards/MiniCard3, "position", $MiniCards/MiniCard3.position, PositionsMassive[2], 0.5, Tween.TRANS_BACK, Tween.EASE_IN)
	Twee.start()
	$Timer_midle.start()
