extends Node2D

const CardBase = preload("res://Assets/Cards/card_base.tscn")
const Enemy = preload("res://Scenes/enemy.tscn")

const CardSize = Vector2(125, 175)

var HighestAttack = 0
var HandSize = 6
var PlaySize = 4
var drawingCards = []
var currentHand = []
var currentPlay = []
var currentLevel = 1

func _ready() :
	drawNewCards()
	spawnEnemy()
	
func spawnEnemy():
	var currentEnemy = Enemy.instantiate()
	currentEnemy.level = currentLevel
	add_child(currentEnemy)
	
	
func drawNewCards():
	drawingCards = $Deck.dealCards(HandSize - currentHand.size())
	renderNewCards()

func renderNewCards():
	for card in drawingCards:
		var NewCard = CardBase.instantiate()
		NewCard.startpos = $Deck.position + $Deck/Margin/HBox/DrawPileContainer.position + $Deck/Margin/HBox/DrawPileContainer/DeckDraw.position
		NewCard.CardInfo = card
		NewCard.scale *= CardSize/NewCard.size
		$Hand.add_child(NewCard)
		currentHand.append(card)
	drawingCards.clear()
	organiseCards()
	
func organiseCards():
	var allCardsWidth = CardSize.x * currentHand.size()
	var start = 100
	var steps = CardSize.x
	# if enough space for the cards then just print them side to side
	if allCardsWidth < get_viewport().size.x - 200:
		start = (get_viewport().size.x - allCardsWidth) / 2
	# if not enough space then reduce step count by the total overlap / number of cards
	else:
		steps -= (allCardsWidth - (get_viewport().size.x - 200)) / currentHand.size()
	for card in $Hand.get_children():
		card.targetpos = Vector2(start, get_viewport().size.y - 350)
		card.CardPos = card.targetpos
		start += steps
	

func playCards():
	var attackTotal = 0
	var attackMulti = 1
	var defenseTotal = 0
	var defenseMulti = 1
	for card in $InPlay.get_children():
		var info = card.CardInfo
		var type = info[1]
		var power = info[3]
		match type:
			0:
				defenseTotal += power
				pass
			1:
				attackTotal += power
				pass
			2:
				attackTotal += power
				pass
			3:
				attackTotal += power
				pass
			4:
				attackTotal += power
				pass
		$InPlay.remove_child(card)
		$Deck.discard(info)
	var attackFinal = attackTotal * attackMulti
	if attackFinal > HighestAttack:
		HighestAttack = attackFinal 
	
	$Enemy.health -= attackFinal
	
	if $Enemy.health <= 0:
		remove_child($Enemy)
		clearBoard()
	else:
		$Player.takeDamage($Enemy.attackStrength)
		drawNewCards()

func clearBoard():
	drawingCards.clear()
	currentHand.clear()
	currentPlay.clear()
	for c in $Hand.get_children():
		$Deck.discard(c.CardInfo)
		$Hand.remove_child(c)
	remove_child($Enemy)
	$Deck.reset()
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")


func _on_play_pressed():
	for card in $Hand.get_children():
		if card.state == 3:
			currentHand.erase(card.CardInfo)
			currentPlay.append(card.CardInfo)
			$Hand.remove_child(card)
			$InPlay.add_child(card)
			card.state = 4
		else:
			card.setup = true
	playCards()


func _on_discard_pressed():
	for card in $Hand.get_children():
		if card.state == 3:
			currentHand.erase(card.CardInfo)
			$Deck.discard(card.CardInfo)
			$Hand.remove_child(card)
		else:
			card.setup = true
	drawingCards = $Deck.dealCards(HandSize - currentHand.size())
	renderNewCards()
		
	


