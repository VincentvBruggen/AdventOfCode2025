class_name MainScript
extends Node

@onready var outputA: Label = $UI/Backgound/MarginContainer/VBoxContainer/OutputA
@onready var outputB: Label = $UI/Backgound/MarginContainer/VBoxContainer/OutputB
@onready var button_parent: VBoxContainer = $UI/Backgound/MarginContainer/VBoxContainer/ScrollContainer/ButtonParent

var buttons: Array
func _ready() -> void:
	buttons = button_parent.get_children()
	
	for button in buttons:
		button.output_a.connect(write_to_a)
		button.output_b.connect(write_to_b)
		
static func read_lines_from_file(path: String) -> Array[String]:
	var lines: Array[String] = []

	var file := FileAccess.open(path, FileAccess.READ)
	
	if file == null:
		push_error("Could not open file: %s" % path)
		return lines

	while not file.eof_reached():
		var line := file.get_line()
		lines.append(line)

	file.close()
	return lines

func write_to_a(input: String):
	outputA.text = "Output A: %s" % input
	
func write_to_b(input: String):
	outputB.text = "Output B: %s" % input
 
