extends NinePatchRect

var one = 0

func cardupdate():
	print("Сработал CardUpdate------------------------------")
	$CardTextCont/CardText.text = Scriptwriter.CardText
	$CharNameCont/CharacterName.text = Scriptwriter.CardName
