class_name DayManager
extends Node

var day_number:int=1
var current_case_amount:int=3
var current_case_reset_amount:int=3
@export var passive_case_increase:int=2
@export var econ:EconomyManager

func next_day():
	print("[DAY] Day advanced | Current day: %d" % day_number)
	econ.get_paid()
	day_number+=1
	current_case_reset_amount+=passive_case_increase
	current_case_amount=current_case_reset_amount

func take_file():
	current_case_amount-=1
	print("[DayManager] Current Case Amount: "+str(current_case_amount))
