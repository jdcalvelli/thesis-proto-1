extends AnimatedSprite2D

# THIS SHOULD ALL BE REFACTORED IM SO SORRY ME

@export var nextScene:String

var isPageEdgeHeld:bool

func _ready():
	# for holding page
	$PageEdge.input_event.connect(_on_page_edge_clicked)
	# for collision with center object
	$BookCenter.area_entered.connect(_on_edge_to_center)
	# for collision with ende object
	$BookEnd.area_entered.connect(_on_edge_to_end)

func _physics_process(delta):
	if isPageEdgeHeld:
		$PageEdge/CollisionShape2D.position.x = get_global_mouse_position().x
		# print($PageEdge/CollisionShape2D.position.x)

func _on_page_edge_clicked(viewport:Node, event:InputEvent, shape_idx:int):
	if event.is_action_pressed("mouse_click"):
		isPageEdgeHeld = true

func _on_edge_to_center(area:Area2D):
	print("BOOK CENTER ENTERED")
	frame = 1

func _on_edge_to_end(area:Area2D):
	print("BOOK END ENTERED")
	frame = 0
	isPageEdgeHeld = false
	# im hard coding this bc prototype lol
	$PageEdge/CollisionShape2D.position.x = 352
	Messenger.changeScene.emit(nextScene)
	
