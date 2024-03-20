extends Node2D

@onready var WeaponsData = preload("res://Assets/Cards/WeaponCardsDatabase.gd").new()
@onready var WeaponCard = preload("res://Scenes/weapon_card.tscn")


func _ready():
	spawnWeapons()
	pass

func spawnWeapons():
	var weaponSize = WeaponsData["WEAPONS"].size()
	var w1 = WeaponsData["WEAPONS"].get(randi() % weaponSize)
	var w2 = WeaponsData["WEAPONS"].get(randi() % weaponSize)
	var weapons1 = WeaponCard.instantiate()
	weapons1.startpos = $Margin/Margin/VBoxContainer.position
	weapons1.CardName = w1[0]
	#weapons1.scale *= CardSize/weapons1.size
	$WeaponCards.add_child(weapons1)
	
	var weapons2 = WeaponCard.instantiate()
	weapons2.startpos = $Margin/Margin/VBoxContainer.position + weapons1.size
	weapons2.CardName = w2[0]
	#weapons1.scale *= CardSize/weapons1.size
	$WeaponCards.add_child(weapons2)

func _on_leave_shop_pressed():
	pass
