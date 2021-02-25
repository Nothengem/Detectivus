extends CenterContainer

var TeamUp
var CustomersUp
var CentralBankUp
var MoneyUp
var TeamDown
var CustomersDown
var CentralBankDown
var ModeyDown
var ActiveStatusCount

onready var IventIconSlotOne = $HBoxContainer/IventStatus1.texture
onready var IventDurationOne = $HBoxContainer/IventStatus1/StatusDuration1
onready var IventTickOne = $HBoxContainer/IventStatus1/EverySecChanger1

onready var IventIconSlotTwo = $HBoxContainer/IventStatus2.texture
onready var IventDurationTwo = $HBoxContainer/IventStatus2/StatusDuration2
onready var IventTickTwo = $HBoxContainer/IventStatus2/EverySecChanger2

onready var IventIconSlotThree = $HBoxContainer/IventStatus3.texture
onready var IventDurationThree = $HBoxContainer/IventStatus3/StatusDuration3
onready var IventTickThree = $HBoxContainer/IventStatus3/EverySecChanger3

onready var IventIconSlotFour = $HBoxContainer/IventStatus4.texture
onready var IventDurationFour = $HBoxContainer/IventStatus4/StatusDuration4
onready var IventTickFour = $HBoxContainer/IventStatus4/EverySecChanger4


var StatusIcon
var BalanceChange
var StatusDuration
var PlusOrMinus
var SpeedOfChange

var BusySlotOne = false
var BusySlotTwo = false
var BusySlotThree = false
var BusySlotFour = false

func _ready():
	ActiveStatusCount = 0

func start_new_status():
	if ActiveStatusCount <= 4:
		ActiveStatusCount += 1
	elif ActiveStatusCount >= 4:
		pass
	status_variable()


func status_variable():
	StatusIcon = str ("res://Resources/GFX/StatusBars", "/", Scriptwriter.StatusInfo[1], ".png")
	BalanceChange = Scriptwriter.StatusInfo[2]
	StatusDuration = Scriptwriter.StatusInfo[3]
	SpeedOfChange = Scriptwriter.StatusInfo[4]
	PlusOrMinus = Scriptwriter.StatusInfo[5]
	
	if ActiveStatusCount == 1:
		StatusOneActivate()
		BusySlotOne = true
	elif ActiveStatusCount == 2:
		StatusTwoActivate()
		BusySlotTwo = true
	elif ActiveStatusCount == 3:
		StatusThreeActivate()
		BusySlotThree = true
	elif ActiveStatusCount == 4:
		StatusFourActivate()
		BusySlotFour = true



func StatusOneActivate():
	if BusySlotOne == false:
		IventIconSlotOne = StatusIcon
		IventDurationOne.wait_time = int(StatusDuration)
		get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotOne")
		IventDurationOne.start()
		IventTickOne.start()
		$HBoxContainer/IventStatus1.texture = load (IventIconSlotOne)
	elif BusySlotOne == true:
		StatusTwoActivate()

func StatusTwoActivate():
	if BusySlotTwo == false:
		IventIconSlotTwo = StatusIcon
		IventDurationTwo.wait_time = int(StatusDuration)
		get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotTwo")
		IventDurationTwo.start()
		IventTickTwo.start()
		$HBoxContainer/IventStatus2.texture = load (IventIconSlotTwo)
	elif BusySlotTwo == true:
		StatusThreeActivate()

func StatusThreeActivate():
	if BusySlotThree == false:
		IventIconSlotThree = StatusIcon
		IventDurationThree.wait_time = int(StatusDuration)
		get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotThree")
		IventDurationThree.start()
		IventTickThree.start()
		$HBoxContainer/IventStatus3.texture = load (IventIconSlotThree)
	elif BusySlotThree == true:
		StatusFourActivate()

func StatusFourActivate():
	if BusySlotFour == false:
		IventIconSlotFour = StatusIcon
		IventDurationFour.wait_time = int(StatusDuration)
		get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotFour")
		IventDurationFour.start()
		IventTickFour.start()
		$HBoxContainer/IventStatus4.texture = load (IventIconSlotFour)
	elif BusySlotFour == true:
		StatusOneActivate()

func _on_StatusDuration1_timeout():
	IventTickOne.stop()
	$HBoxContainer/IventStatus1.texture = load ("Resources/GFX/StatusBars/NoItem.png")
	ActiveStatusCount -= 1
	BusySlotOne = false

func _on_StatusDuration2_timeout():
	IventTickTwo.stop()
	$HBoxContainer/IventStatus2.texture = load ("Resources/GFX/StatusBars/NoItem.png")
	ActiveStatusCount -= 1
	BusySlotTwo = false

func _on_StatusDuration3_timeout():
	IventTickThree.stop()
	$HBoxContainer/IventStatus3.texture = load ("Resources/GFX/StatusBars/NoItem.png")
	ActiveStatusCount -= 1
	BusySlotThree = false

func _on_StatusDuration4_timeout():
	IventTickFour.stop()
	$HBoxContainer/IventStatus4.texture = load ("Resources/GFX/StatusBars/NoItem.png")
	ActiveStatusCount -= 1
	BusySlotFour = false
