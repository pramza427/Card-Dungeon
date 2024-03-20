enum {Defend, Slash, Chop, Bludgeon, Pierce}

# [CardID, Type (0 defend, 1+ attack), Name, base values, image link]
const DECK = [
	[0, 0, "Defend", 10, "shield.png"],
	[1, 0, "Defend", 10, "shield.png"],
	[2, 0, "Defend", 8, "shield.png"],
	[3, 0, "Defend", 8, "shield.png"],
	[4, 0, "Defend", 6, "shield.png"],
	[5, 1, "Slash", 10, "slash.jpg"],
	[6, 1, "Slash", 8, "slash.jpg"],
	[7, 1, "Slash", 6, "slash.jpg"],
	[8, 1, "Slash", 4, "slash.jpg"],
	[9, 1, "Slash", 2, "slash.jpg"],
	[10, 2, "Chop", 10, "chop.jpg"],
	[11, 2, "Chop", 8, "chop.jpg"],
	[12, 2, "Chop", 6, "chop.jpg"],
	[13, 2, "Chop", 4, "chop.jpg"],
	[14, 2, "Chop", 2, "chop.jpg"],
	[15, 3, "Bludgeon", 10, "bludgeon.png"],
	[16, 3, "Bludgeon", 8, "bludgeon.png"],
	[17, 3, "Bludgeon", 6, "bludgeon.png"],
	[18, 3, "Bludgeon", 4, "bludgeon.png"],
	[19, 3, "Bludgeon", 2, "bludgeon.png"],
	[20, 4, "Pierce", 10, "pierce.png"],
	[21, 4, "Pierce", 8, "pierce.png"],
	[22, 4, "Pierce", 6, "pierce.png"],
	[23, 4, "Pierce", 4, "pierce.png"],
	[24, 4, "Pierce", 2, "pierce.png"],
]


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
