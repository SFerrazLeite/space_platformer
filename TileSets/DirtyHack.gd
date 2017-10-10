extends CollisionPolygon2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var polygon = get_polygon()
	for point in polygon:
		point.translate(-128,-128)
		
	# Called every time the node is added to the scene.
	# Initialization here
	pass
