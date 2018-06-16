extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var QUESTIONS = [
	{
		"Difficulty":0,
		"Type":"Arithmetic",
		"Text":"What is 2+2?",
		"Choices":[
			{
				"Answer":true,
				"Text":"4"
			},
			{
				"Answer":false,
				"Text":"5"
			}
		]
	},
	{
		"Difficulty":0,
		"Type":"Algebra",
		"Text":"What is a+3=5?",
		"Choices":[
			{
				"Answer":true,
				"Text":"2"
			},
			{
				"Answer":false,
				"Text":"8"
			}
		]
	},
]

var hud
var question

class Question:
	var questionBox
	var questionText
	var questionButtons
	var questions
	var hud
	var active
	func _init(questionList, hud):
		self.questions = questionList
		self.questionBox = ColorRect.new()
		self.questionText = Label.new()
		self.questionButtons = []
		questionBox.set_position(Vector2(10, 10))
		questionBox.set_size(Vector2(100, 100))
		self.hud = hud
	func get_random_question():
		randomize()
		return self.questions[randi()%len(self.questions)]
	func show_random_question():
		if not active:
			active = true
			get_node("Player").shouldMove = false
			print("Activated")
			self.hud.call_deferred("add_child", self.questionBox)
			
		

func _ready():
	hud = get_node("../HUD")
	question = Question.new(QUESTIONS, hud)

func _physics_process(delta):
	var children = get_children()
	for child in children:
		var chilc = child.get_overlapping_bodies()
		for chilcc in chilc:
			if chilcc.name == "Player":
				question.show_random_question()