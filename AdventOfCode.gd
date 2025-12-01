class_name Main
extends Node

static func read_lines_from_file(path: String) -> Array:
	var lines: Array = []

	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Could not open file: %s" % path)
		return lines

	while not file.eof_reached():
		var line := file.get_line()
		lines.append(line)

	file.close()
	return lines
