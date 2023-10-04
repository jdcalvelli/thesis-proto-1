extends Node

	# load dialogue
var dialogueResource:DialogueResource = load("res://dialogues/test.dialogue")

func _ready():
	Messenger.photoClicked.connect(_on_photo_clicked)
	Messenger.changeScene.connect(_on_change_scene)
	
func _on_change_scene(nextScene:String):
	match nextScene:
		"scene_1":
			pass
		"scene_2":
			get_tree().change_scene_to_file("res://scenes/book_scene_2.tscn")
		"scene_3":
			print("NEXT SCENE")

func _on_photo_clicked(emitter:Node):
	print(emitter.DialogueOption)
	DialogueManager.show_example_dialogue_balloon(
		dialogueResource, 
		emitter.DialogueOption
		)
