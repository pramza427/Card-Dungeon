extends Node

var maxHealth = 100
var health = 100
var lastHealth = 100

var Shield = 0

var coins = 20

@onready var HPBar = $PlayerInfo/Bars/Bar/Margin/HPBar
@onready var HPText = $PlayerInfo/Bars/Bar/HP/bg/Magin/HBoxContainer/Number
@onready var CoinNumber = $PlayerInfo/Counters/HBoxContainer/Money/TextureRect/Margin/HBoxContainer/Number
@onready var ShieldNumber = $PlayerInfo/Counters/HBoxContainer/MarginContainer2/HBoxContainer/ShieldCount

var Weapons = []
var Shields = []

func _ready():
	pass
	

func addShield(num = 2):
	Shield += num
	ShieldNumber.text = str(Shield)


func healPercent(percent = 20):
	health = min(health + maxHealth / 100, maxHealth)
	HPBar.value = int(float(health)/maxHealth * 100)
	HPText.text = str(health)
	

func healValue(num = 1):
	health += num
	HPBar.value = int(float(health)/maxHealth * 100)
	HPText.text = str(health)
	

func takeDamage(num = 20):
	if Shield >= num:
		Shield -= num
	else:
		num -= Shield
		Shield = 0
		health -= num
	
	HPText.text = str(health)
	HPBar.value = int(float(health)/maxHealth * 100)
	ShieldNumber.text = str(Shield)
	

func addCoins(num = 5):
	coins += num
	CoinNumber.text = str(coins)
	
func removeCoins(num = 1):
	coins -= num
	CoinNumber.text = str(coins)
