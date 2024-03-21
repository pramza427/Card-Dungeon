extends Node2D

@onready var WeaponsData = preload("res://Assets/Cards/WeaponCardsDatabase.gd").new()
@onready var WeaponCard = preload("res://Scenes/weapon_card.tscn")

var MarginBetweenCards = 10
var NumOfWeapons = 3

func _ready():
	spawnWeapons()

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
		

func _on_leave_shop_pressed():
	pass
	
func showShop():
	
	pass

