extends Control

onready var HealthProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/HealthProgress")
onready var LawProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/LawProgress")
onready var BanditismProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/BanditismProgress")
onready var LuckProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/LuckProgress")

#переменные для измененяи размеров индикаторов
var scale_max = Vector2(1.2, 1.2)
var scale_norm = Vector2(1, 1)
var scale_speed = 0.3

#переменные для коррекции после победы в ивентах
var Modi
var a
var b

#переменные для фиксации статусов
var IventSlot1
var IventSlot1Speed
var IventUpSlot1
var IventSlot2
var IventSlot2Speed
var IventUpSlot2
var IventSlot3
var IventSlot3Speed
var IventUpSlot3
var IventSlot4
var IventSlot4Speed
var IventUpSlot4

func _ready():
	Scriptwriter.Heath_var = 50
	Scriptwriter.Law_var = 50
	Scriptwriter.Banditism_var = 50
	Scriptwriter.Luck_var = 50
	victory_count_update()



func change_proportions_right():
	Scriptwriter.Heath_var = Scriptwriter.Heath_var + Scriptwriter.HealthRightChoose
	animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
	
	Scriptwriter.Law_var = Scriptwriter.Law_var + Scriptwriter.LawRightChoose
	animate_value_law(LawProgress.value, Scriptwriter.Law_var)
	
	Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + Scriptwriter.BanditismRightChoose
	animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
	
	Scriptwriter.Luck_var = Scriptwriter.Luck_var + Scriptwriter.LuckRightChoose
	animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
	


func change_proportions_left():
	Scriptwriter.Heath_var = Scriptwriter.Heath_var + Scriptwriter.HealthLeftChoose
	animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
	
	Scriptwriter.Law_var = Scriptwriter.Law_var + Scriptwriter.LawLeftChoose
	animate_value_law(LawProgress.value, Scriptwriter.Law_var)
	
	Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + Scriptwriter.BanditismLeftChoose
	animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
	
	Scriptwriter.Luck_var = Scriptwriter.Luck_var + Scriptwriter.LuckLeftChoose
	animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
	


func change_proportions_ivent_loose_dice():
	Scriptwriter.Heath_var = int(Scriptwriter.Heath_var + Scriptwriter.IventInfo[3])
	animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
	
	Scriptwriter.Law_var = Scriptwriter.Law_var + Scriptwriter.IventInfo[4]
	animate_value_law(LawProgress.value, Scriptwriter.Law_var)
	
	Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + Scriptwriter.IventInfo[5]
	animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
	
	Scriptwriter.Luck_var = Scriptwriter.Luck_var + Scriptwriter.IventInfo[6]
	animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)



func change_proportions_ivent_cardmix():
	animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
	animate_value_law(LawProgress.value, Scriptwriter.Law_var)
	animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
	animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)



func change_proportions_ivent_win(): #применение модификатора коррекции
	Modi = Scriptwriter.IventInfo[9]
	
	if Scriptwriter.IventInfo[8] == "Team":
		b = Scriptwriter.Heath_var
		correction_calculating()
		Scriptwriter.Heath_var = b
		animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		
	elif Scriptwriter.IventInfo[8] == "Customers":
		b = Scriptwriter.Law_var
		correction_calculating()
		Scriptwriter.Law_var = b
		animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		
	elif Scriptwriter.IventInfo[8] == "CentralBank":
		b = Scriptwriter.Banditism_var
		correction_calculating()
		Scriptwriter.Banditism_var = b
		animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		
	elif Scriptwriter.IventInfo[8] == "Money":
		b = Scriptwriter.Luck_var
		correction_calculating()
		Scriptwriter.Luck_var = b
		animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)



func correction_calculating():
	if b < 50:
		b = b + Modi
	elif b > 50:
		b = b - Modi
	elif b == 50:
		pass

#Когда-нибудь повторить
#func correction_calculating_Banditism():
#	a = 50 - Scriptwriter.Banditism_var
#	if a > 0:
#		while a != 0 or Modi != 0:
#			Scriptwriter.Banditism_var +=1
#			a -=1
#			Modi -=1
#	elif a < 0:
#		while a != 0 or Modi != 0:
#			Scriptwriter.Banditism_var +=1
#			a +=1
#			Modi -=1

