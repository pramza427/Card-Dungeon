enum {Defend, Slash, Chop, Bludgeon, Pierce}

# [Type (0 defend, 1+ attack), Name, base values, image link]
const DECK = {
	Defend :
		[0, "Defend", 10, "shield.png"],
	Slash :
		[1, "Slash", 10, "slash.jpg"],
	Chop :
		[2, "Chop", 10, "chop.jpg"],
	Bludgeon :
		[3, "Bludgeon", 10, "bludgeon.png"],
	Pierce :
		[4, "Pierce", 10, "pierce.png"],
}


##enum {Default, Sword, Axe, MorningStar, Dagger, LongSword, BattleAxe, Flail, Rapier, Claymore, GreatAxe, GrandMace, Spear}
## Multiplier based on attack type
#const WEAPONS = {
#	Default :
#		{
#			Hand: 1,
#			Slash : 1,
#			Chop : 1, 
#			Bludgeon : 1, 
#			Pierce : 1,
#		},
#	## Small Weapons
#	Sword :
#		{
#			Hand: 1,
#			Slash : 3,
#			Chop : 2, 
#			Bludgeon : 0, 
#			Pierce : 1,
#		},
#	Axe :
#		{
#			Hand : 1,
#			Slash : 2,
#			Chop : 3,
#			Bludgeon : 1, 
#			Pierce : 0,
#		},
#	MorningStar :
#		{
#			Hand : 1,
#			Slash : 0, 
#			Chop : 1,
#			Bludgeon : 3, 
#			Pierce : 2,
#		},
#	Dagger :
#		{
#			Hand : 1,
#			Slash : 1, 
#			Chop : 0, 
#			Bludgeon : 1, 
#			Pierce : 3,
#		},
#	## Medium Weapons
#	LongSword :
#		{
#			Hand: 1,
#			Slash : 4, 
#			Chop : 3, 
#			Bludgeon : 0, 
#			Pierce : 2,
#		},
#	BattleAxe :
#		{
#			Hand : 1,
#			Slash : 3,
#			Chop : 4,
#			Bludgeon : 2, 
#			Pierce : 0,
#		},
#	Flail :
#		{
#			Hand : 1,
#			Slash : 0, 
#			Chop : 2,
#			Bludgeon : 4, 
#			Pierce : 3,
#		},
#	Rapier :
#		{
#			Hand : 1,
#			Slash : 1, 
#			Chop : 0, 
#			Bludgeon : 1, 
#			Pierce : 4,
#		},
#	## Large Weapons
#	Claymore :
#		{
#			Hand: 2,
#			Slash : 5, 
#			Chop : 4, 
#			Bludgeon : 0, 
#			Pierce : 3,
#		},
#	GreatAxe :
#		{
#			Hand : 2,
#			Slash : 3,
#			Chop : 5,
#			Bludgeon : 2, 
#			Pierce : 0,
#		},
#	GrandMace :
#		{
#			Hand : 2,
#			Slash : 0, 
#			Chop : 1,
#			Bludgeon : 6, 
#			Pierce : 2,
#		},
#	Spear :
#		{
#			Hand : 2,
#			Slash : 1, 
#			Chop : 0,
#			Bludgeon : 2, 
#			Pierce : 6,
#		},
#}
#
