extends Node


var game = {
	"duration": 480,
	"health": 6,
	"resource": 50,
	"spawn_timer": 15.0,
	"spawn_count": 3,
	"spawn_delay": 3,
	"offset": [-20.0, 25.0],
	"path_direction": [
		[
			{
				"progress": 0,
				"direction": "front",
			},
			{
				"progress": 199,
				"direction": "right"
			},
			{
				"progress": 440,
				"direction": "front"
			}
		],
		[
			{
				"progress": 0,
				"direction": "right",
			},
			{
				"progress": 269,
				"direction": "front"
			},
			{
				"progress": 514,
				"direction": "right"
			},
			{
				"progress": 1210,
				"direction": "front"
			}
		]
	],
	"next_stage": 6
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
		"damage": 25,
		"health": 100,
		"durability_reduction": 8,
		"area_damage": false,
		"slow_effect": false
	},
	{
		"name": "Railgun",
		"asset": preload("res://scenes/towers/railgun_1.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_2.tscn"),
		"timer": 1,
		"speed": 10,
		"damage": 15,
		"health": 100,
		"durability_reduction": 4,
		"area_damage": false,
		"slow_effect": false
	},
	{
		"name": "Cannon (V2)",
		"asset": preload("res://scenes/towers/cannon_2.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 5,
		"damage": 35,
		"health": 100,
		"durability_reduction": 5,
		"area_damage": false,
		"slow_effect": false
	},
	{
		"name": "Railgun (V2)",
		"asset": preload("res://scenes/towers/railgun_2.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_2.tscn"),
		"timer": 1,
		"speed": 12,
		"damage": 25,
		"health": 100,
		"durability_reduction": 2,
		"area_damage": false,
		"slow_effect": false
	},
	{
		"name": "Cannon (V3)",
		"asset": preload("res://scenes/towers/cannon_3.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_1.tscn"),
		"timer": 1,
		"speed": 5,
		"damage": 35,
		"health": 100,
		"durability_reduction": 3,
		"area_damage": true,
		"slow_effect": false
	},
	{
		"name": "Railgun (V3)",
		"asset": preload("res://scenes/towers/railgun_3.tscn"),
		"bullet": preload("res://scenes/bullets/bullet_2.tscn"),
		"timer": 1,
		"speed": 12,
		"damage": 25,
		"health": 100,
		"durability_reduction": 1,
		"area_damage": false,
		"slow_effect": true
	}
]

var enemy = [
	{
		"name": "Demon",
		"asset": preload("res://scenes/enemies/demon.tscn"),
		"health": 75,
		"speed": 25,
		"damage": 1,
		"reward": 5,
		"spawn_rate": 0.30
	},
	{
		"name": "Orc",
		"asset": preload("res://scenes/enemies/orc.tscn"),
		"health": 90,
		"speed": 15,
		"damage": 1,
		"reward": 8,
		"spawn_rate": 0.25
	},
	{
		"name": "Cyclops",
		"asset": preload("res://scenes/enemies/cyclops.tscn"),
		"health": 85,
		"speed": 20,
		"damage": 1,
		"reward": 10,
		"spawn_rate": 0.20
	},
	{
		"name": "Demon Boar",
		"asset": preload("res://scenes/enemies/demon_boar.tscn"),
		"health": 110,
		"speed": 25,
		"damage": 1,
		"reward": 14,
		"spawn_rate": 0.15
	},
	{
		"name": "Demon Fungus",
		"asset": preload("res://scenes/enemies/demon_fungus.tscn"),
		"health": 100,
		"speed": 45,
		"damage": 1,
		"reward": 18,
		"spawn_rate": 0.10
	}
]
