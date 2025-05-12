extends Sprite2D

@export var explosio : PackedScene

var explotant = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and not explotant:
		kill()
#func _ready() -> void:
	#await get_tree().create_timer(1.0).timeout
	#kill()
func kill():
	explotant = true
	visible = false 
	
	$so.play()
	
	if explosio:
		var instancia = explosio.instantiate()
		instancia.global_position = global_position
		get_tree().current_scene.add_child(instancia)
	await get_tree().create_timer(1.0).timeout
	visible = true
	explotant = false
	
	queue_free()


func _on_button_pressed() -> void:
	$Moneda.mouse_filter = Control.MOUSE_FILTER_STOP
	$Control/Button.visible = false
	
