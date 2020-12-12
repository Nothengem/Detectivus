extends NinePatchRect

func cardupdate():
	print(MainScene.CardText)
	print(MainScene.CardName)
	$CardTextCont/CardText.text = MainScene.CardText
	$CharNameCont/CharacterName.text = MainScene.CardName
