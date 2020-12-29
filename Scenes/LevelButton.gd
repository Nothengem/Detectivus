extends Control

#переменные уровня
export (int) var level
export (String) var level_to_load
export (bool) var enabled
export (bool) var score_goal_met

#текстуры кнопки
export (Texture) var blocked_Texture
export (Texture) var open_Texture
export (Texture) var goal_met
export (Texture) var goal_not_met

onready var level_label = $TouchScreenButton/Label
onready var button = $TouchScreenButton
onready var star1 = $TouchScreenButton/Stars/Star1
onready var star2 = $TouchScreenButton/Stars/Star2
onready var star3 = $TouchScreenButton/Stars/Star3

func _ready():
	setup()

func setup():
	level_label.text = String(level)
	if enabled:
		button.texture_normal = open_Texture
	else:
		button.texture_normal = blocked_Texture
	if score_goal_met:
		star1.texture = goal_met
	else:
		star1.texture = goal_not_met
