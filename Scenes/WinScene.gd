extends Control

func _ready():
	$AnimationPlayer.play("PressTapTextSlow")
	Scriptwriter.victory_count = 0

func _on_Button_released():
	Scriptwriter.level_massive_generator()
	get_tree().change_scene("res://Scenes/MainScene.tscn")

