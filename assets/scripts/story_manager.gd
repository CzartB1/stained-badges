class_name StoryManager
extends Node

@export var corrupt:int
@export var suspicion:int
@export var incompetency:int
@export var debug_label:RichTextLabel
var call_queue:Array[FileResource]
@export var phone:Phone

func _ready() -> void:
	debug_label.visible=false

func _process(delta: float) -> void:
	if Input.is_action_pressed("debug_vars"):
		debug_label.visible=true
		debug_label.text="Corrupt: %d\nSuspicion: %d\nIncompetency: %d" % [corrupt, suspicion, incompetency]
	if Input.is_action_just_released("debug_vars"):
		debug_label.visible=false
