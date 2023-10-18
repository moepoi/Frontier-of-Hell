extends Node


var game = {
	"duration": 300,
	"health": 6,
	"resource": 100,
	"spawn_timer": 3.0,
	"offset": [-30.0, 30.0],
	"path_direction": [
		[
			{
				"progress": 0,
				"direction": "right",
			},
			{
				"progress": 570,
				"direction": "front"
			},
			{
				"progress": 855,
				"direction": "right"
			}
		]
	]
}

var menu = [
	{
		"name": "Cannon",
		"image": load("res://assets/icons/towers/cannon-1.png"),
		"image_disabled": load("res://assets/icons/towers/cannon-1-disabled.png"),
		"price": 10
	},
	{
		"name": "Railgun",
		"image": load("res://assets/icons/towers/railgun-1.png"),
		"image_disabled": load("res://assets/icons/towers/railgun-1-disabled.png"),
		"price": 20
	},
	{
		"name": "Cannon (V2)",
		"image": load("res://assets/icons/towers/cannon-2.png"),
		"image_disabled": load("res://assets/icons/towers/cannon-2-disabled.png"),
		"price": 50
	},
	{
		"name": "Railgun (V2)",
		"image": load("res://assets/icons/towers/railgun-2.png"),
		"image_disabled": load("res://assets/icons/towers/railgun-2-disabled.png"),
		"price": 60
	},
	{
		"name": "Cannon (V3)",
		"image": load("res://assets/icons/towers/cannon-3.png"),
		"image_disabled": load("res://assets/icons/towers/cannon-3-disabled.png"),
		"price": 90
	},
	{
		"name": "Railgun (V3)",
		"image": load("res://assets/icons/towers/railgun-3.png"),
		"image_disabled": load("res://assets/icons/towers/railgun-3-disabled.png"),
		"price": 100
	}
]

var tower = [
	{
		"name": "Cannon",
		"asset": preload("res://scenes/towers/cannon_1.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 3,
		"damage": 30,
		"health": 100,
		"durability_reduction": 10
	},
	{
		"name": "Railgun",
		"asset": preload("res://scenes/towers/railgun_1.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 3,
		"damage": 40,
		"health": 100,
		"durability_reduction": 10
	},
	{
		"name": "Cannon (V2)",
		"asset": preload("res://scenes/towers/cannon_2.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 3,
		"damage": 40,
		"health": 100,
		"durability_reduction": 10
	},
	{
		"name": "Railgun (V2)",
		"asset": preload("res://scenes/towers/railgun_2.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 3,
		"damage": 40,
		"health": 100,
		"durability_reduction": 10
	},
	{
		"name": "Cannon (V3)",
		"asset": preload("res://scenes/towers/cannon_3.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 3,
		"damage": 40,
		"health": 100,
		"durability_reduction": 10
	},
	{
		"name": "Railgun (V3)",
		"asset": preload("res://scenes/towers/railgun_3.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 3,
		"damage": 40,
		"health": 100,
		"durability_reduction": 10
	}
]

var enemy = [
	{
		"name": "Demon",
		"health": 100,
		"speed": 30,
		"damage": 1,
		"reward": 10
	},
	{
		"name": "Orc",
		"health": 100,
		"speed": 30,
		"damage": 1,
		"reward": 20
	},
	{
		"name": "Cyclops",
		"health": 100,
		"speed": 30,
		"damage": 1,
		"reward": 30
	},
	{
		"name": "Demon Boar",
		"health": 100,
		"speed": 30,
		"damage": 1,
		"reward": 40
	},
	{
		"name": "Demon Fungus",
		"health": 100,
		"speed": 30,
		"damage": 1,
		"reward": 50
	},
	{
		"name": "Demon Shark",
		"health": 100,
		"speed": 30,
		"damage": 1,
		"reward": 60
	}
]
