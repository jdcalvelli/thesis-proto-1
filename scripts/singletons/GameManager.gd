extends Node

var dialogueResource:DialogueResource = load("res://dialogues/test.dialogue")
var dialogue_line:DialogueLine

func _ready():
	# load dialogue
	Messenger.photoClicked.connect(_on_photo_clicked)
	
func _on_photo_clicked(emitter:Node):
	print(emitter.DialogueOption)
	DialogueManager.show_example_dialogue_balloon(
		dialogueResource, 
		emitter.DialogueOption
		)
