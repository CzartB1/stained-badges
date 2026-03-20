extends Interactable

var holder:FileHolder
@export var story:StoryManager

func execute() -> void:
	super.execute()
	if !holder: holder=get_tree().get_first_node_in_group("FileHolder")
	match holder.current_file.file_importance:
		FileResource.importance.important:
			story.incompetency+=1
		FileResource.importance.corrupt:
			story.corrupt+=1
	print("[FILE SHREDDER] File Destroyed.")
	holder.take_current_file()
	
	story.check_corrupt_route()
	story.check_incompetent_route()
	story.check_sus_route()
