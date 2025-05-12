extends Node2D

@onready var moneda_area = $MonedaArea
@onready var boto = $Control/Button
@onready var so = $so
@onready var explosio = preload("res://explosio.tscn")

var explotant = false
var boto_usat = false

func _ready():
	moneda_area.visible = false  # Amaguem la moneda al principi
	boto.visible = true          # Mostrem el botó

func _on_button_pressed() -> void:
	moneda_area.visible = true
	boto.visible = false
	explotant = false  # Permet fer clic després
	boto_usat = true
	
func _on_moneda_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not explotant:
		explode()

func explode():
	explotant = true
	moneda_area.visible = false
	so.play()
	

	var instancia = explosio.instantiate()
	instancia.global_position = moneda_area.global_position
	get_tree().current_scene.add_child(instancia)

	await get_tree().create_timer(0.5).timeout  # espera que acabi

	moneda_area.visible = true
	boto.visible = false
	explotant = false
