extends Interactable

var holder:FileHolder
#@export var importance: FileResource.importance
@export var database: FileDatabase

func execute() -> void:
	super.execute()
	if !holder: holder=get_tree().get_first_node_in_group("FileHolder")
	if database.solved_files.has(holder.current_file): 
		print("[FILE TAKER] File already in database.")
	else: 
		database.solved_files.append(holder.current_file)
		print("[FILE TAKER] File taken.")
	holder.take_current_file()
