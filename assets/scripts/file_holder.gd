class_name FileHolder
extends Node

var current_file:FileResource
@export var file_shower:TextureRect
@export var hand:TextureRect

func _ready() -> void:
	self.add_to_group("FileHolder")
	file_shower.visible=false

func new_file(file:FileResource):
	current_file=file
	#TODO display file image
	print("[FILE HOLDER] current file changed: "+str(file.file_name))
	print("[FILE HOLDER] current file importance: "+str(file.importance.find_key(file.file_importance)))

func _process(delta: float) -> void:
	hand.visible=current_file!=null
	if current_file:
		if Input.is_action_just_pressed("read_file"):
			print("[FILE HOLDER] reading file")
			file_shower.texture=current_file.img
			file_shower.visible=true
		if Input.is_action_just_released("read_file"):
			file_shower.visible=false

func take_current_file():
	current_file=null
	print("[FILE HOLDER] current file emptied")
