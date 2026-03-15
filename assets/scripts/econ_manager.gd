class_name EconomyManager
extends Node

var current_money:int=0
@export var starting_money:int=2500
@export var rent:int=500
@export var income:int=2500
@export var income_tax:float=0.15

func _ready() -> void:
	current_money=starting_money

func get_paid():
	current_money+=income*income_tax-rent
