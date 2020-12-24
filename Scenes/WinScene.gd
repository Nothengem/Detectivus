extends Control

func _ready():
	$AnimationPlayer.play("PressTapTextSlow")
	Scriptwriter.victory_count = 0

func _on_Button_released():
	get_tree().change_scene("res://Scenes/MainScene.tscn")
