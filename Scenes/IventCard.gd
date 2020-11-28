extends NinePatchRect

func _ready():
	$CardTextCont/CardText.text = Global.CardText
	$CharNameCont/CharacterName.text = Global.CardName
