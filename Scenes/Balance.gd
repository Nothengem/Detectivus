extends Control

onready var HealthProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/HealthProgress")
onready var LawProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/LawProgress")
onready var BanditismProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/BanditismProgress")
onready var LuckProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/LuckProgress")

#переменные для коррекции после победы в ивентах
var Modi
var a
var b

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
	


func change_proportions_ivent_loose():
	Scriptwriter.Heath_var = Scriptwriter.Heath_var + Scriptwriter.IventLoseTeam
	animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
	
	Scriptwriter.Law_var = Scriptwriter.Law_var + Scriptwriter.IventLoseClient
	animate_value_law(LawProgress.value, Scriptwriter.Law_var)
	
	Scriptwriter.Banditism_var = Scriptwriter.Banditism_var + Scriptwriter.IventLoseCentralBank
	animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
	
	Scriptwriter.Luck_var = Scriptwriter.Luck_var + Scriptwriter.IventLoseMoney
	animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)
	


func change_proportions_ivent_win():
	print("Функция вызвалась")
	Modi = Scriptwriter.IventCorrectorModificator
	
	if Scriptwriter.IventVarCorrection == "Team":
		b = Scriptwriter.Heath_var
		correction_calculating()
		Scriptwriter.Heath_var = b
		animate_value_health(HealthProgress.value, Scriptwriter.Heath_var)
		
	elif Scriptwriter.IventVarCorrection == "Customers":
		b = Scriptwriter.Law_var
		correction_calculating()
		Scriptwriter.Law_var = b
		animate_value_law(LawProgress.value, Scriptwriter.Law_var)
		
	elif Scriptwriter.IventVarCorrection == "CentralBank":
		b = Scriptwriter.Banditism_var
		correction_calculating()
		Scriptwriter.Banditism_var = b
		animate_value_banditism(BanditismProgress.value, Scriptwriter.Banditism_var)
		
	elif Scriptwriter.IventVarCorrection == "Money":
		b = Scriptwriter.Luck_var
		correction_calculating()
		Scriptwriter.Luck_var = b
		animate_value_luck(LuckProgress.value, Scriptwriter.Luck_var)



func correction_calculating():
	if b < 50:
		b = b + Modi
		print("сработала в плюс")
	elif b > 50:
		print("сработала в минус")
		b = b - Modi
	elif b == 50:
		print("сработала в молоко")
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
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/HealthProgress, "value", start, end, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func animate_value_law(start, end):
	if LawProgress.value > Scriptwriter.Law_var:
		$AnimPlayerLaw.play("LawMinus")
		
	elif LawProgress.value < Scriptwriter.Law_var:
		$AnimPlayerLaw.play("LawPlus")
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/LawProgress, "value", start, end, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func animate_value_banditism(start, end):
	if BanditismProgress.value > Scriptwriter.Banditism_var:
		$AnimPlayerBanditism.play("BanditismMinus")
		
	elif BanditismProgress.value < Scriptwriter.Banditism_var:
		$AnimPlayerBanditism.play("BanditismPlus")
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/BanditismProgress, "value", start, end, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func animate_value_luck(start, end):
	if LuckProgress.value > Scriptwriter.Luck_var:
		$AnimPlayerLuck.play("LuckMinus")
		
	elif LuckProgress.value < Scriptwriter.Luck_var:
		$AnimPlayerLuck.play("LuckPlus")
		
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/LuckProgress, "value", start, end, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()



func victory_count_update():
	$Control2/NinePatchRect/Victory_count.text = "Количество клиентов:" + str(Scriptwriter.victory_count) + "/" + str(Scriptwriter.count_to_victory)
