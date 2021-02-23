extends Node

enum { 
	TeamUp, CustomersUp, CentralBankUp, MoneyUp, 
	TeamDown, CustomersDown, CentralBankDown, MoneyDown
}


#Формат - Наименование ивента : [на что влияет, сколько времени, скорость изменения в сек, в какую сторону?]
const DATA = {
	TeamUp : ["Status", "TeamUp", "Scriptwriter.Heath_var", 20, 1, "Up"],
	CustomersUp : ["Status", "CustomersUp", "Scriptwriter.Law_var", 20, 1, "Up"],
	CentralBankUp : ["Status", "CentralBankUp", "Scriptwriter.Banditism_var", 20, 1, "Up"],
	MoneyUp : ["Status", "MoneyUp", "Scriptwriter.Luck_var", 20, 1, "Up"],
	TeamDown : ["Status", "TeamDown", "Scriptwriter.Heath_var", 20, 1, "Down"],
	CustomersDown : ["Status", "CustomersDown", "Scriptwriter.Law_var", 20, 1, "Down"],
	CentralBankDown : ["Status", "CentralBankDown", "Scriptwriter.Banditism_var", 20, 1, "Down"],
	MoneyDown : ["Status", "MoneyDown", "Scriptwriter.Luck_var", 20, 1, "Down"]
}
 
