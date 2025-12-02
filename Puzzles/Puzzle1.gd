extends PuzzleBase

var input = MainScript.read_lines_from_file("res://PuzzleInput/Puzzle1.txt")
var outputA: int = 0
var outputB: int = 0

func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed():
	_solve()
	output_a.emit(str(outputA))
	output_b.emit(str(outputB))
	
func _solve():
	outputA = 0
	outputB = 0
	
	var dial: int = 50
	
	for line in input:
		var regex = RegEx.new()
		regex.compile("^([A-Za-z]+)(\\d+)$")  # pattern: letters then digits
		
		var rx_match = regex.search(line)
		
		if rx_match:
			var letter = rx_match.get_string(1)  # first group, letters part
			var number_str = rx_match.get_string(2)  # second group, digit part
			var number = int(number_str)  # convert to int
			
			if letter == "R":
				for i in number:
					dial += 1
					if dial > 99:
						dial = 0
					if dial == 0:
						outputB +=1
					
				if dial == 0:
					outputA += 1
			else:
				for i in number:
					dial -= 1
					if dial < 0:
						dial = 99
					if dial == 0:
						outputB +=1
						
				if dial == 0:
					outputA += 1
