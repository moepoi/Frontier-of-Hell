extends Node


var game = {
	"duration": 300,
	"health": 6,
	"resource": 50,
	"spawn_timer": 10.0,
	"spawn_count": 3,
	"spawn_delay": 2,
	"offset": [-40.0, 50.0],
	"path_direction": [
		[
			{
				"progress": 0,
				"direction": "front",
			},
			{
				"progress": 213,
				"direction": "left"
			},
			{
				"progress": 712,
				"direction": "front"
			},
			{
				"progress": 896,
				"direction": "right"
			},
			{
				"progress": 1593,
				"direction": "front"
			},
            {
				"progress": 1787,
				"direction": "left"
			}
		]
	],
	"next_stage": 4
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
		"spawn_rate": 0.60
	},
	{
		"name": "Orc",
		"asset": preload("res://scenes/enemies/orc.tscn"),
		"health": 90,
		"speed": 15,
		"damage": 1,
		"reward": 8,
		"spawn_rate": 0.30
	},
	{
		"name": "Cyclops",
		"asset": preload("res://scenes/enemies/cyclops.tscn"),
		"health": 85,
		"speed": 20,
		"damage": 1,
		"reward": 10,
		"spawn_rate": 0.10
	}
]
