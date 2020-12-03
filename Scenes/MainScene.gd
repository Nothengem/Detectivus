extends Node

func _ready():
	spawn()
	
func spawn():
	Global.randomcard()
	var scene = load("res://Scenes/Character.tscn")
	var card = scene.instance()
	$Control.add_child(card)
	card.get_child(0).connect("CardDie", self, "test")
	card.position = $Control/Position2D.position
	
func test():
	print("done")
	spawn()
