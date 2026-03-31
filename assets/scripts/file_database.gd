class_name FileDatabase
extends Node

@export var solved_files: Array[FileResource]
@export var files: Array[FileResource]
@export var story: StoryManager
@export var day: DayManager

func get_file() -> FileResource:
	var acceptable = files
	
	if day.day_number < 3:
		print("[database] early file filter")
		acceptable = acceptable.filter(
			func(a: FileResource): 
				return a.file_importance != FileResource.importance.corrupt
		)
	
	if acceptable.is_empty():
		push_warning("[database] no acceptable files, falling back")
		acceptable = files
	
	return acceptable.pick_random()
