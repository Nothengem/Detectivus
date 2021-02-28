extends Node

#переменные для формирования карты
var CardType #nbg выбранной карточки
var CardChoose #какую карточку мы выбрали?
var CardInfo #переменная хранящая данные из выбранной карты
var NextCardInfo = ["0", "1"] #переменная для обращения к следующей карте из массива
var CardImage #переменная хранящая путь до картинки следующей карты при ответе "Да"
var NextCardImageLeft #переменная хранящая путь до картинки следующей карты при ответе "Нет"
var CardName #переменная хранящая название карты
var CardText #переменная хранщая текст карты
var CardRAnswer #переменная для правого ответа
var CardLAnswer #переменная для левого ответа
var CardIvent #переменная для активации события после карточки

#переменные для формирования потрета карты
var CharacterPortrait #переменная хранящая название массива портрета в БД персонажей
var CharacterEars
var CharacterEyebrows
var CharacterEyes
var CharacterForehead
var CharacterGlasses
var CharacterHair
var CharacterHead
var CharacterJowls
var CharacterMouth
var CharacterNeck
var CharacterNose
var CharacterShirt

#переменные для формирования ивента
var IventInfo #хранение данных ивента
var StatusInfo #хранение данных статуса
var IventName
var IventDifficulty
var IventLoseText
var IventLoseTeam
var IventLoseClient
var IventLoseCentralBank
var IventLoseMoney
var IventWinText
var IventVarCorrection
var IventCorrectorModificator

#переменные выбора на карточке влияющие на баланс
var HealthLeftChoose
var LawLeftChoose
var BanditismLeftChoose
var LuckLeftChoose
var HealthRightChoose
var LawRightChoose
var BanditismRightChoose
var LuckRightChoose

#Какие карты будут следующими?
var NextCardRight
var NextCardLeft

#переменные баланса
var Heath_var
var Law_var
var Banditism_var
var Luck_var
var maximum_value = 100

#переменная обслуженных клиентов и лимит для достижения победы
var victory_count = 0
var count_to_victory = 12

#переменная для запуска первой карты
var FirstCard = true

#переменная обозначающая текущий уровень
var CurrentLevel = 1

#массив содержащий в себе карты для уровня
var level_cards = []

#предзагрузка БД карт
onready var CardDataBase = preload ("res://DataBase/CardDataBase.gd")
#предзагрузка БД ивентов
onready var IventDataBase = preload ("res://DataBase/IventDataBase.gd")
#предзагрузка БД настроек портретов персонажей
onready var CharacterPortraitDataBase = preload("res://DataBase/CharacterPortraitDataBase.gd")
#предзагрузка БД всех частей портетов персонажей
onready var PortraitPardDataBase = preload("res://DataBase/PortraitPartDataBase.gd")
#предзагрузка БД всех мини-карточек
onready var MiniCardDataBase = preload("res://DataBase/MiniCardDataBase.gd")
#предзагрузка БД всех статусов
onready var StatusDataBase = preload("res://DataBase/StatusDataBase.gd")

func _ready():
	level_massive_generator()


func level_massive_generator():
	var level_composit
	for i in range(20, 25):
		randomize()
		level_composit = "Random" + str(i)
		level_cards.append(level_composit)
	level_cards.shuffle()
	level_cards = ["Random28", "Random14", "Random15", "Random24", "Random25", "Random26", "Random27", "Random23", "Random22", "Random21", "Random20", "Random21"]
	CardImage = level_cards[1]



func losecard():
	if Scriptwriter.Heath_var <= 0:
		CardChoose = "LooseBottomHealth"
		card_var_generator()
	elif Scriptwriter.Law_var <= 0:
		CardChoose = "LooseBottomLaw"
		card_var_generator()
	elif Scriptwriter.Banditism_var <= 0:
		CardChoose = "LooseBottomBanditism"
		card_var_generator()
	elif Scriptwriter.Luck_var <= 0:
		CardChoose = "LooseBottomLuck"
		card_var_generator()
	elif Scriptwriter.Heath_var >= 100:
		CardChoose = "LooseTopHealth"
		card_var_generator()
	elif Scriptwriter.Law_var >= 100:
		CardChoose = "LooseTopLaw"
		card_var_generator()
	elif Scriptwriter.Banditism_var >= 100:
		CardChoose = "LooseTopBanditism"
		card_var_generator()
	elif Scriptwriter.Luck_var >= 100:
		CardChoose = "LooseTopLuck"
		card_var_generator()



