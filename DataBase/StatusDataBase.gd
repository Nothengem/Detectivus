extends Node

enum { 
	TeamUp, CustomersUp, CentralBankUp, MoneyUp, 
	TeamDown, CustomersDown, CentralBankDown, MoneyDown
}


#Формат - Наименование ивента : [на что влияет, сколько времени, скорость изменения в сек, в какую сторону?]
const DATA = {
	TeamUp : ["Scriptwriter.Heath_var", 20, 4, "Up"],
	CustomersUp : ["Scriptwriter.Law_var", 20, 4, "Up"],
	CentralBankUp : ["Scriptwriter.Banditism_var", 20, 4, "Up"],
	MoneyUp : ["Scriptwriter.Luck_var", 20, 4, "Up"],
	TeamDown : ["Scriptwriter.Heath_var", 20, 4, "Down"],
	CustomersDown : ["Scriptwriter.Law_var", 20, 4, "Down"],
	CentralBankDown : ["Scriptwriter.Banditism_var", 20, 4, "Down"],
	MoneyDown : ["Scriptwriter.Luck_var", 20, 4, "Down"]
}
 
