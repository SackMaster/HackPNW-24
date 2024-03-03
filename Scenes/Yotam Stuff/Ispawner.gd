extends Node2D

var lives
var points

var scene = preload("res://Scenes/Qustion block/Questioning.tscn")

var queList = []
var curAns
# Called when the node enters the scene tree for the first time.
func _play():
	
	lives = 3
	points = 0
	
	get_node("LivesDisplay").visible = true
	get_node("PointsDisplay").visible = true
	
	get_node("LivesDisplay/LifeLabel").text = "Lives: 3"
	get_node("PointsDisplay/PointLabel").text = "Score: 0"
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
	curAns = [Answer.new("42", true), Answer.new("28", false), Answer.new("36", false), Answer.new("38", false)]
	queList.push_back(Question.new("What is 14 * 3?", curAns))
	#8
	curAns = [Answer.new("nonagon", true), Answer.new("pentagon", false), Answer.new("octagon", false), Answer.new("decagon", false)]
	queList.push_back(Question.new("A shape with 9 sides is called?", curAns))
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
	if (not queList.is_empty() && lives > 0):
		var curQue = queList.pick_random()
		
		get_node("IHeaderSB2D/IPanel/ICenterContainer/ILabel").text = curQue.problem
		
		if lives > 0:
			get_node("IHeaderSB2D")._moveDown()
			
		await get_tree().create_timer(2).timeout
		
		queList.erase(curQue)
		curQue.answers.shuffle()
		
		print(curQue.problem)
		
		for ans in curQue.answers:
			
			if lives <= 0:
				lives = 0
				break
			
			var xCoor = randi() % 1200 + 325
			var instance = scene.instantiate()
		#	"signal_name", <target_node>, "target_method_name"
			instance.get_node("RigidBody2D").lChange.connect(_recieve_signalL)
			instance.get_node("RigidBody2D").pChange.connect(_recieve_signalP)
			
			instance.get_node("RigidBody2D/White/Label").text = ans.text
			instance.get_node("RigidBody2D").isCorrect = ans.isRight
			instance.transform.origin = Vector2(xCoor, 1200)
			add_child(instance)
			print(ans.text)
			await get_tree().create_timer(1).timeout

		await get_tree().create_timer(1).timeout
		get_node("IHeaderSB2D")._moveUp()
		await get_tree().create_timer(1).timeout
		_instances()
	if lives == 0:
		get_node("LivesDisplay").visible = false
		get_node("PointsDisplay").visible = false
		get_node("EndScreen/EndCard").text = "Game Over"
		get_node("EndScreen").visible = true
	if queList.is_empty():
		get_node("LivesDisplay").visible = false
		get_node("PointsDisplay").visible = false
		get_node("EndScreen/EndCard").text = "Final Score: " + str(points)
		get_node("EndScreen").visible = true
	

func _recieve_signalL():
	lives -= 1
	if lives <= 0:
		lives = 0
	get_node("LivesDisplay/LifeLabel").text = "Lives: " + str(lives)
func _recieve_signalP():
	points += 1
	get_node("PointsDisplay/PointLabel").text = "Score: " + str(points)
