extends Node

var maxHealth = 100
var health = 100
var lastHealth = 100

var coins = 20

@onready var HPBar = $PlayerInfo/Bars/Bar/Margin/HPBar
@onready var HPText = $PlayerInfo/Bars/Bar/HP/bg/Magin/HBoxContainer/Number
@onready var CoinNumber = $PlayerInfo/Counters/HBoxContainer/Money/TextureRect/Margin/HBoxContainer/Number

func _ready():
	pass
	

func heal(percent = 20):
	health = min(health + maxHealth / 100, maxHealth)
	HPBar.value = int(float(health)/maxHealth * 100)
	HPText.text = str(health)
	
	
func takeDamage(num = 20):
	health -= num
	HPText.text = str(health)
	HPBar.value = int(float(health)/maxHealth * 100)
	

func addCoins(num = 5):
	coins += num
	CoinNumber.text = coins