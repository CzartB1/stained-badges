class_name FileDatabase
extends Node

@export var solved_files: Array[FileResource]
@export var files: Array[FileResource]
@export var story: StoryManager
@export var day: DayManager

func get_file() -> FileResource:
	var acceptable = files
	if day.day_number<2: 
		acceptable.filter(func(a:FileResource):a.file_importance==FileResource.importance.corrupt)
	return acceptable.pick_random()
