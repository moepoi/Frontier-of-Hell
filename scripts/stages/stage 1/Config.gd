extends Node

class_name Config

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
		"asset": preload("res://scenes/towers/cannon-1.tscn"),
		"timer": 0.2,
		"speed": 200,
		"damage": 30
	},
	{
		"name": "Railgun",
		"asset": preload("res://scenes/towers/railgun-1.tscn"),
		"timer": 0.2,
		"speed": 200,
		"damage": 40
	},
	{
		"name": "Cannon (V2)",
		"asset": preload("res://scenes/towers/cannon-2.tscn"),
		"timer": 0.2,
		"speed": 200,
		"damage": 40
	},
	{
		"name": "Railgun (V2)",
		"asset": preload("res://scenes/towers/railgun-2.tscn"),
		"timer": 0.2,
		"speed": 200,
		"damage": 40
	},
	{
		"name": "Cannon (V3)",
		"asset": preload("res://scenes/towers/cannon-3.tscn"),
		"timer": 0.2,
		"speed": 200,
		"damage": 40
	},
	{
		"name": "Railgun (V3)",
		"asset": preload("res://scenes/towers/railgun-3.tscn"),
		"timer": 0.2,
		"speed": 200,
		"damage": 40
	}
]
