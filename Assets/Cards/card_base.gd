extends MarginContainer

@onready var CardDatabase = preload("res://Assets/Cards/CardDatabase.gd").new()
var CardInfo = [0, 0, "Defend", 10, "shield.png"]

@onready var CardImg = str("res://Assets/Cards/CardImages/", CardInfo[4])

var startpos = Vector2()
var targetpos = Vector2()
var t = 0
var DRAWTIME = 1
var ORGANISETIME = 0.8
@onready var OgScale = scale


enum {
	BeingDrawn,
	InHand,
	Hovered,
	Selected,
	InPlay
}
var state = BeingDrawn

func _ready():
	var CardSize = size
	$Border.scale *= CardSize/($Border.texture.get_size())
	$Image.texture = load(CardImg)
	$Image.scale *= CardSize/($Image.texture.get_size())
	$Focus.scale *= CardSize/($Focus.size)
	var Attack = CardInfo[3]
	var CardName = CardInfo[2]
	$Content/Bars/Name/Label.text = CardName
	$Content/Bars/Amount/Label.text = str(Attack)
	
	if CardInfo[0] == 0 :
		$Border.modulate = "#343da3"
		$Content/Bars/Name/Label.modulate = "#343da3"
		$Content/Bars/Amount/Label.modulate = "#343da3"
	else:
		$Border.modulate = "#9c0031"
		$Content/Bars/Name/Label.modulate = "#9c0031"
		$Content/Bars/Amount/Label.modulate = "#9c0031"


var ZoomInSize = 1.2
var ZoomInTime = 0.2
var setup = true
var startscale = Vector2()
var CardPos = Vector2()
var ReOrgOtherCard = true

func _physics_process(delta):
	match state:
		BeingDrawn:
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				t += delta/float(ORGANISETIME)
			else:
				position = targetpos
				state = InHand
		InHand:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				scale = startscale.lerp(OgScale, t)
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
				scale = OgScale*ZoomInSize
		Selected:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				t += delta/float(ZoomInTime)
			else:
				position = targetpos
		InPlay:
			pass
			

func Setup():
	startpos = position
	startscale = scale
	t = 0
	setup = false


func _on_focus_mouse_entered():
	match state:
		InHand:
			setup = true
			state = Hovered


func _on_focus_mouse_exited():
	match state:
		Hovered:
			setup = true
			state = InHand


func _on_focus_pressed():
	match state:
		Hovered:
			setup = true
			targetpos = position
			targetpos.y = position.y - 100
			state = Selected
		Selected:
			setup = true
			targetpos = CardPos
			state = InHand
	pass # Replace with function body.
