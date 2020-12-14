extends Control


func _ready():
	spawn()


func spawn():
	var scene = load("res://Scenes/Character.tscn")
	var card = scene.instance()
	add_child_below_node($Control, card, true)
