class_name Phone
extends Interactable

@export var current_dialogue: DialogueResource
@export var effect: Sprite3D
var in_call=false

func _ready() -> void:
	effect.visible=false

func _process(delta: float) -> void:
	if current_dialogue and !effect.visible:
		effect.visible=true
	else: effect.visible=false

func execute() -> void:
	if current_dialogue:
		DialogueManager.show_dialogue_balloon(current_dialogue)
		current_dialogue=null
		in_call=true
		DialogueManager.dialogue_ended.connect(call_end)

func call_end():
	in_call=false
