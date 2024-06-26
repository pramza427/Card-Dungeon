extends Node2D

const CardBase = preload("res://Assets/Cards/card_base.tscn")
const Enemy = preload("res://Scenes/enemy.tscn")
@onready var FloorNumber = $FloorMargin/FloorCenter/HBox/FloorNumber
@onready var BaseAttackElem = $CalcContainer/Center/VBox/AttackLine/MarginAttack/Center/Margin/BaseAttack
@onready var AttackMultiElem = $CalcContainer/Center/VBox/AttackLine/MarginMultiplier/Center/Margin/Multiplier
@onready var TotalAttackElem = $CalcContainer/Center/VBox/AttackLine/TotalAttack
		
@onready var BaseDefenseElem = $CalcContainer/Center/VBox/DefenseLine/MarginDefense/Center/Margin/BaseDefense
@onready var DefenseMultiElem = $CalcContainer/Center/VBox/DefenseLine/MarginMultiplier2/Center/Margin/Multiplier
@onready var TotalDefenseElem = $CalcContainer/Center/VBox/DefenseLine/TotalDefense

const CardSize = Vector2(125, 175)

var HighestAttack = 0
var HandSize = 6
var PlaySize = 4
var drawingCards = []
var currentHand = []
var currentPlay = []
var currentLevel = 0
var discards = 1

var BaseAttack = 0
var AttackMulti = 1
var BaseDefense = 0
var DefenseMulti = 1

var currentPlayedCard = 0

func _ready() :
	pass
	

func nextLevel():
	currentLevel += 1
	FloorNumber.text = str(currentLevel)
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
	organiseCards($Hand, 350)
	

func organiseCards(parent, bottomOffset):
	var margin = 10
	var allCardsWidth = CardSize.x * parent.get_child_count()
	var start = 100
	var steps = CardSize.x + margin
	# if enough space for the cards then just print them side to side
	if allCardsWidth < get_viewport().size.x - 200:
		start = (get_viewport().size.x - allCardsWidth) / 2
	# if not enough space then reduce step count by the total overlap / number of cards
	else:
		steps -= (allCardsWidth - (get_viewport().size.x - 200)) / parent.get_child_count()
	for card in parent.get_children():
		card.targetpos = Vector2(start, get_viewport().size.y - bottomOffset)
		card.CardPos = card.targetpos
		start += steps
	
func _physics_process(delta):
	pass
	
func playNextCard():
	if currentPlayedCard < $InPlay.get_child_count():
		var card = $InPlay.get_child(currentPlayedCard)
		card.trigger()
		var info = card.CardInfo
		var type = info[card.Type]
		var power = info[card.Attack]
		var multi = info[card.Multi]
		match type:
			0:
				BaseDefense += power
				DefenseMulti *= multi
			1:
				BaseAttack += power
				AttackMulti *= multi
			2:
				BaseAttack += power
				AttackMulti *= multi
			3:
				BaseAttack += power
				AttackMulti *= multi
			4:
				BaseAttack += power
				AttackMulti *= multi
		
		BaseAttackElem.text = str(BaseAttack)
		AttackMultiElem.text = str(AttackMulti)
		TotalAttackElem.text = str(BaseAttack * AttackMulti)
		
		BaseDefenseElem.text = str(BaseDefense)
		DefenseMultiElem.text = str(DefenseMulti)
		TotalDefenseElem.text = str(BaseDefense * DefenseMulti)
		currentPlayedCard += 1
	else:
		currentPlayedCard = 0
		attack()
		

func attack():
	$Player.addShield(BaseDefense * DefenseMulti)
	$Enemy.takeDamage(BaseAttack * AttackMulti)
	
	
func takeDamage():
	var remainingHealth = $Enemy.health
	if remainingHealth <= 0:
		$Player.addCoins($Enemy.coins)
		remove_child($Enemy)
		clearBoard()
	else:
		clearInPlay()
		$Player.takeDamage($Enemy.attack())
	

func clearInPlay():
	BaseAttack = 0
	AttackMulti = 1
	BaseDefense = 0
	DefenseMulti = 1
	BaseAttackElem.text = str(BaseAttack)
	AttackMultiElem.text = str(AttackMulti)
	TotalAttackElem.text = str(BaseAttack * AttackMulti)
	BaseDefenseElem.text = str(BaseDefense)
	DefenseMultiElem.text = str(DefenseMulti)
	TotalDefenseElem.text = str(BaseDefense * DefenseMulti)
	for card in $InPlay.get_children():
		$Deck.discard(card.CardInfo)
		$InPlay.remove_child(card)
		
	
func clearBoard():
	drawingCards.clear()
	currentHand.clear()
	currentPlay.clear()
	clearInPlay()
	for c in $Hand.get_children():
		$Deck.discard(c.CardInfo)
		$Hand.remove_child(c)
	remove_child($Enemy)
	$Deck.reset()
	$Shop.setupShop()
	

func _on_play_pressed():
	for card in $Hand.get_children():
		if card.state == card.Selected:
			currentHand.erase(card.CardInfo)
			currentPlay.append(card.CardInfo)
			$Hand.remove_child(card)
			$InPlay.add_child(card)
			card.state = card.InPlay
		card.setup = true
	organiseCards($InPlay, 550)
	organiseCards($Hand, 350)
	playNextCard()
	


func _on_discard_pressed():
	for card in $Hand.get_children():
		if card.state == card.Selected:
			currentHand.erase(card.CardInfo)
			$Deck.discard(card.CardInfo)
			$Hand.remove_child(card)
		else:
			card.setup = true
	drawingCards = $Deck.dealCards(HandSize - currentHand.size())
	renderNewCards()
		
	


