
enum {Buckler, Targe, KiteShield, TowerShield, Sword, Axe, MorningStar, Dagger, LongSword, BattleAxe, Flail, Rapier, Claymore, GreatAxe, GrandMace, Spear}
enum {Name, Hand, Defend, Slash, Chop, Bludgeon, Pierce, Price, Sell}
# Multiplier based on attack type
const WEAPONS = {
	## Shields
	Buckler :
		{
			Name: "Buckler",
			Hand: 1,
			Defend: 2,
			Slash : 1,
			Chop : 1, 
			Bludgeon : 1, 
			Pierce : 1,
			Price: 10,
			Sell: 3
		},
	Targe :
		{
			Name: "Targe",
			Hand: 1,
			Defend: 3,
			Slash : 1,
			Chop : 1, 
			Bludgeon : 1, 
			Pierce : 1,
			Price: 20,
			Sell: 5
		},
	KiteShield :
		{
			Name: "KiteShield",
			Hand: 1,
			Defend: 5,
			Slash : 1,
			Chop : 1, 
			Bludgeon : 1, 
			Pierce : 1,
			Price: 30,
			Sell: 8
		},
	TowerShield :
		{
			Name: "TowerShield",
			Hand: 1,
			Defend: 8,
			Slash : 1,
			Chop : 1, 
			Bludgeon : 1, 
			Pierce : 1,
			Price: 60,
			Sell: 20
		},
	## Small Weapons
	Sword :
		{
			Name: "Sword",
			Hand: 1,
			Defend: 1,
			Slash : 3,
			Chop : 2, 
			Bludgeon : 0, 
			Pierce : 1,
			Price: 20,
			Sell: 2
		},
	Axe :
		{
			Name: "Axe",
			Hand : 1,
			Defend: 1,
			Slash : 2,
			Chop : 3,
			Bludgeon : 1, 
			Pierce : 0,
			Price: 20,
			Sell: 2
		},
	MorningStar :
		{
			Name: "MorningStar",
			Hand : 1,
			Defend: 1,
			Slash : 0, 
			Chop : 1,
			Bludgeon : 3, 
			Pierce : 2,
			Price: 20,
			Sell: 2
		},
	Dagger :
		{
			Name: "Dagger",
			Hand : 1,
			Defend: 1,
			Slash : 1, 
			Chop : 0, 
			Bludgeon : 1, 
			Pierce : 3,
			Price: 20,
			Sell: 2
		},
	## Medium Weapons
	LongSword :
		{
			Name: "LongSword",
			Hand: 1,
			Defend: 1,
			Slash : 4, 
			Chop : 3, 
			Bludgeon : 0, 
			Pierce : 2,
			Price: 50,
			Sell: 5
		},
	BattleAxe :
		{
			Name: "BattleAxe",
			Hand : 1,
			Defend: 1,
			Slash : 3,
			Chop : 4,
			Bludgeon : 2, 
			Pierce : 0,
			Price: 50,
			Sell: 5
		},
	Flail :
		{
			Name: "Flail",
			Hand : 1,
			Defend: 1,
			Slash : 0, 
			Chop : 2,
			Bludgeon : 4, 
			Pierce : 3,
			Price: 50,
			Sell: 5
		},
	Rapier :
		{
			Name: "Rapier",
			Hand : 1,
			Defend: 1,
			Slash : 1, 
			Chop : 0, 
			Bludgeon : 1, 
			Pierce : 4,
			Price: 50,
			Sell: 5
		},
	## Large Weapons
	Claymore :
		{
			Name: "Claymore",
			Hand: 2,
			Defend: 1,
			Slash : 5, 
			Chop : 4, 
			Bludgeon : 0, 
			Pierce : 3,
			Price: 90,
			Sell: 10
		},
	GreatAxe :
		{
			Name: "GreatAxe",
			Hand : 2,
			Defend: 1,
			Slash : 3,
			Chop : 5,
			Bludgeon : 2, 
			Pierce : 0,
			Price: 90,
			Sell: 10
		},
	GrandMace :
		{
			Name: "GrandMace",
			Hand : 2,
			Defend: 1,
			Slash : 0, 
			Chop : 1,
			Bludgeon : 10, 
			Pierce : 2,
			Price: 90,
			Sell: 10
		},
	Spear :
		{
			Name: "Spear",
			Hand : 2,
			Defend: 1,
			Slash : 1, 
			Chop : 0,
			Bludgeon : 2, 
			Pierce : 10,
			Price: 90,
			Sell: 10
		},
}
