class_name FileHolder
extends Node

var current_file:FileResource

func _ready() -> void:
	self.add_to_group("FileHolder")

func new_file(file:FileResource):
	current_file=file
	#TODO display file image
	print("[FILE HOLDER] current file changed: "+str(file.file_name))
	print("[FILE HOLDER] current file importance: "+str(file.importance.find_key(file.file_importance)))
	

func take_current_file():
	current_file=null
	print("[FILE HOLDER] current file emptied")
