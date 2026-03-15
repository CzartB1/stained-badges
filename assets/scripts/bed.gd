extends Interactable

@export var day: DayManager

func execute() -> void:
	day.next_day()
