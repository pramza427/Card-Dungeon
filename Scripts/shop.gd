extends Node2D

@onready var WeaponsData = preload("res://Assets/Cards/WeaponCardsDatabase.gd").new()
@onready var WeaponCard = preload("res://Scenes/weapon_card.tscn")

var MarginBetweenCards = 10
var NumOfWeapons = 2

var ShopTransitionTime = 1.0
var OutOfViewPos = Vector2()
var InViewPos = Vector2()
var StartPos = Vector2()
var setup = true
var t = 0
var DoneAnimating = true
var Coins = 0

enum {
	Hide,
	Show
}
var state = Hide


func _ready():
	OutOfViewPos = position
	InViewPos = position
	InViewPos.y -= $Margin.size.y
	

func Setup():
	StartPos = position
	t = 0
	DoneAnimating = false
	if state == Show:
		show()
	setup = false
	

func _physics_process(delta):
	match state:
		Hide:
			if setup:
				Setup()
			if t <= 1:
				position = StartPos.lerp(OutOfViewPos, t)
				t += delta/float(ShopTransitionTime)
			else:
				hide()
				position = OutOfViewPos
		Show:
			if setup:
				Setup()
			if t <= 1:
				position = StartPos.lerp(InViewPos, t)
				t += delta/float(ShopTransitionTime)
			else:
				position = InViewPos
	

func setupShop():
	spawnWeapons()
	setupHealing()
	showShop()
	

func spawnWeapons():
	for c in $WeaponCards.get_children():
		$WeaponCards.remove_child(c)
	var weaponSize = WeaponsData["WEAPONS"].size()
	for n in range(NumOfWeapons):
		
		var w = WeaponsData["WEAPONS"].get(randi() % weaponSize)
		var weaponCard = WeaponCard.instantiate()
		weaponCard.startpos = $WeaponCards.position 
		
		weaponCard.position.x += (weaponCard.size.x * n) + (MarginBetweenCards * n)
		weaponCard.targetpos = weaponCard.position
		weaponCard.CardName = w[0]
		#weapons1.scale *= CardSize/weapons1.size
		$WeaponCards.add_child(weaponCard)
		

func setupHealing():
	var player = $'../Player'
	if player.coins < 20 || (player.maxHealth == player.health):
		$HealingContainer/Margin/VBox/Heal.disabled = true
	

func showShop():
	setup = true
	state = Show


func hideShop():
	setup = true
	state = Hide
	

func _on_leave_shop_pressed():
	hideShop()


func _on_hidden():
	$'../'.nextLevel()
	pass
	


func _on_heal_pressed():
	$'../Player'.removeCoins(20)
	$'../Player'.healPercent(30)
	setupHealing()


func _on_shuffle_shop_pressed():
	spawnWeapons()
