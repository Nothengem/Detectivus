extends Control


func _ready():
	spawn()

func spawn():
	var scene = load("res://Scenes/Character.tscn")
	var card = scene.instance()
	add_child_below_node($Control, card, true)
	
	
	
func spawn_dice():
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
