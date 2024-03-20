extends Node

@onready var HPBar = $EnemyInfo/HealthBar
@onready var HPText = $EnemyInfo/Margin/Margin/Health
@onready var LevelText = $EnemyInfo/LevelContainer/LevelNumber
@onready var AttackPowerText = $EnemyInfo/AttackContainer/AttackPower

var fullHealth = 30
var health = 30
var lastHealth = 30

var attackStrength = 10

var level = 1

func setHealth(val = 30):
	fullHealth = val 
	health = val
	lastHealth = val
	HPText.text = str(val)
	HPBar.value = 100


func levelUp():
	level += 1
	LevelText.text = str(level)
	setHealth(fullHealth + fullHealth / 2)
	attackStrength += attackStrength / 3
	AttackPowerText.text = str(attackStrength)


func _process(delta):
	if lastHealth != health:
		HPText.text = str(health)
		HPBar.value = int((float(health)/fullHealth)*100)
		lastHealth = health

