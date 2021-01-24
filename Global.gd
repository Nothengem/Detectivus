extends Node

onready var CardDataBase = preload ("res://CardDataBase.gd") #предзагрузка базы данных с информацией окартах, до начала проекта
var CardChoose #переменная по выбору карты
var CardInfo #переменная хранящая данные из выбранной карты
var CardImage #переменная хранящая путь до карты
var CardName #переменная хранящая название карты
var CardText #переменная хранщая текст карты
var CardRAnswer #переменная для правого ответа
var CardLAnswer #переменная для левого ответа
var CardOnScreen = false

func _ready(): #функция включающаяся сруза при запуске проекта
	randomcard()

func randomcard():
	var rng = RandomNumberGenerator.new() #ввели переменную, в которой запихнули функцию рандомайзера числа
	rng.randomize() #опять тоже самое, что и строкой выше
	var my_random_number = int(rng.randf_range(1, 5)) #указали диапазон чисел
	CardChoose = "Intro" + str(my_random_number) #сгененировали название карты из Интро и числа
	get_event()
	CardInfo = CardDataBase.DATA[CardDataBase.get(CardChoose)] #применили к переменной кардинфо все данные карты из базы данных
	CardImage = str ("res://Resources/GFX/CharacterPortraits", "/", CardInfo[1], ".png") #сгенерировали путь в проекте до портрета персонажа
	CardName = CardInfo[3] #Ввели в переменную текстовое значение имени карты из массива БД
	CardText = CardInfo[2] #Ввели в переменную текстовое значение текста карты из массива БД
	CardRAnswer = CardInfo[5] #левый ответ из БД
	CardLAnswer = CardInfo[4] #Правый ответ из БД
	return CardInfo


func get_event():
	#CardInfo = CardDataBase.DATA[CardDataBase.get(CardName)]
	print(CardChoose)

func generate_event():
	pass


#func choosedone():
#	if $CharacterCard.position == $LeftChoose.position:
#		print("yes")
#		queue_free()
#		Global.spawn()
#	if $CharacterCard.position == $RightChoose.position:
#		print("yes")
#		queue_free()
#		Global.spawn()
