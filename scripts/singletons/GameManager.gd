extends Node

	# load dialogue
var dialogueResource:DialogueResource = load("res://dialogues/test.dialogue")

func _ready():
	Messenger.photoClicked.connect(_on_photo_clicked)
	Messenger.changeScene.connect(_on_change_scene)
	
func _on_change_scene(nextScene:String):
	match nextScene:
		"scene_1":
			get_tree().change_scene_to_file("res://scenes/first_pages.tscn")
		"scene_2":
			get_tree().change_scene_to_file("res://scenes/second_pages.tscn")
		"scene_3":
			get_tree().change_scene_to_file("res://scenes/final_pages.tscn")

func _on_photo_clicked(emitter:Node):
	print(emitter.DialogueOption)
	DialogueManager.show_example_dialogue_balloon(
		dialogueResource, 
		emitter.DialogueOption
		)
