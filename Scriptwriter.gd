extends Node

#переменные для формирования карты
var CardChoose
var CardInfo #переменная хранящая данные из выбранной карты
var CardImage #переменная хранящая путь до карты
var CardName #переменная хранящая название карты
var CardText #переменная хранщая текст карты
var CardRAnswer #переменная для правого ответа
var CardLAnswer #переменная для левого ответа

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
var count_to_victory = 20

#переменная для запуска первой карты
var FirstCard = true

#предзагрузка БД карт
onready var CardDataBase = preload ("res://CardDataBase.gd")

func randomcard():
	var rng = RandomNumberGenerator.new() #ввели переменную, в которой запихнули функцию рандомайзера числа
	rng.randomize() #опять тоже самое, что и строкой выше
	var my_random_number = int(rng.randf_range(1, 5)) #указали диапазон чисел
	CardChoose = "Random" + str(my_random_number) #сгененировали название карты из Интро и числа
	card_var_generator()
	
func next_card():
	CardChoose = CardInfo[14]
	CardChoose = CardInfo[15]
	card_var_generator()
	
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
	NextCardLeft = CardInfo[14]
	NextCardRight = CardInfo[15]

	print ("2. сработало присваивание переменных")
	get_tree().call_group("CharacterControl", "card_generation")
	print ("3. сработал запуск генерации карты")
	get_tree().call_group("IventCard", "cardupdate")
	print ("4. обновились данные в карте")
	if CardInfo[0] == "LooseScreen":
		get_tree().call_group("CharacterControl", "dark_theme_card")
