extends Node

enum { 
	BigSuccess, SmallSuccess, Nothing, BigLose, SmallLose,
	TeamUp, CustomersUp, CentralBankUp, MoneyUp,
	TeamDown, CustomersDown, CentralBankDown, ModeyDown
	}

const DATA = {
	#Формат: Наименование, подтип, действие, спрайт
	"BigSuccess": ["ChangeBalance", 25, "1"],
	"SmallSuccess": ["ChangeBalance", 10, "2"],
	"Nothing": ["ChangeBalance", 0, "3"],
	"BigLose": ["ChangeBalance", -25, "4"],
	"SmallLose": ["ChangeBalance", 10, "5"],
	"TeamUp": ["Status", "TeamUp", "6"],
	"CustomersUp": ["Status", "CustomersUp", "7"],
	"CentralBankUp": ["Status", "CentralBankUp", "8"],
	"MoneyUp": ["Status", "MoneyUp", "9"],
	"TeamDown": ["Status", "TeamDown", "10"],
	"CustomersDown": ["Status", "CustomersDown", "11"],
	"CentralBankDown": ["Status", "CentralBankDown", "12"],
	"MoneyDown": ["Status", "MoneyDown", "13"],
}
