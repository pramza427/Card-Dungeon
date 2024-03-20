extends Node2D


@onready var CardDatabase = preload("res://Assets/Cards/CardDatabase.gd")
@onready var CardTotalElem = $Margin/HBox/DrawPileContainer/Center/CardCount/CardsTotal
@onready var CardsLeftElem = $Margin/HBox/DrawPileContainer/Center/CardCount/CardsLeft
@onready var CardsDiscardedElem = $Margin/HBox/DiscardPileContainer/CardCount/CardsDiscarded

var TotalCards = 0
var DrawPile = []
var DiscardPile = []
var currentCardID = 0

func _ready():
	DrawPile.append_array(CardDatabase.DECK)
	TotalCards = DrawPile.size()
	DrawPile.shuffle()
	CardTotalElem.text = str(TotalCards)
	CardsLeftElem.text = str(TotalCards)
	
func shuffleDeck():
	print("Shuffling")
	DrawPile.append_array(DiscardPile)
	DiscardPile.clear()
	DrawPile.shuffle()
	CardsLeftElem.text = str(DrawPile.size())
	CardsDiscardedElem.text = str(DiscardPile.size())


func dealCards(handSize = 6):
	var retHand = []
	for n in range(handSize):
		var NextCard = DrawPile.pop_front()
		if NextCard == null:
			shuffleDeck()
			NextCard = DrawPile.pop_front()
		retHand.append(NextCard)
		
	CardsLeftElem.text = str(DrawPile.size())
	return retHand
	

func reset():
	DrawPile.append_array(DiscardPile)
	DiscardPile.clear()
	DrawPile.shuffle()
	CardsLeftElem.text = str(DrawPile.size())
	CardsDiscardedElem.text = str(DiscardPile.size())
	

func discard(cardInfo):
	DiscardPile.append(cardInfo)
	CardsDiscardedElem.text = str(DiscardPile.size())
	

