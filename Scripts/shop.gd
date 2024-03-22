extends Node2D

@onready var WeaponsData = preload("res://Assets/Cards/WeaponCardsDatabase.gd").new()
@onready var WeaponCard = preload("res://Scenes/weapon_card.tscn")

var MarginBetweenCards = 10
var NumOfWeapons = 3

var ShopTransitionTime = 1.0
var OutOfViewPos = Vector2()
var InViewPos = Vector2()
var StartPos = Vector2()
var setup = true
var t = 0
var DoneAnimating = true


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
	var health = player.maxHealth - player.health
	$HealingContainer/VBox/HBoxAll/HealAll/Margin/HBox/Cost.text = str(health)
	if health < 10:
		$HealingContainer/VBox/HBox10/Heal10.disabled = true
	else: 
		$HealingContainer/VBox/HBox10/Heal10.disabled = false
	if health < 5:
		$HealingContainer/VBox/HBox5/Heal5.disabled = true
	else: 
		$HealingContainer/VBox/HBox5/Heal5.disabled = false
	if health <= 0:
		$HealingContainer/VBox/HBox/Heal.disabled = true
		$HealingContainer/VBox/HBoxAll/HealAll.disabled = true
	else: 
		$HealingContainer/VBox/HBox/Heal.disabled = false
		$HealingContainer/VBox/HBoxAll/HealAll.disabled = false
	
	
	

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
	$'../Player'.removeCoins(1)
	$'../Player'.healValue(1)
	setupHealing()
	pass # Replace with function body.


func _on_heal_5_pressed():
	$'../Player'.removeCoins(5)
	$'../Player'.healValue(5)
	setupHealing()
	pass # Replace with function body.


func _on_heal_10_pressed():
	$'../Player'.removeCoins(10)
	$'../Player'.healValue(10)
	setupHealing()
	pass # Replace with function body.


func _on_heal_all_pressed():
	var healing = int($HealingContainer/VBox/HBoxAll/HealAll/Margin/HBox/Cost.text)
	$'../Player'.removeCoins(healing)
	$'../Player'.healValue(healing)
	setupHealing()
	pass # Replace with function body.
