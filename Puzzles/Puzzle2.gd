extends PuzzleBase

var input := MainScript.read_lines_from_file("res://PuzzleInput/Puzzle2.txt")
var outputA := 0

func _ready() -> void:
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	solve()
	output_a.emit(str(outputA))
	print(outputA)

func solve():
	var id_rangess: = input[0].split(",", false)
	
	for id_range in id_rangess:
		var ranges: = id_range.split("-")
		
		for i in range(ranges.size()):
			if i % 2 == 0: continue
			
			var minimum: int = int(ranges[0])
			var maximum: int = int(ranges[1])
			
			var id_list := range(minimum, maximum+1)
			
			for id in id_list:
				if is_not_valid(str(id)):
					outputA += id
		

func is_not_valid(input: String) -> bool:
	# check for leading zero since id is immediately invalid if it has a leading zero
	if input[0] == "0":
		return true
	
	### check if the length of an id is even or odd. If even for example: 1111 go check if it is repeated
	### if odd for example: 111 then return false immediately
	if input.length() % 2 != 0:
		return false
	
	# check if the half of the id is the same as the other half ex: 12341234 that half is 1234 and thus that repeats
	var left_half: int = int(input.left(input.length()/2))
	var right_half: int = int(input.right(input.length()/2))
	
	if left_half == right_half:
		return true
	
	return false