func animate_value_health(start, end):
	if HealthProgress.value > Scriptwriter.Heath_var:
		$AnimPlayerHealth.play("HealthMinus")
		
	elif HealthProgress.value < Scriptwriter.Heath_var:
		$AnimPlayerHealth.play("HealthPlus")
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/HealthProgress, "value", start, end, scale_speed*7, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func animate_value_law(start, end):
	if LawProgress.value > Scriptwriter.Law_var:
		$AnimPlayerLaw.play("LawMinus")
		
	elif LawProgress.value < Scriptwriter.Law_var:
		$AnimPlayerLaw.play("LawPlus")
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/LawProgress, "value", start, end, scale_speed*7, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func animate_value_banditism(start, end):
	if BanditismProgress.value > Scriptwriter.Banditism_var:
		$AnimPlayerBanditism.play("BanditismMinus")
		
	elif BanditismProgress.value < Scriptwriter.Banditism_var:
		$AnimPlayerBanditism.play("BanditismPlus")
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/BanditismProgress, "value", start, end, scale_speed*7, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func animate_value_luck(start, end):
	if LuckProgress.value > Scriptwriter.Luck_var:
		$AnimPlayerLuck.play("LuckMinus")
		
	elif LuckProgress.value < Scriptwriter.Luck_var:
		$AnimPlayerLuck.play("LuckPlus")
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/LuckProgress, "value", start, end, scale_speed*7, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func victory_count_update():
	$Control2/NinePatchRect/Victory_count.text = "Количество клиентов:" + str(Scriptwriter.victory_count) + "/" + str(Scriptwriter.count_to_victory)



