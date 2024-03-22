extends Node

@onready var HPBar = $EnemyInfo/HealthBar
@onready var HPText = $EnemyInfo/Margin/Margin/Health
@onready var AttackPowerText = $EnemyInfo/AttackContainer/AttackPower

var fullHealth = 0
var health = 0
var lastHealth = 0

var attackStrength = 0

var level = 1
var coins = 5

func _ready():
	setLevel()

func setHealth():
	var tempHealth = 30
	for n in range(level-1):
		tempHealth += tempHealth/2
	fullHealth = tempHealth 
	health = tempHealth
	lastHealth = tempHealth
	HPText.text = str(health)
	HPBar.value = 100
	
func setAttack():
	var tempAttack = 10
	for n in range(level-1):
		tempAttack += tempAttack/3
	attackStrength = tempAttack
	AttackPowerText.text = str(tempAttack)
	
func setCoins():
	var baseAmount = 5
	for n in range(level-1):
		coins += baseAmount
		

func setLevel():
	setHealth()
	setAttack()
	setCoins()


func _process(delta):
	if lastHealth != health:
		HPText.text = str(health)
		HPBar.value = int((float(health)/fullHealth)*100)
		lastHealth = health

