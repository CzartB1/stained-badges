extends Interactable

var holder:FileHolder
@export var files: Array[FileResource]
@export var day_manager: DayManager

func execute() -> void:
	super.execute()
	if !holder: holder=get_tree().get_first_node_in_group("FileHolder")
	if day_manager.current_case_amount==0: 
		print("[File Giver] files empty")
		return
	holder.new_file(files.pick_random())
	day_manager.take_file()