func yellow_indicatos_color_right():
	yellow_indicatos_color_middle()
	$Tween.stop(HealthProgress, "rect_scale")
	$Tween.stop(LawProgress, "rect_scale")
	$Tween.stop(BanditismProgress, "rect_scale")
	$Tween.stop(LuckProgress, "rect_scale")
	if !Scriptwriter.HealthRightChoose == 0:
		$Tween.interpolate_property(HealthProgress, "rect_scale", HealthProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(HealthProgress, "self_modulate", HealthProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !Scriptwriter.LawRightChoose == 0:
		$Tween.interpolate_property(LawProgress, "rect_scale", LawProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(LawProgress, "self_modulate", LawProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !Scriptwriter.BanditismRightChoose == 0:
		$Tween.interpolate_property(BanditismProgress, "rect_scale", BanditismProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(BanditismProgress, "self_modulate", BanditismProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !Scriptwriter.LuckRightChoose == 0:
		$Tween.interpolate_property(LuckProgress, "rect_scale", LuckProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(LuckProgress, "self_modulate", LuckProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()



func yellow_indicatos_color_left():
	yellow_indicatos_color_middle()
	$Tween.stop(HealthProgress, "rect_scale")
	$Tween.stop(LawProgress, "rect_scale")
	$Tween.stop(BanditismProgress, "rect_scale")
	$Tween.stop(LuckProgress, "rect_scale")
	if !Scriptwriter.HealthLeftChoose == 0:
		$Tween.interpolate_property(HealthProgress, "rect_scale", HealthProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(HealthProgress, "self_modulate", HealthProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !Scriptwriter.LawLeftChoose == 0:
		$Tween.interpolate_property(LawProgress, "rect_scale", LawProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(LawProgress, "self_modulate", LawProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !Scriptwriter.BanditismLeftChoose == 0:
		$Tween.interpolate_property(BanditismProgress, "rect_scale", BanditismProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(BanditismProgress, "self_modulate", BanditismProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !Scriptwriter.LuckLeftChoose == 0:
		$Tween.interpolate_property(LuckProgress, "rect_scale", LuckProgress.rect_scale, scale_max, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(LuckProgress, "self_modulate", LuckProgress.self_modulate, Color("ffd700"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()



func yellow_indicatos_color_middle():
	$Tween.stop(HealthProgress, "rect_scale")
	$Tween.stop(LawProgress, "rect_scale")
	$Tween.stop(BanditismProgress, "rect_scale")
	$Tween.stop(LuckProgress, "rect_scale")
	if !HealthProgress.rect_scale == scale_norm:
		$Tween.interpolate_property(HealthProgress, "rect_scale", HealthProgress.rect_scale, scale_norm, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(HealthProgress, "self_modulate", HealthProgress.self_modulate, Color("ffffff"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !LawProgress.rect_scale == scale_norm:
		$Tween.interpolate_property(LawProgress, "rect_scale", LawProgress.rect_scale, scale_norm, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(LawProgress, "self_modulate", LawProgress.self_modulate, Color("ffffff"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !BanditismProgress.rect_scale == scale_norm:
		$Tween.interpolate_property(BanditismProgress, "rect_scale", BanditismProgress.rect_scale, scale_norm, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(BanditismProgress, "self_modulate", BanditismProgress.self_modulate, Color("ffffff"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	if !LuckProgress.rect_scale == scale_norm:
		$Tween.interpolate_property(LuckProgress, "rect_scale", LuckProgress.rect_scale, scale_norm, scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		$Tween.interpolate_property(LuckProgress, "self_modulate", LuckProgress.self_modulate, Color("ffffff"), scale_speed, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()

#ШМАТОК КОДА ДЛЯ ИЗМЕНЕНИЯ БАЛАНСА ПО СТАТУСУ

func StatusFixingVariablesSlotOne():
	IventSlot1 = Scriptwriter.StatusInfo[2]
	IventSlot1Speed = Scriptwriter.StatusInfo[4]
	IventUpSlot1 = Scriptwriter.StatusInfo[5]
	
func StatusFixingVariablesSlotTwo():
	IventSlot2 = Scriptwriter.StatusInfo[2]
	IventSlot2Speed = Scriptwriter.StatusInfo[4]
	IventUpSlot2 = Scriptwriter.StatusInfo[5]
	
func StatusFixingVariablesSlotThree():
	IventSlot3 = Scriptwriter.StatusInfo[2]
	IventSlot3Speed = Scriptwriter.StatusInfo[4]
	IventUpSlot3 = Scriptwriter.StatusInfo[5]
	
func StatusFixingVariablesSlotFour():
	IventSlot4 = Scriptwriter.StatusInfo[2]
	IventSlot4Speed = Scriptwriter.StatusInfo[4]
	IventUpSlot4 = Scriptwriter.StatusInfo[5]
	
	
func _on_EverySecChanger1_timeout():
	if IventUpSlot1 == "Up":
		if IventSlot1 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var + IventSlot1Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot1 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var + IventSlot1Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot1 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + IventSlot1Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot1 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var + IventSlot1Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
			
	elif IventUpSlot1 == "Down":
		if IventSlot1 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var - IventSlot1Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot1 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var - IventSlot1Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot1 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var - IventSlot1Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot1 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var - IventSlot1Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)


func _on_EverySecChanger2_timeout():
	if IventUpSlot2 == "Up":
		if IventSlot2 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var + IventSlot2Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot2 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var + IventSlot2Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot2 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + IventSlot2Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot2 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var + IventSlot2Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
			
	elif IventUpSlot2 == "Down":
		if IventSlot2 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var - IventSlot2Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot2 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var - IventSlot2Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot2 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var - IventSlot2Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot2 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var - IventSlot2Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)


func _on_EverySecChanger3_timeout():
	if IventUpSlot3 == "Up":
		if IventSlot3 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var + IventSlot3Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot3 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var + IventSlot3Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot3 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + IventSlot3Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot3 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var + IventSlot3Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
			
	elif IventUpSlot3 == "Down":
		if IventSlot3 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var - IventSlot3Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot3 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var - IventSlot3Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot3 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var - IventSlot3Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot3 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var - IventSlot3Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)


func _on_EverySecChanger4_timeout():
	if IventUpSlot4 == "Up":
		if IventSlot4 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var + IventSlot4Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot4 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var + IventSlot4Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot4 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + IventSlot4Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot4 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var + IventSlot4Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
			
	elif IventUpSlot4 == "Down":
		if IventSlot4 == "Scriptwriter.Heath_var":
			Scriptwriter.Heath_var = Scriptwriter.Heath_var - IventSlot4Speed
			animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		elif IventSlot4 == "Scriptwriter.Law_var":
			Scriptwriter.Law_var = Scriptwriter.Law_var - IventSlot4Speed
			animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		elif IventSlot4 == "Scriptwriter.Banditism_var":
			Scriptwriter.Banditism_var = Scriptwriter.Banditism_var - IventSlot4Speed
			animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		elif IventSlot4 == "Scriptwriter.Luck_var":
			Scriptwriter.Luck_var = Scriptwriter.Luck_var - IventSlot4Speed
			animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
