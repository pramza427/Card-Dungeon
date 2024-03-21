extends MarginContainer

@onready var WeaponCardDataBase = preload("res://Assets/Cards/WeaponCardsDatabase.gd").new()
var CardName = "Sword"
@onready var CardInfo = WeaponCardDataBase.WEAPONS[WeaponCardDataBase.get(CardName)]

var startpos = Vector2()
var targetpos = Vector2()
var t = 0
var DRAWTIME = 1
var ORGANISETIME = 0.8
@onready var OgScale = scale
@onready var OgSize = size
var ShopZoom = 1.2


enum {
	InShop,
	InInventory,
	Hovered
}
var state = InShop

func _ready():
	$Border.scale *= OgSize/($Border.texture.get_size())
	$InfoContainer/Margin/Info/Center/WeaponName.text = CardInfo[0]
	$InfoContainer/Margin/Info/Hands/NumberHands.text = str(CardInfo[1])
	$InfoContainer/Margin/Info/DefenseContainer/Multi.text = str(CardInfo[2], "x")
	$InfoContainer/Margin/Info/SlashContainer/Multi.text = str(CardInfo[3], "x")
	$InfoContainer/Margin/Info/ChopContainer/Multi.text = str(CardInfo[4], "x")
	$InfoContainer/Margin/Info/BludgeonContainer/Multi.text = str(CardInfo[5], "x")
	$InfoContainer/Margin/Info/PierceContainer/Multi.text = str(CardInfo[6], "x")
	
	$ShopCost/Center/HBox/Margin/Coin.scale *= Vector2(20, 20)/($ShopCost/Center/HBox/Margin/Coin.texture.get_size())
	$ShopCost/Center/HBox/Cost.text = str(CardInfo[7])
	


var ZoomInSize = 1.5
var ZoomInTime = 0.2
var setup = true
var startscale = Vector2()
var CardPos = Vector2()
var ReOrgOtherCard = true

func _physics_process(delta):
	match state:
		InShop:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				scale = scale.lerp(OgScale, t)
				t += delta/float(ZoomInTime)
			else:
				position = targetpos
				scale = OgScale
		InInventory:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				scale = scale.lerp(OgScale, t)
				t += delta/float(ZoomInTime)
			else:
				position = targetpos
				scale = OgScale
		Hovered:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				scale = startscale * (1-t) + OgScale*ZoomInSize*t
				t += delta/float(ZoomInTime)
			else:
				position = targetpos
				scale = OgScale*ZoomInSize
			
			
func Setup():
	startpos = position
	startscale = scale
	t = 0
	setup = false
	

func buyCard():
	#$'../../Player'.Weapons.append(this)
	pass

func _on_buy_pressed():
	state = InInventory
	pass # Replace with function body.


func _on_buy_mouse_entered():
	match state:
		InShop:
			setup = true
			state = Hovered


func _on_buy_mouse_exited():
	match state:
		Hovered:
			setup = true
			state = InShop
