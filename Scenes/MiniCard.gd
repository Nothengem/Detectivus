extends Sprite

onready var this_node = get_node(".")



func flip_the_shirt():
	$Tween.interpolate_property($Shirt, "self_modulate", $Shirt.self_modulate, Color("ffffff"), 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()



func activate_choose_button():
	$TouchScreenButton.visible = true



func deactivate_shirt():
	$Shirt.visible = false



func _on_TouchScreenButton_released():
	$Shirt.visible = false
	get_tree().call_group("MiniCard", "fade_that_no_choosen")
	fade_that_no_choosen()
	$TouchScreenButton.queue_free()


func fade_that_no_choosen_roulette():
	if $Shirt.visible == true:
		$Tween.interpolate_property(this_node, "modulate", this_node.self_modulate, Color("00ffffff"), 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		get_tree().call_group("Roulette", "Timer_start_final_anim")


func fade_that_no_choosen():
	if $Shirt.visible == true:
		$Tween.interpolate_property(this_node, "modulate", this_node.self_modulate, Color("00ffffff"), 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		get_tree().call_group("thimbles", "Timer_start_final_anim")
