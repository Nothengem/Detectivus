extends Control

export var change_speed = 20
onready var HealthProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/HealthProgress")
onready var LawProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/LawProgress")
onready var BanditismProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/BanditismProgress")
onready var LuckProgress = get_node("Control2/NinePatchRect/IndicatorBox/HBoxContainer/LuckProgress")
var Heath_var = 50
var Law_var = 50
var Banditism_var = 50
var Luck_var = 50
var maximum_value = 100


func change_proportions_right():
	Heath_var = Heath_var + Scriptwriter.HealthRightChoose
	animate_value_health(HealthProgress.value, Heath_var)	
	Law_var = Law_var + Scriptwriter.LawRightChoose
	animate_value_law(LawProgress.value, Law_var)		
	Banditism_var = Banditism_var + Scriptwriter.BanditismRightChoose
	animate_value_banditism(BanditismProgress.value, Banditism_var)
	Luck_var = Luck_var + Scriptwriter.LuckRightChoose
	Luck_var = Luck_var + Scriptwriter.LuckRightChoose
	animate_value_luck(LuckProgress.value, Luck_var)

func change_proportions_left():
	Heath_var = Heath_var + Scriptwriter.HealthLeftChoose
	animate_value_health(HealthProgress.value, Heath_var)
	Law_var = Law_var + Scriptwriter.LawLeftChoose
	animate_value_law(LawProgress.value, Law_var)
	Banditism_var = Banditism_var + Scriptwriter.BanditismLeftChoose
	animate_value_banditism(BanditismProgress.value, Banditism_var)
	Luck_var = Luck_var + Scriptwriter.LuckLeftChoose
	animate_value_luck(LuckProgress.value, Luck_var)

func animate_value_health(start, end):
	if HealthProgress.value > Heath_var:
		$AnimPlayerHealth.play("HealthMinus")
	elif HealthProgress.value < Heath_var:
		$AnimPlayerHealth.play("HealthPlus")
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/HealthProgress, "value", start, end, 2.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()


func animate_value_law(start, end):
	if LawProgress.value > Law_var:
		$AnimPlayerLaw.play("LawMinus")
	elif LawProgress.value < Law_var:
		$AnimPlayerLaw.play("LawPlus")
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/LawProgress, "value", start, end, 2.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()

func animate_value_banditism(start, end):
	if BanditismProgress.value > Banditism_var:
		$AnimPlayerBanditism.play("BanditismMinus")
	elif BanditismProgress.value < Banditism_var:
		$AnimPlayerBanditism.play("BanditismPlus")
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/BanditismProgress, "value", start, end, 2.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()

func animate_value_luck(start, end):
	if LuckProgress.value > Luck_var:
		$AnimPlayerLuck.play("LuckMinus")
	elif LuckProgress.value < Luck_var:
		$AnimPlayerLuck.play("LuckPlus")
	$Tween.interpolate_property($Control2/NinePatchRect/IndicatorBox/HBoxContainer/LuckProgress, "value", start, end, 2.5, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	$Tween.start()
