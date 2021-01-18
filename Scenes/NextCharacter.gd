extends Control

#Переменные для выбора на лево
onready var LeftPortrait = get_node("Control/Character/CharacterCardLeft/CharacterPortrait")
onready var LeftHead = get_node("Control/Character/CharacterCardLeft/Character/Head")
onready var LeftNeck = get_node("Control/Character/CharacterCardLeft/Character/Neck")
onready var LeftShirt = get_node("Control/Character/CharacterCardLeft/Character/Shirt")
onready var LeftEyebrows = get_node("Control/Character/CharacterCardLeft/Character/Eyebrows")
onready var LeftEyes = get_node("Control/Character/CharacterCardLeft/Character/Eyes")
onready var LeftForehead = get_node("Control/Character/CharacterCardLeft/Character/Forehead")
onready var LeftEars = get_node("Control/Character/CharacterCardLeft/Character/Ears")
onready var LeftJowls = get_node("Control/Character/CharacterCardLeft/Character/Jowls")
onready var LeftGlasses = get_node("Control/Character/CharacterCardLeft/Character/Glasses")
onready var LeftMouth = get_node("Control/Character/CharacterCardLeft/Character/Mouth")
onready var LeftHair = get_node("Control/Character/CharacterCardLeft/Character/Hair")
onready var LeftNose = get_node("Control/Character/CharacterCardLeft/Character/Nose")

#Переменные для выбора на право
onready var RightPortrait = get_node("Control/Character/CharacterCardRight/CharacterPortrait")
onready var RightHead = get_node("Control/Character/CharacterCardRight/Character/Head")
onready var RightNeck = get_node("Control/Character/CharacterCardRight/Character/Neck")
onready var RightShirt = get_node("Control/Character/CharacterCardRight/Character/Shirt")
onready var RightEyebrows = get_node("Control/Character/CharacterCardRight/Character/Eyebrows")
onready var RightEyes = get_node("Control/Character/CharacterCardRight/Character/Eyes")
onready var RightForehead = get_node("Control/Character/CharacterCardRight/Character/Forehead")
onready var RightEars = get_node("Control/Character/CharacterCardRight/Character/Ears")
onready var RightJowls = get_node("Control/Character/CharacterCardRight/Character/Jowls")
onready var RightGlasses = get_node("Control/Character/CharacterCardRight/Character/Glasses")
onready var RightMouth = get_node("Control/Character/CharacterCardRight/Character/Mouth")
onready var RightHair = get_node("Control/Character/CharacterCardRight/Character/Hair")
onready var RightNose = get_node("Control/Character/CharacterCardRight/Character/Nose")

#переменные с помощью которых достаём значения портретов
var left_choose_portrait
var right_choose_portrait

#func _ready():
#	got_left_right_choose_portraits()

func got_left_right_choose_portraits():
	left_choose_portrait = Scriptwriter.NextCardLeft
	right_choose_portrait = Scriptwriter.NextCardRight
	find_name_of_portraits()


func find_name_of_portraits():
	if !left_choose_portrait == "Random":
		left_choose_portrait = Scriptwriter.CardDataBase.DATA.get(left_choose_portrait)
		left_choose_portrait = left_choose_portrait[1]
		left_choose_portrait = Scriptwriter.CharacterPortraitDataBase.DATA.get(left_choose_portrait)
	elif left_choose_portrait == "Random":
		left_choose_portrait = Scriptwriter.level_cards[1]
		left_choose_portrait = Scriptwriter.CardDataBase.DATA.get(left_choose_portrait)
		left_choose_portrait = left_choose_portrait[1]
		left_choose_portrait = Scriptwriter.CharacterPortraitDataBase.DATA.get(left_choose_portrait)
		print(left_choose_portrait)
		
	if !right_choose_portrait == "Random":
		right_choose_portrait = Scriptwriter.CardDataBase.DATA.get(right_choose_portrait)
		right_choose_portrait = right_choose_portrait[1]
		right_choose_portrait = Scriptwriter.CharacterPortraitDataBase.DATA.get(right_choose_portrait)
	elif right_choose_portrait == "Random":
		right_choose_portrait = Scriptwriter.level_cards[1]
		right_choose_portrait = Scriptwriter.CharacterPortraitDataBase.DATA.get(right_choose_portrait)

		
	nextcardupdate()


func nextcardupdate():
	if Scriptwriter.CardChoose == "LooseScreen":
		LeftPortrait.texture = 1
		RightPortrait.texture = 1
	elif Scriptwriter.CardChoose != "LooseScreen":
		LeftHead.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[0], ".png")
		
		LeftNeck.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[1], ".png") 
		LeftShirt.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[2], ".png")
		LeftEyebrows.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[3], ".png")
		LeftEyes.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[4], ".png")
		LeftForehead.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[5], ".png")
		LeftEars.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[6], ".png")
		LeftJowls.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[7], ".png")
		LeftGlasses.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[8], ".png")
		LeftMouth.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[9], ".png")
		LeftHair.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[10], ".png")
		LeftNose.texture = str ("res://Resources/GFX/CharacterCotaint/Head", "/", left_choose_portrait[11], ".png")
		
		RightHead.texture = right_choose_portrait[0]
		RightNeck.texture = right_choose_portrait[1]
		RightShirt.texture = right_choose_portrait[2]
		RightEyebrows.texture = right_choose_portrait[3]
		RightEyes.texture = right_choose_portrait[4]
		RightForehead.texture = right_choose_portrait[5]
		RightEars.texture = right_choose_portrait[6]
		RightJowls.texture = right_choose_portrait[7]
		RightGlasses.texture = right_choose_portrait[8]
		RightMouth.texture = right_choose_portrait[9]
		RightHair.texture = right_choose_portrait[10]
		RightNose.texture = right_choose_portrait[11]
