extends Node

enum {Intro1, Intro2, Intro3, Intro4, Intro5}

const DATA = {
	Intro1 : 
		["Characters", #ссылка на папку персонажей 0
		"BossDetective", #кто говорит 1
		"Hello my friend, Today some lady come to out Office. She Told that her husband miss", #что говорит 2
		"Albert, the Boss", #Имя говорящего 3
		"Let's see what I can do", #Ответ на лево 4
		"Thats right! I'm miss about job", #ответ на право 5
		-10, #Здоровье на лево 6
		-10, #Законность на лево 7
		+10, #Бандитизм на лево 8
		-10, #Удача на лево 9
		-10, #Здоровье на право 10
		-10, #Законность на право 11
		+10, #Бандидизм на право 12
		-10],#Удача на право 13
	
	Intro2 : 
		["Characters",
		"Prostitute", #кто говорит
		"I've missed my husband in a bar, last night. He didn't came back after drink with collegs. I worried about him.", #что говорит
		"Josephine", #Имя говорящего
		"I'm going to this bar", #Ответ на лево
		"Maby we should forget about him? Lets go eat pizza!", #ответ на право
		+10, 
		-10, 
		+10, 
		-10, 
		+10, #Удача на право
		-10, #Интуация на право
		+10, #Здоровье на право
		-10],#Закон на право
		
	Intro3 : 
		["Characters",
		"Witness", #кто говорит
		"Hello, I've seen her husband in 10 o'clock after bar, he was talking with some Ambal", #что говорит
		"Robert", #Имя говорящего
		"Okay, I will speack with him", #Ответ на лево
		"Time to kick somebody ass", #ответ на право
		+10, #Удача на лево
		-10, #Интуация на лево
		+10, #Здоровье на лево
		-10, #Закон на лево
		+10, #Удача на право
		-10, #Интуация на право
		+10, #Здоровье на право
		-10],#Закон на право
		
	Intro4 : 
		["Characters",
		"Ambal", #кто говорит
		"No i've never seen this guy before", #что говорит
		"Patrick", #Имя говорящего
		"You are lie. (kick his ass)", #Ответ на лево
		"Maby this money will help ypu tp remember him", #ответ на право
		+10, #Удача на лево
		-10, #Интуация на лево
		+10, #Здоровье на лево
		-10, #Закон на лево
		+10, #Удача на право
		-10, #Интуация на право
		+10, #Здоровье на право
		-10],#Закон на право
		
	Intro5 : 
		["Characters",
		"Prisoner", #кто говорит
		"Hey, I'm her husband. Police got me when", #что говорит
		"Jerod", #Имя говорящего
		"I finally fond you", #Ответ на лево
		"I fucked you wife", #ответ на право
		+10, #Удача на лево
		-10, #Интуация на лево
		+10, #Здоровье на лево
		-10, #Закон на лево
		+10, #Удача на право
		-10, #Интуация на право
		+10, #Здоровье на право
		-10],#Закон на право
	}
