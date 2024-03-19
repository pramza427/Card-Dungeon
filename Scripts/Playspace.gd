extends Node2D

const CardBase = preload("res://Scenes/card_base.tscn")

const CardSize = Vector2(125, 175)

var HandSize = 6
var PlaySize = 4
var currentHand = []
var currentSelections = []

func _ready() :
	currentHand = $Deck.dealCards(HandSize)
	print(currentHand)
	renderCards()
	
		
func renderCards():
	var allCardsWidth = CardSize.x * currentHand.size()
	var start = 100
	var steps = CardSize.x
	# if enough space for the cards then just print them side to side
	if allCardsWidth < get_viewport().size.x - 200:
		start = (get_viewport().size.x - allCardsWidth) / 2
	# if not enough space then reduce step count by the total overlap / number of cards
	else:
		steps -= (allCardsWidth - (get_viewport().size.x - 200)) / currentHand.size()
	for card in currentHand:
		var NewCard = CardBase.instantiate()
		NewCard.startpos = $Deck/DeckDraw.position
		NewCard.targetpos = Vector2(start, get_viewport().size.y - 350)
		NewCard.CardName = card[1]
		NewCard.scale *= CardSize/NewCard.size
		NewCard.CardPos = NewCard.targetpos
		$'Hand'.add_child(NewCard)
		start += steps
