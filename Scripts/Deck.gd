extends Node2D


@onready var CardDatabase = preload("res://Assets/Cards/CardDatabase.gd")
var DrawPile = []
var DiscardPile = []

func _ready():
	for type in CardDatabase.DECK:
		for n in range(10, 3, -2):
			var NewCard = CardDatabase.DECK[type]
			#if NewCard[0] > 0:
				#print(NewCard)
				#NewCard[2] = n
			DrawPile.append(NewCard)
	DrawPile.shuffle()
	dealCards()
	
func shuffleDeck():
	print("Shuffling")
	DrawPile.append_array(DiscardPile)
	DiscardPile.clear()
	DrawPile.shuffle()
	
func dealCards(handSize = 5):
	var retHand = []
	for n in range(handSize):
		var NextCard = DrawPile.pop_front()
		if NextCard == null:
			shuffleDeck()
			NextCard = DrawPile.pop_front()
		retHand.append(NextCard)
		
	return retHand
	
