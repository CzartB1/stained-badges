class_name StoryManager
extends Node

@export var corrupt:int
@export var suspicion:int
@export var incompetency:int
@export var debug_label:RichTextLabel
@export var phone:Phone
@export var killer_scene:PackedScene
@export var killer_spawn:Node3D
var call_queue:Array[DialogueResource]
var prio_call_queue:Array[DialogueResource]

## story progression tracker
var incomp_event:int=0 #0 = 1st strike; 1 = 2nd strike; 2 = fired
var sus_event:int=0
var corrupt_event:int=0 

func _ready() -> void:
	debug_label.visible=false

func _process(delta: float) -> void:
	if Input.is_action_pressed("debug_vars"):
		debug_label.visible=true
		debug_label.text="Corrupt: %d\nSuspicion: %d\nIncompetency: %d" % [corrupt, suspicion, incompetency]
	if Input.is_action_just_released("debug_vars"):
		debug_label.visible=false
	if !prio_call_queue.is_empty() and !phone.in_call:
		phone.current_dialogue = prio_call_queue[0]
		prio_call_queue.pop_front()

func check_for_calls():
	if call_queue.is_empty(): return
	phone.current_dialogue = call_queue[0]
	call_queue.pop_front()

func check_sus_route():
	if suspicion>=1 and sus_event<=0:
		sus_event=1
		print("[STORY] play event 1")
	elif suspicion>=4 and sus_event<=1:
		sus_event=2
		print("[STORY] play event 2")
	elif suspicion>=5 and sus_event<=2:
		sus_event=3
		print("[STORY] spawn killer")

func check_corrupt_route():
	if corrupt>=1 and corrupt_event<=0:
		corrupt_event=1
		print("[STORY] play event 1")
	elif corrupt>=4 and corrupt_event<=1:
		corrupt_event=2
		print("[STORY] play event 2")
	elif corrupt>=5 and corrupt_event<=2:
		corrupt_event=3
		print("[STORY] spawn killer")

func check_incompetent_route():
	if incompetency>=1 and incomp_event<=0:
		incomp_event=1
		print("[STORY] play event 1")
	elif incompetency>=4 and incomp_event<=1:
		incomp_event=2
		print("[STORY] play event 2")
	elif incompetency>=5 and incomp_event<=2:
		incomp_event=3
		print("[STORY] fired")