func card_var_generator(): #ПОХОЖЕ Я ЭТУ ШТУКУ ЗАПУСКАЮ 2 РАЗА ПРИ ЛУЗ СКРИНЕ (ПРОВЕРИТЬ)
	#кусок в котором присваиваем портрет карты
	if CardChoose == "LooseScreen": #проверяем что следующая карта проигрышная или нет
		losecard()
	elif CardChoose == "StatusScreen":
		CardChoose = CardInfo[16]
		CardInfo = CardDataBase.DATA.get(CardChoose)
	elif CardChoose == "Random" or CardChoose == "Tutorial":
		CardChoose = str(level_cards[0])
		CardInfo = CardDataBase.DATA.get(CardChoose) 
		CharacterPortrait = CharacterPortraitDataBase.DATA.get(CardInfo[1])
	elif CardChoose == "Ivent": #если выбранная карта ивент, то
		CardInfo = CardDataBase.DATA.get(CardChoose) #присваиваем кардинфо переменную ивента
		CharacterPortrait = CharacterPortraitDataBase.DATA.get(CardInfo[1]) #потрет при этом равен ivent (всё на нуль)
	elif CardChoose == "StatusScreen": #если следующая карточка статус
		CardInfo = CardDataBase.DATA.get("Ivent")
		CharacterPortrait = CharacterPortraitDataBase.DATA.get(CardInfo[1])
	elif !CardChoose == "Ivent" or "LooseScreen" or "Random" or "Tutorial" or "StatusScreen":
		CardInfo = CardDataBase.DATA.get(CardChoose)
		CharacterPortrait = CharacterPortraitDataBase.DATA.get(CardInfo[1])
		
	CardType = CardInfo[0]
	if CardType == "Characters":
		NextCardInfo = CardDataBase.DATA.get(level_cards[1])
		get_tree().call_group("NextCharacterCard", "got_left_right_choose_portraits")
	elif CardType == "Tutorial":
		NextCardInfo = CardDataBase.DATA.get(level_cards[0])
		get_tree().call_group("NextCharacterCard", "got_left_right_choose_portraits")
	elif CardType == "LooseScreen":
		get_tree().call_group("NextCharacterCard", "got_left_right_choose_portraits")
	elif CardType == "StatusScreen":
		get_tree().call_group("NextCharacterCard", "got_left_right_choose_portraits")
	
	
	if CardType == "LooseScreen":
		CardImage = str ("res://Resources/GFX/CharacterPortraits", "/", CardInfo[1], ".png")
		CharacterPortrait = CardImage
	elif CardType == "StatusScreen":
		CardImage = str ("res://Resources/GFX/StatusCards", "/", CardInfo[1], ".png")
		CharacterPortrait = CardImage
	elif CardType == "Characters" or CardType == "Tutorial":
		CharacterHead = str ("res://Resources/GFX/CharacterCotaint/Head", "/", CharacterPortrait[0], ".png")
		CharacterNeck = str ("res://Resources/GFX/CharacterCotaint/Neck", "/", CharacterPortrait[1], ".png")
		CharacterShirt =  str ("res://Resources/GFX/CharacterCotaint/Shirt", "/", CharacterPortrait[2], ".png")
		CharacterEyebrows = str ("res://Resources/GFX/CharacterCotaint/Eyebrows", "/", CharacterPortrait[3], ".png")
		CharacterEyes = str ("res://Resources/GFX/CharacterCotaint/Eyes", "/", CharacterPortrait[4], ".png")
		CharacterForehead = str ("res://Resources/GFX/CharacterCotaint/Forehead", "/", CharacterPortrait[5], ".png")
		CharacterEars = str ("res://Resources/GFX/CharacterCotaint/Ears", "/", CharacterPortrait[6], ".png")
		CharacterJowls = str ("res://Resources/GFX/CharacterCotaint/Jowls", "/", CharacterPortrait[7], ".png")
		CharacterGlasses = str ("res://Resources/GFX/CharacterCotaint/Glasses", "/", CharacterPortrait[8], ".png")
		CharacterMouth = str ("res://Resources/GFX/CharacterCotaint/Mouth", "/", CharacterPortrait[9], ".png")
		CharacterHair = str ("res://Resources/GFX/CharacterCotaint/Hair", "/", CharacterPortrait[10], ".png")
		CharacterNose = str ("res://Resources/GFX/CharacterCotaint/Nose", "/", CharacterPortrait[11], ".png")
		
	if CardType != "Tutorial" and CardType != "LooseScreen" and CardType != "StatusScreen":
		level_cards.remove(0)
		
	CardName = CardInfo[3] #Ввели в переменную текстовое значение имени карты из массива БД
	CardText = CardInfo[2] #Ввели в переменную текстовое значение текста карты из массива БД
	CardRAnswer = CardInfo[5] #левый ответ из БД
	CardLAnswer = CardInfo[4] #Правый ответ из БД
	HealthLeftChoose = CardInfo[6]
	LawLeftChoose = CardInfo[7]
	BanditismLeftChoose = CardInfo[8]
	LuckLeftChoose = CardInfo[9]
	HealthRightChoose = CardInfo[10]
	LawRightChoose = CardInfo[11]
	BanditismRightChoose = CardInfo[12]
	LuckRightChoose = CardInfo[13]
	NextCardRight = CardInfo[14]
	NextCardLeft = CardInfo[15]
	CardIvent = CardInfo[16]
	if NextCardRight == "Ivent":
		ivent_generatior()
	elif CardType == "StatusScreen":
		status_generator()
	get_tree().call_group("CharacterControl", "card_generation")
	get_tree().call_group("IventCard", "cardupdate")



func ivent_generatior():
	IventInfo = IventDataBase.DATA[IventDataBase.get(CardIvent)]



func status_generator():
	StatusInfo = StatusDataBase.DATA[StatusDataBase.get(CardIvent)]
