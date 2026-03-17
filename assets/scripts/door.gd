extends Interactable

var plr:Player
@export var destination:Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !plr: plr=get_tree().get_first_node_in_group("Player")


func execute() -> void:
	if !plr: plr=get_tree().get_first_node_in_group("Player")
	if !destination:
		print("[door] WARNING!!! DOOR DOES NOT HAVE A DESTINATION: "+self.name)
		return
	plr.global_position=destination.global_position
