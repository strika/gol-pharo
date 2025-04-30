Class {
	#name : 'NeighbourhoodTest',
	#superclass : 'TestCase',
	#instVars : [
		'world'
	],
	#category : 'GameOfLife-Tests',
	#package : 'GameOfLife-Tests'
}

{ #category : 'running' }
NeighbourhoodTest >> setUp [
	super setUp.
	world := CellWorld new rows: 3; columns: 3; build.
	
	(Interval from: 1 to: 3) do: [ :r |
		(Interval from: 1 to: 3) do: [ :c | (world x: c y: r) alive: true ] ].
]

{ #category : 'tests' }
NeighbourhoodTest >> testAliveCellsInBottomLeftCorner [
	| neighbourhood |
	
	neighbourhood := Neighbourhood new cellWorld: world; row: 3; column: 1.
	self assert: neighbourhood aliveCells equals: 3
]

{ #category : 'tests' }
NeighbourhoodTest >> testAliveCellsInBottomRightCorner [
	| neighbourhood |
	
	neighbourhood := Neighbourhood new cellWorld: world; row: 1; column: 3.
	self assert: neighbourhood aliveCells equals: 3
]

{ #category : 'tests' }
NeighbourhoodTest >> testAliveCellsInMiddle [ 
	| neighbourhood |
	
	neighbourhood := Neighbourhood new cellWorld: world; row: 2; column: 2.
	self assert: neighbourhood aliveCells equals: 8
]

{ #category : 'tests' }
NeighbourhoodTest >> testAliveCellsInTopLeftCorner [
	| neighbourhood |
	
	neighbourhood := Neighbourhood new cellWorld: world; row: 1; column: 1.
	self assert: neighbourhood aliveCells equals: 3
]

{ #category : 'tests' }
NeighbourhoodTest >> testAliveCellsInTopRightCorner [
	| neighbourhood |
	
	neighbourhood := Neighbourhood new cellWorld: world; row: 3; column: 1.
	self assert: neighbourhood aliveCells equals: 3
]
