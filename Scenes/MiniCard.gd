extends Sprite



func _ready():
	pass

func flip_the_shirt():
	$Tween.interpolate_property($Shirt, "self_modulate", $Shirt.self_modulate, Color("ffffff"), 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
