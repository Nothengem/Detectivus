extends NinePatchRect

var one = 0

func cardupdate():
	$CardTextCont/CardText.text = Scriptwriter.CardText
	$CharNameCont/CharacterName.text = Scriptwriter.CardName
