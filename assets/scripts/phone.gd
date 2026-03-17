class_name Phone
extends Interactable

@export var current_dialogue: DialogueResource

func execute() -> void:
	if current_dialogue:
		DialogueManager.show_dialogue_balloon(current_dialogue)
		current_dialogue=null
