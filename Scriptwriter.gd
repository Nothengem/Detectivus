extends Node

#переменные для формирования карты
var CardType #nbg выбранной карточки
var CardChoose #какую карточку мы выбрали?
var CardInfo #переменная хранящая данные из выбранной карты
var CardImage #переменная хранящая путь до карты
var NextCardInfo #переменная для обращения к следующей карте из массива
var NextCardImageRight #переменная хранящая путь до картинки следующей карты при ответе "Да"
var NextCardImageLeft #переменная хранящая путь до картинки следующей карты при ответе "Нет"
var CardName #переменная хранящая название карты
var CardText #переменная хранщая текст карты
var CardRAnswer #переменная для правого ответа
var CardLAnswer #переменная для левого ответа
var CardIvent #переменная для активации события после карточки

#переменные для формирования ивента
var IventInfo #хранение данных ивента
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
onready var CardDataBase = preload ("res://CardDataBase.gd")
#предзагрузка БД ивентов
onready var IventDataBase = preload ("res://IventDataBase.gd")

func _ready():
	level_massive_generator()
	
	var a
	a = CardDataBase.DATA.keys()
	print(a)

func level_massive_generator():
	var level_composit
	for i in range(1, 22):
		randomize()
		level_composit = "Random" + str(i)
		level_cards.append(level_composit)
	level_cards.shuffle()
	NextCardImageRight = level_cards[1]
#	NextCardImageLeft = 
	get_tree().call_group("NextCharacterCard", "nextcardupdate")
	
	
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

func card_var_generator():
	if CardChoose == "Random":
		CardChoose = str(level_cards[0])
	
	print(CardChoose)
#	CardInfo = CardDataBase.DATA[CardDataBase.get(CardChoose)] #применили к переменной кардинфо все данные карты из базы данных
	CardInfo = CardDataBase.DATA.get(CardChoose)
	CardImage = str ("res://Resources/GFX/CharacterPortraits", "/", CardInfo[1], ".png") #сгенерировали путь в проекте до портрета персонажа
	CardType = CardInfo[0] #тип карты
	
	if CardType == "Characters":
		NextCardInfo = CardDataBase.DATA.get(level_cards[1])
	elif CardType == "Tutorial":
		NextCardInfo = CardDataBase.DATA.get(level_cards[0])
	
	NextCardImageRight = str ("res://Resources/GFX/CharacterPortraits", "/", NextCardInfo[1], ".png")
	get_tree().call_group("NextCharacterCard", "nextcardupdate")
	
	if CardType != "Tutorial":
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
#	elif NextCardRight != "Ivent":
	get_tree().call_group("CharacterControl", "card_generation")
	get_tree().call_group("IventCard", "cardupdate")

func ivent_generatior():
	IventInfo = IventDataBase.DATA[IventDataBase.get(CardIvent)]
	IventName = IventInfo[0]
	IventDifficulty = IventInfo[1]
	IventLoseText = IventInfo[2]
	IventLoseTeam = IventInfo[3]
	IventLoseClient = IventInfo[4]
	IventLoseCentralBank = IventInfo[5]
	IventLoseMoney = IventInfo[6]
	IventWinText = IventInfo[7]
	IventVarCorrection = IventInfo[8]
	IventCorrectorModificator = IventInfo[9]
