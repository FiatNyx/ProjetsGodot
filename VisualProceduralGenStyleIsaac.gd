extends Node2D

var numberOfX = 10
var numberOfY = 10
onready var proceduralPlaceholder = preload("res://ProceduralGenPlaceholder.tscn")
var numberOfPoints = 0
var distanceBetweenPoints = 1129
var listePieces = []
onready var camera = get_node("Camera2D") 
onready var player = get_node("Player")
var timer = 0
var finished = false
var nbrOf2 = 0
var finishedTrue = false
var xCamera = 0.9

var smoothZoom = 1
var targetZoom = 12
var playZoom = 1.5
const ZOOM_SPEED = 1.05

export(int) var maxAmount = 9
export(int) var minAmount = 0
export(int) var middle = 5

func _process(delta):
	camera.position = player.position
	timer += delta
	if finishedTrue == false:
		smoothZoom = lerp(smoothZoom, targetZoom, ZOOM_SPEED * delta)
		if smoothZoom != targetZoom:
			camera.zoom = Vector2(smoothZoom, smoothZoom)
	if finishedTrue == true:
		smoothZoom = lerp(smoothZoom, playZoom, ZOOM_SPEED * delta)
		if smoothZoom != targetZoom:
			camera.zoom = Vector2(smoothZoom, smoothZoom)
			
	if timer >= 0.45:
		if finishedTrue == false:
			var markedOnes = []
			for node in get_node("PositionPlaceholder").get_children():
				if node.state == 2:
					var listeNodes = listeNodesProcedural.listeDirections
					var listeNodesToInstance = listeNodesProcedural.liste
					var doneOnes = []
					var ok = false
					while ok == false:
						randomize()
						if len(doneOnes) >= len(listeNodesToInstance):
							ok = true
							node.state = 1
							nbrOf2 -= 1
						else:
							
							var randomChosen = false
							var nbRandom
							while randomChosen == false:
								nbRandom = randi() % len(listeNodesToInstance)
								if !(nbRandom in doneOnes):
									randomChosen = true
								
									
							var upOk = false
							var downOk = false
							var rightOk = false
							var leftOk = false
							
							if listeNodes[nbRandom * 4] == node.up || node.up == "XXX":
								upOk = true
							if listeNodes[nbRandom * 4 + 1] == node.left || node.left == "XXX":
								leftOk = true
							if listeNodes[nbRandom * 4 + 2] == node.down || node.down == "XXX":
								downOk = true
							if listeNodes[nbRandom * 4 + 3] == node.right || node.right == "XXX":
								rightOk = true
								
							if rightOk && upOk && leftOk && downOk:
								var instancedNode = listeNodesToInstance[nbRandom].instance()
								instancedNode.position = node.position
								get_node("Positions").add_child(instancedNode)
								#instancedNode.get_node("Label").text = listeNodes[nbRandom * 4] + "-" + listeNodes[nbRandom * 4 + 1] + "-" + listeNodes[nbRandom * 4 + 2] + "-" + listeNodes[nbRandom * 4 + 3]
								node.state = 1
								nbrOf2 -= 1
								var xPosition = sliceString(node.name,1,1)
								var yPosition = sliceString(node.name,3,1)
								if int(xPosition) < maxAmount:
									if get_node("PositionPlaceholder/X" + str(int(xPosition) + 1)+ "Y" + yPosition).state == 0:
										if listeNodes[nbRandom * 4 + 3] == "NNN":
											nbrOf2 += 0
											get_node("PositionPlaceholder/X" + str(int(xPosition) + 1)+ "Y" + yPosition).state = 0
											
										else:
											if !(get_node("PositionPlaceholder/X" + str(int(xPosition) + 1)+ "Y" + yPosition) in markedOnes):
												markedOnes.append(get_node("PositionPlaceholder/X" + str(int(xPosition) + 1)+ "Y" + yPosition))
												nbrOf2 += 1
												finished = false
										get_node("PositionPlaceholder/X" + str(int(xPosition) + 1)+ "Y" + yPosition).left = listeNodes[nbRandom * 4 + 3]
								if int(xPosition) > minAmount :
									if get_node("PositionPlaceholder/X" + str(int(xPosition) - 1)+ "Y" + yPosition).state == 0:
										if listeNodes[nbRandom * 4 + 1] == "NNN":
											nbrOf2 += 0
											get_node("PositionPlaceholder/X" + str(int(xPosition) - 1)+ "Y" + yPosition).state = 0
										else:
											if !(get_node("PositionPlaceholder/X" + str(int(xPosition) - 1)+ "Y" + yPosition) in markedOnes):
												markedOnes.append(get_node("PositionPlaceholder/X" + str(int(xPosition) - 1)+ "Y" + yPosition))
												nbrOf2 += 1
												finished = false
										get_node("PositionPlaceholder/X" + str(int(xPosition) - 1)+ "Y" + yPosition).right = listeNodes[nbRandom * 4 + 1]
										
								if int(yPosition) < maxAmount:
									if get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) + 1)).state == 0:
										if listeNodes[nbRandom * 4 + 2] == "NNN":
											get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) + 1)).state = 0
											nbrOf2 += 0
										else:
											if !(get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) + 1)) in markedOnes):
												markedOnes.append(get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) + 1)))
												nbrOf2 += 1
												finished = false
										get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) + 1)).up = listeNodes[nbRandom * 4 + 2]
								if int(yPosition) > minAmount :
									if get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) - 1)).state == 0:
										if listeNodes[nbRandom * 4 ] == "NNN":
											get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) - 1)).state = 0
											nbrOf2 += 0
										else:
											if !(get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) - 1)) in markedOnes):
												markedOnes.append(get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) - 1)))
												nbrOf2 += 1
												finished = false
										get_node("PositionPlaceholder/X" + xPosition + "Y" + str(int(yPosition) - 1)).down = listeNodes[nbRandom * 4 ]
								ok = true
							else:
								doneOnes.append(nbRandom)
								#listeNodes.remove(nbRandom * 4)
								#listeNodes.remove(nbRandom * 4)
								#listeNodes.remove(nbRandom * 4)
								#listeNodes.remove(nbRandom * 4)
								#listeNodesToInstance.remove(nbRandom)
			if len(markedOnes) > 0:
				for node in markedOnes:
					node.state = 2
					#node.get_node("Label").text = node.up + node.left + node.down + node.right
					
			if nbrOf2 <= 0:
				if finished == true:
					finishedTrue = true
				finished = true
			
			timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var indexX = 0
	var indexY = 0
	while indexX < numberOfX:
		while indexY < numberOfY:
			var x = (indexX - numberOfX/2 ) * distanceBetweenPoints
			var y = (indexY - numberOfY/2 ) * distanceBetweenPoints
			var instancedPlaceholder = proceduralPlaceholder.instance()
			instancedPlaceholder.position = Vector2(x,y)
			
			instancedPlaceholder.name = "X" + str(indexX) + "Y" + str(indexY)
			get_node("PositionPlaceholder").add_child(instancedPlaceholder)
			
			if indexX == 0:
				instancedPlaceholder.left = "NNN"
			elif indexX == 9:
				instancedPlaceholder.right = "NNN"
			if indexY == 0:
				instancedPlaceholder.up = "NNN"
			elif indexY == 9:
				instancedPlaceholder.down = "NNN"
				
			indexY += 1
		indexY = 0
		indexX += 1 
	
	var instanced = listeNodesProcedural.liste[0].instance()
	instanced.position = get_node("PositionPlaceholder/X5Y5").position
	get_node("Positions").add_child(instanced)
	
	get_node("PositionPlaceholder/X5Y5").state = 1
	get_node("PositionPlaceholder/X5Y5").up = "YYY"
	get_node("PositionPlaceholder/X5Y5").down = "YYY"
	get_node("PositionPlaceholder/X5Y5").right = "YYY"
	get_node("PositionPlaceholder/X5Y5").left = "YYY"
	
	
	get_node("PositionPlaceholder/X6Y5").left = "YYY"
	get_node("PositionPlaceholder/X4Y5").right = "YYY"
	get_node("PositionPlaceholder/X5Y6").up = "YYY"
	get_node("PositionPlaceholder/X5Y4").down = "YYY"
	get_node("PositionPlaceholder/X5Y4").state = 2
	get_node("PositionPlaceholder/X5Y6").state = 2
	get_node("PositionPlaceholder/X4Y5").state = 2
	get_node("PositionPlaceholder/X6Y5").state = 2
	finished = false
	nbrOf2 = 4
	
	
	
	
			
			
func sliceString(var stringDepart, var initial, var nbr):
	var stringFinal = ""
	var index = 0
	while index < nbr:
		stringFinal += stringDepart[initial]
		initial += 1
		index += 1
	return stringFinal


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 1

