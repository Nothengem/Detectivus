extends NinePatchRect

func cardupdate():
	$CardTextCont/CardText.text = Scriptwriter.CardText
	$CharNameCont/CharacterName.text = Scriptwriter.CardName

func cardupdate_dice():
	$CardTextCont/CardText.text = "Для прохождения проверки, нужно выкинуть " + str(Scriptwriter.IventDifficulty) + " или выше"
	$CharNameCont/CharacterName.text = " "
	
func cardupdate_ivent_win():
	$CardTextCont/CardText.text = Scriptwriter.IventWinText
	$CharNameCont/CharacterName.text = " "
	
func cardupdate_ivent_lose():
	$CardTextCont/CardText.text = Scriptwriter.IventLoseText
	$CharNameCont/CharacterName.text = " "
