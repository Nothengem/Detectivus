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
	elif ActiveStatusCount == 2:
		StatusTwoActivate()
	elif ActiveStatusCount == 3:
		StatusThreeActivate()
	elif ActiveStatusCount == 4:
		StatusFourActivate()



func StatusOneActivate():
	IventIconSlotOne = StatusIcon
	IventDurationOne.wait_time = int(StatusDuration)
	get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotOne")
	IventDurationOne.start()
	IventTickOne.start()
	print(IventIconSlotOne)
	$HBoxContainer/IventStatus1.texture = load (IventIconSlotOne)

func StatusTwoActivate():
	IventIconSlotTwo = StatusIcon
	IventDurationTwo.wait_time = int(StatusDuration)
	get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotOne")
	IventDurationTwo.start()
	IventTickTwo.start()
	$HBoxContainer/IventStatus2.texture = load (IventIconSlotTwo)

func StatusThreeActivate():
	IventIconSlotThree = StatusIcon
	IventDurationThree.wait_time = int(StatusDuration)
	get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotOne")
	IventDurationThree.start()
	IventTickThree.start()
	$HBoxContainer/IventStatus3.texture = load (IventIconSlotThree)

func StatusFourActivate():
	IventIconSlotFour = StatusIcon
	IventDurationFour.wait_time = int(StatusDuration)
	get_tree().call_group("BalanceGUI", "StatusFixingVariablesSlotOne")
	IventDurationFour.start()
	IventTickFour.start()
	$HBoxContainer/IventStatus4.texture = load ("Resources/GFX/StatusBars/NoItem.png")

func _on_StatusDuration1_timeout():
	IventTickOne.stop()
	$HBoxContainer/IventStatus1.texture = load ("Resources/GFX/StatusBars/NoItem.png")

func _on_StatusDuration2_timeout():
	IventTickTwo.stop()
	$HBoxContainer/IventStatus2.texture = load ("Resources/GFX/StatusBars/NoItem.png")

func _on_StatusDuration3_timeout():
	IventTickThree.stop()
	$HBoxContainer/IventStatus3.texture = load ("Resources/GFX/StatusBars/NoItem.png")

func _on_StatusDuration4_timeout():
	IventTickFour.stop()
	$HBoxContainer/IventStatus4.texture = load ("Resources/GFX/StatusBars/NoItem.png")
