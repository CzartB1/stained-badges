extends Interactable

var holder:FileHolder
#@export var importance: FileResource.importance

func execute() -> void:
	super.execute()
	if !holder: holder=get_tree().get_first_node_in_group("FileHolder")
	print("[FILE SHREDDER] File Destroyed.")
	holder.take_current_file()
