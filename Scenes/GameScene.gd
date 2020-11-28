extends Node2D

#var stories
#var current_story

#func _ready():
	#set_current_story()
	
#func set_current_story():
	#var stories = get_from_json("CardsDataBase.json")
	#current_story = stories[randi() % stories.size()]

#func get_from_json(filename):
	#var file = File.new()
	#file.open(filename, File.READ)
	#var text = file.text.get_as_text()
	#var data = parse_json(text)
	#file.close()
	#return data
