extends Node

enum { 
	Dictor
	}

const DATA = {
	"Dictor": [ "Head[1]", "Neck[0]", "Shirt[1]", "Eyebrows[1]", "Eyes[1]", "Forehead[0]", "Ears[1]", "Jowls[0]", "Glasses[0]", "Mouth[1]", "Hair[1]", "Nose[1]"],
	
	"AlexeyKochanov" : [ "Head[2]", "Neck[0]", "Shirt[2]", "Eyebrows[2]", "Eyes[2]", "Forehead[0]", "Ears[2]", "Jowls[1]", "Glasses[0]", "Mouth[2]", "Hair[2]", "Nose[2]"],
	
	"AnastasiyaMalkova" : [ "Head[3]", "Neck[0]", "Shirt[3]", "Eyebrows[3]", "Eyes[3]", "Forehead[0]", "Ears[3]", "Jowls[2]", "Glasses[0]", "Mouth[3]", "Hair[3]", "Nose[3]"],
	
	"AnastasiyaCherevatkina" : [ "Head[4]", "Neck[0]", "Shirt[4]", "Eyebrows[4]", "Eyes[4]", "Forehead[0]", "Ears[4]", "Jowls[3]", "Glasses[0]", "Mouth[4]", "Hair[4]", "Nose[4]"],
	
	"AlexeySilkin" : [ "Head[5]", "Neck[0]", "Shirt[5]", "Eyebrows[5]", "Eyes[5]", "Forehead[1]", "Ears[3]", "Jowls[2]", "Glasses[1]", "Mouth[5]", "Hair[5]", "Nose[5]"],
	
	"Bman" : [ "Head[6]", "Neck[0]", "Shirt[6]", "Eyebrows[6]", "Eyes[6]", "Forehead[0]", "Ears[2]", "Jowls[1]", "Glasses[0]", "Mouth[6]", "Hair[6]", "Nose[6]"],
	
	"CBomjMan" : [ "Head[7]", "Neck[0]", "Shirt[7]", "Eyebrows[7]", "Eyes[7]", "Forehead[0]", "Ears[1]", "Jowls[0]", "Glasses[0]", "Mouth[7]", "Hair[7]", "Nose[5]"],
	
	"DmitriyOvsyannikov" : [ "Head[8]", "Neck[0]", "Shirt[8]", "Eyebrows[8]", "Eyes[8]", "Forehead[0]", "Ears[2]", "Jowls[1]", "Glasses[0]", "Mouth[8]", "Hair[8]", "Nose[4]"],
	
	"Chechen" : [ "Head[9]", "Neck[0]", "Shirt[9]", "Eyebrows[9]", "Eyes[9]", "Forehead[0]", "Ears[3]", "Jowls[2]", "Glasses[0]", "Mouth[9]", "Hair[9]", "Nose[3]"],
	
	"BArtem" : [ "Head[10]", "Neck[0]", "Shirt[10]", "Eyebrows[10]", "Eyes[10]", "Forehead[0]", "Ears[4]", "Jowls[3]", "Glasses[0]", "Mouth[10]", "Hair[10]", "Nose[2]"],
	
	"KristinaStepanova" : [ "Head[11]", "Neck[0]", "Shirt[9]", "Eyebrows[11]", "Eyes[11]", "Forehead[0]", "Ears[1]", "Jowls[0]", "Glasses[1]", "Mouth[11]", "Hair[11]", "Nose[1]"],
	
	"Babylia" : [ "Head[12]", "Neck[0]", "Shirt[8]", "Eyebrows[12]", "Eyes[10]", "Forehead[0]", "Ears[2]", "Jowls[1]", "Glasses[0]", "Mouth[12]", "Hair[10]", "Nose[2]"],
	
	"IlonMask" : [ "Head[13]", "Neck[0]", "Shirt[7]", "Eyebrows[13]", "Eyes[9]", "Forehead[0]", "Ears[3]", "Jowls[2]", "Glasses[0]", "Mouth[13]", "Hair[9]", "Nose[3]"],
	
	"Mafiosi" : [ "Head[14]", "Neck[0]", "Shirt[6]", "Eyebrows[14]", "Eyes[8]", "Forehead[0]", "Ears[4]", "Jowls[3]", "Glasses[0]", "Mouth[12]", "Hair[8]", "Nose[4]"],
	
	"GrishaGrachev" : [ "Head[13]", "Neck[0]", "Shirt[5]", "Eyebrows[15]", "Eyes[7]", "Forehead[1]", "Ears[3]", "Jowls[2]", "Glasses[1]", "Mouth[11]", "Hair[7]", "Nose[5]"],
	
	"BitKogan" : [ "Head[12]", "Neck[0]", "Shirt[4]", "Eyebrows[14]", "Eyes[6]", "Forehead[0]", "Ears[2]", "Jowls[1]", "Glasses[0]", "Mouth[10]", "Hair[6]", "Nose[6]"],
	
	"InvestorJunior" : [ "Head[11]", "Neck[0]", "Shirt[3]", "Eyebrows[13]", "Eyes[5]", "Forehead[0]", "Ears[1]", "Jowls[0]", "Glasses[0]", "Mouth[9]", "Hair[5]", "Nose[5]"],
	
	"OstapBender" : [ "Head[10]", "Neck[0]", "Shirt[2]", "Eyebrows[12]", "Eyes[4]", "Forehead[0]", "Ears[2]", "Jowls[1]", "Glasses[0]", "Mouth[8]", "Hair[4]", "Nose[4]"],
	
	"OlegTinkoff" : [ "Head[9]", "Neck[0]", "Shirt[1]", "Eyebrows[11]", "Eyes[3]", "Forehead[0]", "Ears[3]", "Jowls[2]", "Glasses[0]", "Mouth[7]", "Hair[3]", "Nose[3]"],
	
	"BillGates" : [ "Head[8]", "Neck[0]", "Shirt[2]", "Eyebrows[10]", "Eyes[2]", "Forehead[0]", "Ears[4]", "Jowls[3]", "Glasses[1]", "Mouth[6]", "Hair[2]", "Nose[2]"],
	
	"Putin" : [ "Head[7]", "Neck[0]", "Shirt[3]", "Eyebrows[9]", "Eyes[3]", "Forehead[1]", "Ears[3]", "Jowls[2]", "Glasses[0]", "Mouth[5]", "Hair[1]", "Nose[1]"],
	
	"MegaBomj" : [ "Head[6]", "Neck[0]", "Shirt[4]", "Eyebrows[8]", "Eyes[4]", "Forehead[0]", "Ears[2]", "Jowls[1]", "Glasses[0]", "Mouth[4]", "Hair[2]", "Nose[2]"],
	
	"RomanShabanov" : [ "Head[5]", "Neck[0]", "Shirt[5]", "Eyebrows[7]", "Eyes[5]", "Forehead[0]", "Ears[1]", "Jowls[0]", "Glasses[0]", "Mouth[3]", "Hair[3]", "Nose[3]"],
	
	"CBreviewer" : [ "Head[4]", "Neck[0]", "Shirt[6]", "Eyebrows[6]", "Eyes[6]", "Forehead[1]", "Ears[2]", "Jowls[1]", "Glasses[1]", "Mouth[2]", "Hair[4]", "Nose[4]"],
}
 
