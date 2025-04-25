Class {
	#name : 'CellWorldTest',
	#superclass : 'TestCase',
	#instVars : [
		'world'
	],
	#category : 'GameOfLife-Tests',
	#package : 'GameOfLife-Tests'
}

{ #category : 'running' }
CellWorldTest >> setUp [ 
	super setUp.
	world := CellWorld new rows: 10; columns: 10; build.
]

{ #category : 'tests' }
CellWorldTest >> testAccessingCell [
	| cell |
	cell := world x: 1 y: 2.
	self assert: cell isDead.
]
