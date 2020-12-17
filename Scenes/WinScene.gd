extends Control

func _ready():
	$AnimationPlayer.play("PressTapTextSlow")

func _on_Button_pressed():
	button_restart()
	
func button_restart():
	get_tree().change_scene("res://Scenes/MainScene.tscn")
