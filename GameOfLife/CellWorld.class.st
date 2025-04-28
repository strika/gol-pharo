"
Implements a grid of cells.
"
Class {
	#name : 'CellWorld',
	#superclass : 'Object',
	#instVars : [
		'cells',
		'rows',
		'columns'
	],
	#category : 'GameOfLife',
	#package : 'GameOfLife'
}

{ #category : 'building' }
CellWorld >> build [
	"Instantiates cells as matrix with configured number of rows and columns."
	
	cells := Array2D 
		rows: rows 
		columns: columns
		tabulate: [ :i :j | Cell withNeighbourhood: (Neighbourhood new cellWorld: self; row: i; column: j; yourself) ]
]

{ #category : 'accessing' }
CellWorld >> columns: anInteger [
	columns := anInteger.
]

{ #category : 'accessing' }
CellWorld >> nextState [
	cells do: [ :cell | cell calculateNextState; moveToNextState ]
]

{ #category : 'accessing' }
CellWorld >> rows: anInteger [
	rows := anInteger.
]

{ #category : 'instance creation' }
CellWorld >> x: column y: row [
	"Returns the cell at given row and column."
	^ cells at: row at: column
]
