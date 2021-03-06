extends Node

enum {
	
	CentralBankDice1,
	MiniCardMix1,
	MiniCardMix2,
	Roulette1
	
	}

const DATA = {
	
	CentralBankDice1 : 
		["Dice", #название 1
		15, #сложность (сколько нужно выбросить по костям) 2
		"Вы получили штраф за беспорядок в документах", #Текст при проигрыше
		0, #Влияние на команду, при проигрыше
		0, #Влияние на клиентов, при проигрыше
		-20, #Влияние на ЦБ, при проигрыше
		0, #Влияние на деньги при поигрыше
		"У вас всё в порядке. Продолжайте работу", #Текст при выиграше
		"CentralBank", #Что подвергаем коррекции (Team/Customers/CentralBank/Money)
		10, #Модификатор коррекции
		],
		
	MiniCardMix1 : 
		["CardMix", #название 1
		1, #сложность (какой набор карточек будет предоставлен? чем выше тем сложнее)
		"СМИ трактуют новости как хотят. Для интереса читеталей заголовок был не из лучших", #Ответ отрицательный
		"Вы были убедительными. О банке напечатали хорошую статью", #Ответ положительный
		"Ваш рассказ оказался скучным. О нем не написали в газетах", #Ответ нейтральный
		"Customers", #Что подвергаем коррекции (Team/Customers/CentralBank/Money)
		"None",
		"None",
		"None",
		"None" #Модификатор коррекции хранится в самой карточке в MiniCardsDataBase
		],
		
	MiniCardMix2 : 
		["CardMix", #название 1
		4, #сложность (какой набор карточек будет предоставлен? чем выше тем сложнее)
		"Никто не понял смысла вашей речи. Бред какой-то...", #Ответ отрицательный
		"Речь оказалась хорошей. Кого-то подбодрила, кого-то спустила с небес на землю", #Ответ положительный
		"Ваша речь буквально убивает мотивацию команды", #Ответ нейтральный
		"Team", #Что подвергаем коррекции (Team/Customers/CentralBank/Money)
		"None",
		"None",
		"None",
		"None" #Модификатор коррекции хранится в самой карточке в MiniCardsDataBase
		],
		
		Roulette1 : 
		["Roulette", #название 1
		4, #сложность (какой набор карточек будет предоставлен? чем выше тем сложнее)
		"Никто не понял смысла вашей речи. Бред какой-то...", #Ответ отрицательный
		"Речь оказалась хорошей. Кого-то подбодрила, кого-то спустила с небес на землю", #Ответ положительный
		"Ваша речь буквально убивает мотивацию команды", #Ответ нейтральный
		"Money", #Что подвергаем коррекции (Team/Customers/CentralBank/Money)
		"None",
		"None",
		"None",
		"None" #Модификатор коррекции хранится в самой карточке в MiniCardsDataBase
		]
		}
