extends Node

var previous_mouse_position = Vector2()
var is_dragging = false

func _ready():
	spawn()



func spawn():
	var scene = load("res://Scenes/CharacterControl.tscn")
	var card = scene.instance()
	add_child_below_node($Control, card, true)



func spawn_dice():
	var scene = load("res://Scenes/Dice.tscn")
	var card = scene.instance()
	add_child_below_node($Control, card, true)



func spawn_cardmix():
	var scene = load("res://Scenes/thimbles.tscn")
	var card = scene.instance()
	add_child_below_node($Control, card, true)



func spawn_status():
	var scene = load("res://Scenes/Dice.tscn")
	var card = scene.instance()
	add_child_below_node($Control, card, true)



func background_fade():
	$AnimationPlayer.play("FadeBackGround")



func restart_game():
	Scriptwriter.FirstCard = true
	Scriptwriter.level_massive_generator()
	get_tree().change_scene("res://Scenes/StartMenu.tscn")



func win_the_game():
	get_tree().change_scene("res://Scenes/WinScene.tscn")


func _on_CharacterControl_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_touch"):
		get_tree().set_input_as_handled()
		previous_mouse_position = event.position
		is_dragging = true





