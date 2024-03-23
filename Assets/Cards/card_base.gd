extends MarginContainer

@onready var CardDatabase = preload("res://Assets/Cards/CardDatabase.gd").new()
var CardInfo = [0, 0, "Defend", 10, 1, "shield.png"]

@onready var CardImg = str("res://Assets/Cards/CardImages/", CardInfo[Img])

var startpos = Vector2()
var targetpos = Vector2()
var t = 0
var DRAWTIME = 1
var ORGANISETIME = 0.8
@onready var OgScale = scale

# CardInfo indexes
enum {
	ID,
	Type,
	Name,
	Attack,
	Multi,
	Img
}

# States
enum {
	BeingDrawn,
	InHand,
	Hovered,
	Selected,
	InPlay,
	Playing
}
var state = BeingDrawn

func _ready():
	var CardSize = size
	$Border.scale *= CardSize/($Border.texture.get_size())
	$Image.texture = load(CardImg)
	$Image.scale *= CardSize/($Image.texture.get_size())
	$Focus.scale *= CardSize/($Focus.size)
	var attack = CardInfo[Attack]
	var cardName = CardInfo[Name]
	$Bars/Name.text = cardName
	$Bars/Attack.text = str(attack)
	
	if CardInfo[1] == 0 :
		$Border.modulate = "#343da3"
		$Bars/Name.modulate = "#343da3"
		$Bars/Attack.modulate = "#343da3"
	else:
		$Border.modulate = "#9c0031"
		$Bars/Name.modulate = "#9c0031"
		$Bars/Attack.modulate = "#9c0031"
		
	$Bars/Multiplier.modulate = "#9c0031"


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
				scale = OgScale*ZoomInSize
				position = targetpos
		InPlay:
			if setup:
				Setup()
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				scale = startscale.lerp(OgScale, t)
				t += delta/float(ZoomInTime)
			else:
				scale = OgScale
				position = targetpos
		Playing:
			if setup:
				Setup()
				targetpos = position 
				targetpos.y -= 50
			if t <= 1:
				position = startpos.lerp(targetpos, t)
				scale = startscale.lerp(OgScale, t)
				t += delta/float(ZoomInTime)
			else:
				scale = OgScale
				position = targetpos
			

func Setup():
	startpos = position
	startscale = scale
	t = 0
	setup = false


func trigger():
	$AnimationPlayer.play("TriggerCard")


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


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "TriggerCard":
		$"../../".playNextCard()
