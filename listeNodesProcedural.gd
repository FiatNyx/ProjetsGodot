extends Node


#[up,left,down,right]

onready var liste = [preload("res://MapsProcedural/3_AllDirections.tscn"), preload("res://MapsProcedural/3_LigneDroite.tscn"), 
preload("res://MapsProcedural/3_LigneHaut.tscn"), preload("res://MapsProcedural/3_StopGauche.tscn"),
preload("res://MapsProcedural/3_StopDroite.tscn"), preload("res://MapsProcedural/3_StopBas.tscn"), 
preload("res://MapsProcedural/3_StopHaut.tscn"),preload("res://MapsProcedural/2_AllDirections.tscn"),
preload("res://MapsProcedural/2_LigneDroite.tscn"), preload("res://MapsProcedural/3-2_LigneGauche.tscn"),
preload("res://MapsProcedural/3-2_LigneHaut.tscn"), preload("res://MapsProcedural/3-2_LigneDroite.tscn"),
preload("res://MapsProcedural/3-2_LigneBas.tscn"),preload("res://MapsProcedural/2_StopBas.tscn"),
preload("res://MapsProcedural/2_StopDroite.tscn"),preload("res://MapsProcedural/2_StopGauche.tscn"),
preload("res://MapsProcedural/2_StopHaut.tscn"),preload("res://MapsProcedural/2_LBasDroite.tscn"),
preload("res://MapsProcedural/2_LDroiteHaut.tscn"),preload("res://MapsProcedural/2_LGaucheBas.tscn"),
preload("res://MapsProcedural/2_LHautGauche.tscn"),preload("res://MapsProcedural/2_TSansBas.tscn"),
preload("res://MapsProcedural/2_TSansDroite.tscn"), preload("res://MapsProcedural/2_TSansGauche.tscn"),
preload("res://MapsProcedural/2_TSansHaut.tscn"),preload("res://MapsProcedural/2-3_LBasDroite.tscn"),
preload("res://MapsProcedural/2-3_LBasGauche.tscn"),preload("res://MapsProcedural/2-3_LDroiteBas.tscn"),
preload("res://MapsProcedural/2-3_LDroiteHaut.tscn"),preload("res://MapsProcedural/2-3_LGaucheBas.tscn"),
preload("res://MapsProcedural/2-3_LGaucheHaut.tscn"),preload("res://MapsProcedural/2-3_LHautDroite.tscn"),
preload("res://MapsProcedural/2-3_LHautGauche.tscn"), preload("res://MapsProcedural/2_LigneHaut.tscn"),
preload("res://MapsProcedural/3_LBasDroite.tscn"),preload("res://MapsProcedural/3_LDroiteHaut.tscn"),
preload("res://MapsProcedural/3_LGaucheBas.tscn"),preload("res://MapsProcedural/3_LHautGauche.tscn")]

var listeDirections = ["YYY","YYY","YYY","YYY","NNN","YYY","NNN","YYY","YYY","NNN","YYY","NNN", 
#						|#Exemple			  | #Ligne Droite		   |#Ligne Haut		      |
"NNN", "YYY", "NNN", "NNN", "NNN","NNN","NNN","YYY","NNN","NNN","YYY", "NNN", "YYY", "NNN","NNN","NNN",
#|Stop gauche			  |#Stop droit			   |#Stop Bas				 |#Stop Haut			  |
"YNY","YNY","YNY","YNY","NNN", "YNY", "NNN", "YNY","NNN","YNY","NNN","YYY","YNY","NNN","YYY","NNN",
#|AllDirection2Ways		|#2_LigneDroite			  |#3-2_LigneGauche		   |#3-2_LigneHaut
"NNN","YYY","NNN","YNY","YYY","NNN","YNY","NNN","NNN","NNN","YNY","NNN","NNN","NNN","NNN","YNY",
#3-2_LigneDroite		|#3-2_LigneBas		   |#2_StopBas				|#2_StopDroite
"NNN","YNY","NNN","NNN","YNY","NNN","NNN","NNN","NNN","NNN","YNY","YNY", "YNY","NNN","NNN","YNY",
#2_StopGauche		   |#2_StopHaut				|#2_LBasDroite			|#2_LDroiteHaut
"NNN","YNY","YNY","NNN","YNY","YNY","NNN","NNN","YNY","YNY","NNN","YNY", "YNY","YNY","YNY","NNN",
#2_LGaucheBas		   |#2_LHautGauche			|#2_TSansBas			|2_TSansDroite
"YNY","NNN","YNY","YNY", "NNN","YNY","YNY","YNY","NNN","NNN","YNY","YYY", "NNN", "YYY","YNY","NNN",
#2_TSansGauche			|#2_TSansHaut			|#2-3_LBasDroite		|#2-3_LBasGauche
#[up,left,down,right]
"NNN","NNN","YYY","YNY","YYY","NNN","NNN","YNY","NNN","YNY","YYY","NNN","YYY","YNY","NNN","NNN",
#2-3_LDroiteBas			|#2-3_LDroiteHaut		|#2-3_LGaucheBas		|#2-3_LGaucheHaut
"YNY","NNN","NNN","YYY","YNY","YYY","NNN","NNN","YNY","NNN","YNY","NNN", "NNN","NNN","YYY","YYY",
#2-3_LHautDroite		|#2-3_LHautGauche		|#2_LigneHaut (Enfin)	|3_LBasDroite
"YYY","NNN","NNN","YYY","NNN","YYY","YYY","NNN","YYY","YYY","NNN","NNN"]
#3_LDroiteHaut			|#3_LGaucheBas			|#3_LHautGauche
func _ready():
	pass


