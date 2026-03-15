extends RayCast3D

@export var interact_label:RichTextLabel

func _process(_delta: float) -> void:
	if is_colliding() and get_collider() is Interactable:
		interact_label.text=get_collider().object_name
	else: interact_label.text=""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if is_colliding():
			var target = get_collider()
			if target is Interactable:
				target.execute()
