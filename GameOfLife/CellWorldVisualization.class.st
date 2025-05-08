Class {
	#name : 'CellWorldVisualization',
	#superclass : 'Object',
	#instVars : [
		'cellWorld',
		'container',
		'cellMorphs',
		'cellSize'
	],
	#category : 'GameOfLife',
	#package : 'GameOfLife'
}

{ #category : 'as yet unclassified' }
CellWorldVisualization >> buildGrid [
	| rows cols |
	rows := cellWorld rows.
	cols := cellWorld columns.
	cellMorphs := Array2D rows: rows columns: cols.
	
	1 to: rows do: [ :i |
		1 to: cols do: [ :j |
			| morph x y |
			morph := Morph new
				extent: cellSize@cellSize;
				borderWidth: 1;
				borderColor: Color gray;
				yourself.
			x := (j - 1) * cellSize.
			y := (i - 1) * cellSize.
			morph position: x@y.
			container addMorph: morph.
			cellMorphs at: i at: j put: morph.
		]
	]
]

{ #category : 'initialize-release' }
CellWorldVisualization >> close [
	container delete.
]

{ #category : 'initialization' }
CellWorldVisualization >> initializeWith: aCellWorld [
	cellWorld := aCellWorld.
	cellSize := 10.
	self setupContainer.
	self buildGrid.
	self syncFromModel.
]

{ #category : 'accessing' }
CellWorldVisualization >> nextState [ 
	cellWorld nextState.
	self syncFromModel.
]

{ #category : 'opening' }
CellWorldVisualization >> openInWorld [ 
	container openInWorld.
]

{ #category : 'as yet unclassified' }
CellWorldVisualization >> runSimulation [
	self openInWorld.
	
	[ 
		[ 
			self nextState.  
			(Delay forMilliseconds: 200) wait
		] repeat
	] fork.
]

{ #category : 'as yet unclassified' }
CellWorldVisualization >> setupContainer [
	container := Morph new
		extent: ((cellWorld columns * cellSize) @ (cellWorld rows * cellSize));
		color: Color veryLightGray;
		yourself.
]

{ #category : 'as yet unclassified' }
CellWorldVisualization >> syncFromModel [
	1 to: cellWorld rows do: [ :i |
		1 to: cellWorld columns do: [ :j |
			| morph cell |
			morph := cellMorphs at: i at: j.
			cell := cellWorld x: i y: j.
			morph color: (cell isAlive ifTrue: [Color black] ifFalse: [Color white]).
		]
	]
]
