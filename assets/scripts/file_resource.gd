class_name FileResource
extends Resource

enum importance{
	unimportant,
	important,
	corrupt
}

@export var file_name:String
@export var img:Texture2D
@export var file_importance:importance
