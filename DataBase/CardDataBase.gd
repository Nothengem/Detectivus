extends Node

enum {
	
	Tutorial1, Tutorial2, Tutorial3, Tutorial4,
	
	Random1, Random2, Random2a, Random2b, Random3, Random3a, Random3b, 
	Random3c, Random4, Random4a, Random5, Random5a, Random5b, Random5c, 
	Random6, Random7, Random8, Random9, Random10, Random11, Random12, 
	Random13, Random13a, Random13b, Random14, Random15, Random16, Random17, 
	Random17a, Random18, Random18a, Random19, Random20, Random21, Random21a, 
	Random22, Random22a, Random23, Random24,
	
	TeamUp, CustomersUp, CentralBankUp, MoneyUp, 
	TeamDown, CustomersDown, CentralBankDown, MoneyDown,
	
	LooseTopHealth, LooseBottomHealth, LooseTopLaw, 
	LooseBottomLaw, LooseTopBanditism, LooseBottomBanditism, 
	LooseTopLuck, LooseBottomLuck
	
	}

const DATA = {
	
	"Tutorial1" : 
		["Tutorial", #ссылка на папку персонажей 0
		"AlexeyKochanov", #кто говорит 1, портрет
		"Перетаскивай карточку влево/вправо, чтобы давать ответы", #что говорит 2
		"Лёха Кочанов", #Имя говорящего 3
		"Я знаю как играть", #Ответ на право 4 (ДА)
		"Хорошо, объясняй дальше", #ответ на лево 5 (НЕТ)
		0, #Ренессанс на право 6
		0, #Люди на право 7
		0, #ЦБ на право 8
		0, #Деньги на право 9
		0, #Ренессанс на лево 10
		0, #Люди на лево 11
		0, #ЦБ на лево 12
		0, #Деньги на лево 13
		"Tutorial2", #Следующая карта на право 14 (ДА)
		"Random", #Следующая карта на лево 15 (НЕТ)
		"None"], #Игровое событие
	
	"Tutorial2" : 
		["Tutorial",
		"AlexeyKochanov", #кто говорит
		"Сохраняй баланс, чтобы удержаться на банковском рынке", #что говорит
		"Лёха Кочанов", #Имя говорящего
		"Я всё понял", #Ответ на лево
		"Какой баланс?", #ответ на право
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Tutorial3",
		"Random",
		"None"],
	
	"Tutorial3" : 
		["Tutorial",
		"AlexeyKochanov", #кто говорит
		"4 показателя вверху. Нельзя опускать их до минимума и максимума", #что говорит
		"Лёха Кочанов", #Имя говорящего
		"Ок, я всё понял", #Ответ на лево
		"Что за показатели?", #ответ на право
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Tutorial4",
		"Random",
		"None"],
	
	"Tutorial4" : 
		["Tutorial",
		"AlexeyKochanov", #кто говорит
		"Моральных дух банка,  отношение людей, отношение ЦБ и финансы", #что говорит
		"Лёха Кочанов", #Имя говорящего
		"Ну погнали", #Ответ на лево
		"Я всё понял. Я молодец!", #ответ на право
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
	
	"Random1" : 
		["Characters", #ссылка на папку персонажей 0
		"AnastasiyaMalkova", #кто говорит 1
		"Мне нужен кредит в 1'000'000. Отдам быстро", #что говорит 2
		"Анастасия (A+)", #Имя говорящего 3
		"Я, наверное, глупый. Но вам денег не дам", #Ответ на лево 4
		"Да, конечно. С фин защитой!", #ответ на право 5
		-10,
		-15,
		+15,
		0,
		+10,
		+10,
		-10,
		-20,
		"Random",
		"Random",
		"None"],
	
	"Random2" : 
		["Characters",
		"AnastasiyaCherevatkina", #кто говорит
		"Я просто мимо проходила, не обращай внимание", #что говорит
		"Анастасия (А)", #Имя говорящего
		"Попробовать кредитануть?", #Ответ на лево
		"Пропробовать жестко кредитануть. Под 50%", #ответ на право
		+10, #Ренессанс на лево 6
		+10, #Люди на лево 7
		-20, #ЦБ на лево 8
		0, #Деньги на лево 9
		+20, #Ренессанс на право 10
		-20, #Люди на право 11
		+15, #ЦБ на право 12
		0, #Деньги на право 13
		"Random2a",
		"Random2b",
		"None"],
		
	"Random2a" : 
		["Characters",
		"AnastasiyaCherevatkina", #кто говорит
		"500'000 под 10% говорите??? Дайте два!", #что говорит
		"Анастасия (А)", #Имя говорящего
		"Извините, наш Банк передумал. Тех трудности", #Ответ на лево
		"Конечно, берите! И фин. помощник в подарок", #ответ на право
		+15, #Ренессанс на лево 6
		+10, #Люди на лево 7
		-10, #ЦБ на лево 8
		-20, #Деньги на лево 9
		-20, #Ренессанс на право 10
		-10, #Люди на право 11
		+15, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random2b" : 
		["Characters",
		"AnastasiyaCherevatkina", #кто говорит
		"Охеренел!? Я тебя сама сейчас так кредитану!", #что говорит
		"Анастасия (А)", #Имя говорящего
		"Бежать...", #Ответ на лево
		"Убегать быстро!", #ответ на право
		-20, #Ренессанс на лево 6
		-20, #Люди на лево 7
		+20, #ЦБ на лево 8
		0, #Деньги на лево 9
		-10, #Ренессанс на право 10
		-10, #Люди на право 11
		-10, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random3" : 
		["Characters",
		"AlexeySilkin", #кто говорит
		"Мне нужна дебетовка. Желательно с бонусами", #что говорит
		"Алексей (A+)", #Имя говорящего
		"Предложить кредитку", #Ответ на лево
		"Выдать Drive/365", #ответ на право
		-15, #Ренессанс на лево 6
		+20, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		+20, #Ренессанс на право 10
		-15, #Люди на право 11
		+10, #ЦБ на право 12
		0, #Деньги на право 13
		"Random3a",
		"Random",
		"None"],
		
	"Random3a" : 
		["Characters",
		"AlexeySilkin", #кто говорит
		"Говорите кредита даёт больше свободы? Ну давайте...", #что говорит
		"Алексей (A+)", #Имя говорящего
		"Выдать кредитку и предложить GP", #Ответ на лево
		"Выдать ему только кредитку", #ответ на право
		-10, #Ренессанс на лево 6
		+10, #Люди на лево 7
		0, #ЦБ на лево 8
		-10, #Деньги на лево 9
		+20, #Ренессанс на право 10
		0, #Люди на право 11
		+20, #ЦБ на право 12
		-10, #Деньги на право 13
		"Random3b",
		"Random",
		"None"],
		
	"Random3b" : 
		["Characters",
		"AlexeySilkin", #кто говорит
		"Блин да хорош уже меня разводить! Я ухожу!", #что говорит
		"Алексей (A+)", #Имя говорящего
		"Если ты наш клиент, то ты вернёшься", #Ответ на лево
		"Извините, останьтесь. Я больше так не буду", #ответ на право
		-20, #Ренессанс на лево 6
		+15, #Люди на лево 7
		-20, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		-20, #Люди на право 11
		-20, #ЦБ на право 12
		0, #Деньги на право 13
		"Random3c",
		"Random",
		"None"],

	"Random3c" : 
		["Characters",
		"AlexeySilkin", #кто говорит
		"Ок", #что говорит
		"Алексей (A+)", #Имя говорящего
		"Ты купился на нашу ловушку! Муахаха", #Ответ на лево
		"Ну вот и славно", #ответ на право
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],

	"Random4" : 
		["Characters",
		"Bman", #кто говорит
		"Никто не даёт мне кредит... на ремонт не хватает. Дадите?", #что говорит
		"Мужик с улицы (C)", #Имя говорящего
		"Простите, банк не может вам одобрить займ", #Ответ на лево
		"Ну коли мы последняя инстанция, держи под 35%", #ответ на право
		+10, #Ренессанс на лево 6
		+5, #Люди на лево 7
		0, #ЦБ на лево 8
		-15, #Деньги на лево 9
		-15, #Ренессанс на право 10
		0, #Люди на право 11
		+15, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],

	"Random5" : 
		["Characters",
		"CBomjMan", #кто говорит
		"Привет! Я за баблом! хахахаха!!! Возвращать, конечно не буду xD", #что говорит
		"Бомж (BlackList)", #Имя говорящего
		"От вас воняет, уходите отсюда", #Ответ на лево
		"Да, сейчас оформим", #ответ на право
		-15, #Ренессанс на лево 6
		+20, #Люди на лево 7
		+20, #ЦБ на лево 8
		-15, #Деньги на лево 9
		+25, #Ренессанс на право 10
		-20, #Люди на право 11
		-20, #ЦБ на право 12
		0, #Деньги на право 13
		"Random5a",
		"Random5a",
		"None"],
		
	"Random5a" : 
		["Characters",
		"CBomjMan", #кто говорит
		"Я буду жаловаться в ЦБ! Сильно при сильно!", #что говорит
		"Бомж (BlackList)", #Имя говорящего
		"Хорошо... хорошо... вот деньги. Только уходи", #Ответ на лево
		"Ну и жалуйся. Удачи тебе!", #ответ на право
		+15, #Ренессанс на лево 6
		-15, #Люди на лево 7
		+20, #ЦБ на лево 8
		0, #Деньги на лево 9
		-20, #Ренессанс на право 10
		+20, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],

	"Random6" : 
		["Characters", #ссылка на папку персонажей 0
		"DmitriyOvsyannikov", #кто говорит 1
		"Я пришел сюда за кредиткой. Больше ничего не предлагать!", #что говорит 2
		"Дмитрий (A+)", #Имя говорящего 3
		"Ну так не интересно!", #Ответ на лево 4
		"Кредитка, так кредитка", #ответ на право 5
		+10, #Ренессанс на лево 6
		+10, #Люди на лево 7
		-15, #ЦБ на лево 8
		-15, #Деньги на лево 9
		-20, #Ренессанс на право 10
		-20, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random", #Следующая карта на лево
		"Random",
		"None"],

	"Random7" : 
		["Characters",
		"Chechen", #кто говорит
		"В вашАм Панке у меня есть кредиДка. ХАчу втАрАя братан", #что говорит
		"Марио (BlackList)", #Имя говорящего
		"Стоп... больше одной кредитки мы не выдаём!", #Ответ на лево
		"Без проблем организуем вам наш продукт", #ответ на право
		+10, #Ренессанс на лево 6
		+15, #Люди на лево 7
		+15, #ЦБ на лево 8
		-20, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],

	"Random8" : 
		["Characters",
		"BArtem", #кто говорит
		"Мне пришла СМС о том, что одобрена кредитная карта", #что говорит
		"Артём (B)", #Имя говорящего
		"Приходите завтра. Система барахлит", #Ответ на лево
		"Да, держите кредитку", #ответ на право
		+15, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		-15, #Деньги на лево 9
		-10, #Ренессанс на лево 6
		-15, #Люди на лево 7
		0, #ЦБ на лево 8
		-15, #Деньги на лево 9
		"Random",
		"Random",
		"None"],

	"Random9" : 
		["Characters",
		"KristinaStepanova", #кто говорит
		"Хочу положить деньги на депозит. 400'000.", #что говорит
		"Кристина", #Имя говорящего
		"Извините, но наш банк переполнен", #Ответ на лево
		"Да, давайте откроем вам счет", #ответ на право
		+10, #Ренессанс на лево 6
		+15, #Люди на лево 7
		0, #ЦБ на лево 8
		+25, #Деньги на лево 9
		-10, #Ренессанс на лево 6
		-20, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		"Random",
		"Random",
		"None"],

	"Random10" : 
		["Characters",
		"Babylia", #кто говорит
		"Я принесла 10'000 на депозит. Через год накопится мильён?", #что говорит
		"Бабуля со Стамбула", #Имя говорящего
		"Мне жаль вас расстраивать... но...", #Ответ на лево
		"Конечно! Даже два!", #ответ на право
		+10, #Ренессанс на лево 6
		+10, #Люди на лево 7
		+20, #ЦБ на лево 8
		+20, #Деньги на лево 9
		-15, #Ренессанс на право 10
		-15, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],

	"Random11" : 
		["Characters", #ссылка на папку персонажей 0
		"IlonMask", #кто говорит 1
		"Я принес немного денег на депозит. Где разгрузить грузовик?", #что говорит 2
		"Илон Маск", #Имя говорящего 3
		"Банк не в состоянии принять ваши дары, извините", #Ответ на лево 4
		"Подкатите машину к заднему ходу", #ответ на право 5
		+10, #Ренессанс на лево 6
		0, #Люди на лево 7
		-5, #ЦБ на лево 8
		+40, #Деньги на лево 9
		-10, #Ренессанс на право 10
		0, #Люди на право 11
		+5, #ЦБ на право 12
		0, #Деньги на право 13
		"Random", #Следующая карта на лево
		"Random",
		"None"],

	"Random12" : 
		["Characters",
		"Mafiosi", #кто говорит
		"За мной гонятся! Быстрее возьмите деньги на сохранение!", #что говорит
		"Подозрительный тип", #Имя говорящего
		"Стоп. А кто за вами гонится?", #Ответ на лево
		"С удовольствием швыряйте в кассира сумку!", #ответ на право
		-10, 0, -10, 0,
		+20, 0, +30, +20,
		"Random",
		"Random",
		"None"],

	"Random13" : 
		["Characters",
		"GrishaGrachev", #кто говорит
		"Хочу открыть брокерский счет", #что говорит
		"Григорий (А+)", #Имя говорящего
		"Конечно, сейчас откроем", #Ответ на лево
		"Откроем! Вас кредитануть дополнительно?", #ответ на право
		+5, #Ренессанс на лево 6
		0, #Люди на лево 7
		+10, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		+15, #Люди на право 11
		-10, #ЦБ на право 12
		0, #Деньги на право 13
		"Random13a",
		"Random",
		"None"],
		
	"Random13a" : 
		["Characters",
		"GrishaGrachev", #кто говорит
		"Нет, спасибо. Только брокерский счет", #что говорит
		"Григорий (А+)", #Имя говорящего
		"Ну не хотите, дело ваше", #Ответ на лево
		"Извините, я вас уже кредитанул под 10% на 1'000'000", #ответ на право
		+20, #Ренессанс на лево 6
		-10, #Люди на лево 7
		0, #ЦБ на лево 8
		-20, #Деньги на лево 9
		-20, #Ренессанс на право 10
		+15, #Люди на право 11
		+20, #ЦБ на право 12
		0, #Деньги на право 13
		"Random13b",
		"Random",
		"None"],
		
	"Random13b" : 
		["Characters",
		"GrishaGrachev", #кто говорит
		"СКОЛЬКО??? Ладно... проинвестируем. Спасибо", #что говорит
		"Григорий (А+)", #Имя говорящего
		"Удачных покупок", #Ответ на лево
		"Удачных инвестиций", #ответ на право
		0, #Ренессанс на лево 6
		+10, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		+10, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random14" : 
		["Characters",
		"BitKogan", #кто говорит
		"Я бы потестил брокерские услуги и написал обзор", #что говорит
		"BitKogan", #Имя говорящего
		"Чтобы ты нас обосрал? Ну уж нет!", #Ответ на право
		"Сейчас откроем вам счет", #ответ на лево
		+10, #Ренессанс на лево 6
		-20, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		-10, #Ренессанс на право 10
		0, #Люди на право 11
		+20, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random15" : 
		["Characters",
		"InvestorJunior", #кто говорит
		"Откройте мне брокерский счет пожалуйста. Я близок к богатству!", #что говорит
		"Юный инвестор", #Имя говорящего
		"Размечтался...", #Ответ на лево
		"Конечно! Ренессанс Верит в вас!", #ответ на право
		+20, #Ренессанс на лево 6
		+20, #Люди на лево 7
		0, #ЦБ на лево 8
		+20, #Деньги на лево 9
		-10, #Ренессанс на право 10
		-10, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],

	"Random16" : 
		["Characters",
		"OstapBender", #кто говорит
		"Я опытны инвестор. Раскрою банку секреты... за плату", #что говорит
		"Бендер (BlackList)", #Имя говорящего
		"Какой-то ты подозрительный...", #Ответ на лево
		"Ну, чтож мы не против подзаработать", #ответ на право
		-20, #Ренессанс на лево 6
		0, #Люди на лево 7
		+15, #ЦБ на лево 8
		-20, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		-15, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random17" : 
		["Characters",
		"OlegTinkoff", #кто говорит
		"Мой Банк разорился. Дайте денег на покупку телека, плиз", #что говорит
		"Олег (A+)", #Имя говорящего
		"Не выдержал конкуренции с нашим банком?", #Ответ на лево
		"Олеж, конечно дадим друг", #ответ на право
		0, #Ренессанс на лево 6
		-25, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random17a",
		"Random",
		"None"],
		
	"Random17a" : 
		["Characters",
		"OlegTinkoff", #кто говорит
		"Да. Ваш Банк разорил мой. Дайте денег... плиз", #что говорит
		"Олег (A+)", #Имя говорящего
		"Обойдёсся", #Ответ на лево
		"Да, конечно дадим", #ответ на право
		+5, #Ренессанс на лево 6
		+25, #Люди на лево 7
		-5, #ЦБ на лево 8
		-20, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		+20, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random18" : 
		["Characters",
		"BillGates", #кто говорит
		"Никогда не брал кредиты. Хочу купить чайник. Займёте?", #что говорит
		"Билл (A)", #Имя говорящего
		"Билл!? Что случилось?", #Ответ на лево
		"Да, конечно", #ответ на право
		0, #Ренессанс на лево 6
		+10, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		+10, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		-10, #Деньги на право 13
		"Random18a",
		"Random",
		"None"],
		
	"Random18a" : 
		["Characters",
		"BillGates", #кто говорит
		"Да, ничего. Просто дурью маюсь", #что говорит
		"Билл (A)", #Имя говорящего
		"Ок, сейчас оформим", #Ответ на лево
		"Одну минутку и кредит ваш", #ответ на право
		+10, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		+10, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		-10, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random19" : 
		["Characters",
		"Putin", #кто говорит
		"Некогда объяснять. Срочно нужны деньги на диван", #что говорит
		"Володя (A+++)", #Имя говорящего
		"Слушаюсь", #Ответ на лево
		"Слушаюсь", #ответ на право
		+10, #Ренессанс на лево 6
		-10, #Люди на лево 7
		-20, #ЦБ на лево 8
		-20, #Деньги на лево 9
		+10, #Ренессанс на право 10
		-10, #Люди на право 11
		-20, #ЦБ на право 12
		-10, #Деньги на право 13
		"Random",
		"Random",
		"None"],
	
	"Random20" : 
		["Characters",
		"MegaBomj", #кто говорит
		"Я сейчас выбью из вас деньги себе на машину!!!", #что говорит
		"МегаБомж (Z---)", #Имя говорящего
		"Охрана выведите этого джнтельмена", #Ответ на лево
		"Я выдам тебе кредит, но больше не приходи плиз", #ответ на право
		0, #Ренессанс на лево 6
		-10, #Люди на лево 7
		-10, #ЦБ на лево 8
		0, #Деньги на лево 9
		+10, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		-20, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random21" : 
		["Characters",
		"RomanShabanov", #кто говорит
		"Мне нужен кредит на хату. Дома не одобряют", #что говорит
		"Парень из Эстонии", #Имя говорящего
		"Лиц из Эстонии не обслуживаем", #Ответ на лево
		"Конечно, под 12% годовых", #ответ на право
		0, #Ренессанс на лево 6
		+10, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		-10, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random21a",
		"Random",
		"None"],
	
	"Random21a" : 
		["Characters",
		"RomanShabanov", #кто говорит
		"эээй а что так много... В европе дешевле!", #что говорит
		"Парень из Эстонии", #Имя говорящего
		"Ну у нас Россия! Большая страна, большие %ты", #Ответ на лево
		"Ну сорян братан...", #ответ на право
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"Random22" : 
		["Characters",
		"CBreviewer", #кто говорит
		"Покажите отчетность за прошлый квартал", #что говорит
		"Ревизор из ЦБ", #Имя говорящего
		"Мы пришлем его по готовности", #Ответ на лево
		"Конечо, держите", #ответ на право
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		-20, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Ivent",
		"Random",
		"CentralBankDice1"],
		
	"Random23" : 
		["Characters",
		"IlonMask", #кто говорит
		"Пришел журналист. Ответишь ему на пару вопросов?", #что говорит
		"Мишель. Маркетинг", #Имя говорящего
		"Нет, уж увольте...", #Ответ на лево
		"Конечо, мне есть что рассказать", #ответ на право
		-10, #Ренессанс на лево 6
		-10, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Ivent",
		"Random",
		"MiniCardMix1"],
		
	"Random24" : 
		["Characters",
		"RomanShabanov", #кто говорит
		"Прошлый квартал оказался не прибыльным. Придётся понизить всем зарплату", #что говорит
		"Главный бухгалтер", #Имя говорящего
		"Нет, я не пожертвую благополучием команды", #Ответ на лево
		"Эх... ок!", #ответ на право
		0, #Ренессанс на лево 6
		5, #Люди на лево 7
		-10, #ЦБ на лево 8
		-25, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"StatusScreen",
		"Random",
		"TeamDown"],
		
	"Random25" : 
		["Characters",
		"MegaBomj", #кто говорит
		"Предлагаю вложить деньги вкладчиков в акции. Центробанку это не понравится, но мы сможем заработать", #что говорит
		"Шон, Брокер", #Имя говорящего
		"На это я пойти не могу", #Ответ на лево
		"Ладно, рискнём", #ответ на право
		-10, #Ренессанс на лево 6
		+15, #Люди на лево 7
		+20, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"StatusScreen",
		"Random",
		"CustomersUp"],
		
	"Random26" : 
		["Characters",
		"Putin", #кто говорит
		"Предлагаю, повысить ставку по кредитам на время. Это дост дополнительные средства", #что говорит
		"Джоф, аналитик", #Имя говорящего
		"Нет, Центральному Банку это не понравится", #Ответ на лево
		"Похоже у нас нет выбора...", #ответ на право
		+5, #Ренессанс на лево 6
		-5, #Люди на лево 7
		+5, #ЦБ на лево 8
		-10, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"StatusScreen",
		"Random",
		"MoneyUp"],
		
	"Random27" : 
		["Characters",
		"AnastasiyaCherevatkina", #кто говорит
		"Если одобрите мне кредит? Я могу улучшить репутацию банка", #что говорит
		"Парень со связями", #Имя говорящего
		"Нет, правила есть правила", #Ответ на лево
		"Держи и делай свою магию", #ответ на право
		-10, #Ренессанс на лево 6
		-15, #Люди на лево 7
		-20, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		+10, #ЦБ на право 12
		-20, #Деньги на право 13
		"StatusScreen",
		"Random",
		"CentralBankDown"],
		
	"TeamUp" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"TeamUp", #кто говорит 1
		"Дух Банка ратет. Многие устраиваются к вам на работу", #что говорит 2
		"Рост Банка", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"CustomersUp" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"CustomersUp", #кто говорит 1
		"О Банке ходят хорошие слухи. Осторожно, радостные клиенты - это тоже опастность", #что говорит 2
		"В лучах славы", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"CentralBankUp" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"CentralBankUp", #кто говорит 1
		"Ваши действия вызвали черезу проверок в Банке. Обстановка накаляется", #что говорит 2
		"Большой Брат не дремлет", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"MoneyUp" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"MoneyUp", #кто говорит 1
		"Деньги идут в Банк сами. Распоряжайтесь ими грамотно. Успех не вечен.", #что говорит 2
		"Головокружение от успехов", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"TeamDown" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"TeamDown", #кто говорит 1
		"Ваши действия привели к падению морального духа в Банке", #что говорит 2
		"Массовые увольнения", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"CustomersDown" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"CustomersDown", #кто говорит 1
		"Чтобы вы не сделалиб, клиентам это не нравится. О вас говорят негативно", #что говорит 2
		"Дурная репутация", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"CentralBankDown" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"CentralBankDown", #кто говорит 1
		"Центральный Банк теряет интерес к вашему Банку. Это хорошо?", #что говорит 2
		"Игра по правилам", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"MoneyDown" : 
		["StatusScreen", #ссылка на папку персонажей 0
		"MoneyDown", #кто говорит 1
		"Ваша активность ведет к постоянным тратам. Казна уменьшается", #что говорит 2
		"Финансовые расходы", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
		
	"LooseTopHealth" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseTopHealth", #кто говорит 1
		"Банк стал слишком уверенным в себе и нанял кучу сотрудников", #что говорит 2
		"В Банке бардак", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"LooseBottomHealth" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseBottomHealth", #кто говорит 1
		"Сотрудники потеряли веру в Банк", #что говорит 2
		"Все уволились", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
	
	"LooseTopLaw" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseTopLaw", #кто говорит 1
		"В офис ринулась толпа радостных клиентов. Банк лопнул от потока людей", #что говорит 2
		"Слишком сильная любовь", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"LooseBottomLaw" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseBottomLaw", #кто говорит 1
		"Ваш Банк нигде не любят. Клиенты закрыли все счета", #что говорит 2
		"Банк загнулся", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
	
	"LooseTopBanditism" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseTopBanditism", #кто говорит 1
		"Вы слишком заметны для ЦБ. Вас взяли под контроль", #что говорит 2
		"Под властью ЦБ", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"LooseBottomBanditism" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseBottomBanditism", #кто говорит 1
		"Вы не светитесь перед ЦБ. ЦБ решил, что Банк не эффективен", #что говорит 2
		"Отзыв лицензии", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"LooseTopLuck" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseTopLuck", #кто говорит 1
		"Ваш Банк затопило деньгами. Все погибли", #что говорит 2
		"Потоп бабла", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
	"LooseBottomLuck" : 
		["LooseScreen", #ссылка на папку персонажей 0
		"LooseBottomLuck", #кто говорит 1
		"Деньги закончились. Банку не на что существовать", #что говорит 2
		"Банкрот", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"],
		
		"Ivent" : 
		["Ivent", #ссылка на папку персонажей 0
		"Ivent", #кто говорит 1
		" ", #что говорит 2
		" ", #Имя говорящего 3
		" ", #Ответ на лево 4
		" ", #ответ на право 5
		0, #Ренессанс на лево 6
		0, #Люди на лево 7
		0, #ЦБ на лево 8
		0, #Деньги на лево 9
		0, #Ренессанс на право 10
		0, #Люди на право 11
		0, #ЦБ на право 12
		0, #Деньги на право 13
		"Random",
		"Random",
		"None"]
	}
