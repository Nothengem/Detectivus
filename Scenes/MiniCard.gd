extends Sprite

onready var this_node = get_node(".")

func _ready():
	pass

func flip_the_shirt():
	$Tween.interpolate_property($Shirt, "self_modulate", $Shirt.self_modulate, Color("ffffff"), 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()



func activate_choose_button():
	$TouchScreenButton.visible = true



func _on_TouchScreenButton_released():
	$Shirt.visible = false
	get_tree().call_group("MiniCard", "fade_that_no_choosen")
	fade_that_no_choosen()
	
func fade_that_no_choosen():
	print ("Заработало")
	if $Shirt.visible == true:
		print ("Заработало2")
		$Tween.interpolate_property(this_node, "modulate", this_node.self_modulate, Color("00ffffff"), 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		get_tree().call_group("thimbles", "Timer_start_final_anim")
