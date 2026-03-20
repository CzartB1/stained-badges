extends Interactable

var holder:FileHolder
#@export var importance: FileResource.importance
@export var database: FileDatabase
@export var story:StoryManager

func execute() -> void:
	super.execute()
	if !holder: holder=get_tree().get_first_node_in_group("FileHolder")
	if database.solved_files.has(holder.current_file): 
		print("[FILE TAKER] File already in database.")
	else: 
		database.solved_files.append(holder.current_file)
		print("[FILE TAKER] File taken.")
	match holder.current_file.file_importance:
		FileResource.importance.unimportant:
			story.incompetency+=1
		FileResource.importance.corrupt:
			story.suspicion+=1
	holder.take_current_file()
	
	story.check_corrupt_route()
	story.check_incompetent_route()
	story.check_sus_route()
