extends CharacterBody3D


const SPEED = 5.0
var player:Player


func _physics_process(delta: float) -> void:
	if !player: player=get_tree().get_first_node_in_group("Player")
	if not is_on_floor():
		velocity += get_gravity() * delta

	self.look_at(player.global_position)
	velocity=-transform.basis.z*SPEED


	move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == player: print("player ded")
