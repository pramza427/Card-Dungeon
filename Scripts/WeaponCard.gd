extends MarginContainer

@onready var WeaponCardDataBase = preload("res://Assets/Cards/WeaponCardsDatabase.gd").new()
var CardName = "Default"
@onready var CardInfo = WeaponCardDataBase.WEAPONS[WeaponCardDataBase.get(CardName)]

var startpos = Vector2()
var targetpos = Vector2()
var t = 0
var DRAWTIME = 1
var ORGANISETIME = 0.8
@onready var OgScale = scale


enum {
	InShop,
	InInventory,
	Hovered
}
var state = InShop

func _ready():
	var CardSize = size
	$Border.scale *= CardSize/($Border.texture.get_size())
	$InfoContainer/Margin/Info/Center/WeaponName.text = CardInfo[0]
	$InfoContainer/Margin/Info/Hands/NumberHands.text = str(CardInfo[1], "x")
	$InfoContainer/Margin/Info/SlashContainer/Multi.text = str(CardInfo[2], "x")
	$InfoContainer/Margin/Info/ChopContainer/Multi.text = str(CardInfo[3], "x")
	$InfoContainer/Margin/Info/BludgeonContainer/Multi.text = str(CardInfo[4], "x")
	$InfoContainer/Margin/Info/PierceContainer/Multi.text = str(CardInfo[5], "x")
	


var ZoomInSize = 1.2
var ZoomInTime = 0.2
var setup = true
var startscale = Vector2()
var CardPos = Vector2()
var ReOrgOtherCard = true

func _physics_process(delta):
	pass

