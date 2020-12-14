extends Node

var CardChoose
var CardInfo #переменная хранящая данные из выбранной карты
var CardImage #переменная хранящая путь до карты
var CardName #переменная хранящая название карты
var CardText #переменная хранщая текст карты
var CardRAnswer #переменная для правого ответа
var CardLAnswer #переменная для левого ответа
onready var CardDataBase = preload ("res://CardDataBase.gd")
var HealthLeftChoose
var LawLeftChoose
var BanditismLeftChoose
var LuckLeftChoose
var HealthRightChoose
var LawRightChoose
var BanditismRightChoose
var LuckRightChoose
var one = 0

func _ready():
	pass

func randomcard():
	var rng = RandomNumberGenerator.new() #ввели переменную, в которой запихнули функцию рандомайзера числа
	rng.randomize() #опять тоже самое, что и строкой выше
	var my_random_number = int(rng.randf_range(1, 5)) #указали диапазон чисел
	CardChoose = "Intro" + str(my_random_number) #сгененировали название карты из Интро и числа
	CardInfo = CardDataBase.DATA[CardDataBase.get(CardChoose)] #применили к переменной кардинфо все данные карты из базы данных
	CardImage = str ("res://Resources/GFX/CharacterPortraits", "/", CardInfo[1], ".png") #сгенерировали путь в проекте до портрета персонажа
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
	one = one +1
	print("Сработал randomcard")
	get_tree().call_group("CharacterCard", "card_generation")
	get_tree().call_group("IventCard", "cardupdate")
