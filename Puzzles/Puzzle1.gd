extends Button

var input = Main.read_lines_from_file("res://inputFile.txt")

func _ready() -> void:
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var dial: int = 50
	var output: int = 0
	
	for line in input:
		var regex = RegEx.new()
		regex.compile("^([A-Za-z]+)(\\d+)$")  # pattern: letters then digits
		
		var match = regex.search(line)
		
		if match:
			var letter = match.get_string(1)  # first group, letters part
			var number_str = match.get_string(2)  # second group, digit part
			var number = int(number_str)  # convert to int
			
			if letter == "R":
				for i in number:
					dial += 1
					if dial > 99:
						dial = 0
					if dial == 0:
						output +=1
			else:
				for i in number:
					dial -= 1
					if dial < 0:
						dial = 99
					if dial == 0:
						output +=1
				
	print(output)
