extends Control

func _ready():
	$AnimationPlayer.play("PressTapTextSlow")
	Scriptwriter.victory_count = 0

func _on_Button_pressed():
	button_restart()
	
func button_restart():
	get_tree().change_scene("res://Scenes/MainScene.tscn")
