extends Node2D

var scene = preload("res://Scenes/Qustion block/Questioning.tscn")

var queList = []
var curAns
# Called when the node enters the scene tree for the first time.
func _ready():
	#1
	curAns = [Answer.new("9.2", true), Answer.new("-1.2", false), Answer.new("8.2", false), Answer.new("9.8", false)]
	queList.push_back(Question.new("What is 4 + 5.2?", curAns))
	#2
	curAns = [Answer.new("their", true), Answer.new("they're", false), Answer.new("there", false)]
	queList.push_back(Question.new("It is ____ car", curAns))
	#3
	curAns = [Answer.new("Olympia", true), Answer.new("Topeka", false), Answer.new("Lincoln", false), Answer.new("Augusta", false)]
	queList.push_back(Question.new("What is the capital of Washington State?", curAns))
	#4
	curAns = [Answer.new("8", true), Answer.new("6", false), Answer.new("16", false), Answer.new("-8", false)]
	queList.push_back(Question.new("How many total legs do 4 chickens have?", curAns))
	#5
	curAns = [Answer.new("Alaska & Hawaii", true), Answer.new("Alaska & Maine", false), Answer.new("Rhode Island & Hawaii", false), Answer.new("Wisconsin & Wyoming", false)]
	queList.push_back(Question.new("What 2 states are outside of the US mainland?", curAns))
	#6
	curAns = [Answer.new("is", true), Answer.new("are", false), Answer.new(", are", false), Answer.new(", is", false)]
	queList.push_back(Question.new("The family ____ small", curAns))
	#7
	curAns = [Answer.new("28", true), Answer.new("42", false), Answer.new("36", false), Answer.new("38", false)]
	queList.push_back(Question.new("What is 14 * 3?", curAns))
	#8
	curAns = [Answer.new("nonagon", true), Answer.new("pentagon", false), Answer.new("octagon", false), Answer.new("decagon", false)]
	queList.push_back(Question.new("A shape with 9 sides is called??", curAns))
	#9
	curAns = [Answer.new("7", true), Answer.new("6", false), Answer.new("5", false), Answer.new("8", false)]
	queList.push_back(Question.new("How many continents are there?", curAns))
	#10
	curAns = [Answer.new("100", true), Answer.new("60", false), Answer.new("10", false), Answer.new("50", false)]
	queList.push_back(Question.new("How many cents are in a dollar?", curAns))
	
	#1s start, 2s move, 1s end
	_instances()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _instances():
	if (not queList.is_empty()):
		var curQue = queList.pick_random()
		
		get_node("IHeaderSB2D/IPanel/ICenterContainer/ILabel").text = curQue.problem
		get_node("IHeaderSB2D")._moveDown()
		await get_tree().create_timer(2).timeout
		
		queList.erase(curQue)
		curQue.answers.shuffle()
		
		print(curQue.problem)
		
		for ans in curQue.answers:
			var xCoor = randi() % 1200 + 325
			var instance = scene.instantiate()
			instance.get_node("RigidBody2D/White/Label").text = ans.text
			instance.transform.origin = Vector2(xCoor, 1200)
			add_child(instance)
			print(ans.text)
			await get_tree().create_timer(1).timeout

		await get_tree().create_timer(1).timeout
		get_node("IHeaderSB2D")._moveUp()
		await get_tree().create_timer(1).timeout
		_instances()
