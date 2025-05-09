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
	cell := world row: 1 column: 2.
	self assert: cell isDead.
]

{ #category : 'tests' }
CellWorldTest >> testAccessingCellOutOfBounds [
	self assert: (world row: 0 column: 1) isDead.
	self assert: (world row: 11 column: 1) isDead.
	self assert: (world row: 1 column: 0) isDead.
	self assert: (world row: 1 column: 11) isDead.
	

]

{ #category : 'tests' }
CellWorldTest >> testNextState [
	(world row: 1 column: 1) alive: true.
	(world row: 2 column: 1) alive: true.
	(world row: 1 column: 2) alive: true.

	world nextState.
	
	self assert: (world row: 1 column: 1) isAlive.
	self assert: (world row: 2 column: 1) isAlive.
	self assert: (world row: 3 column: 1) isDead.
	self assert: (world row: 1 column: 2) isAlive.
	self assert: (world row: 2 column: 2) isAlive.
	self assert: (world row: 3 column: 2) isDead.
	self assert: (world row: 1 column: 3) isDead.
	self assert: (world row: 2 column: 3) isDead.
	self assert: (world row: 3 column: 3) isDead.
]

{ #category : 'tests' }
CellWorldTest >> testNextStateWithBlinker [
	(world row: 2 column: 1) alive: true.
	(world row: 2 column: 2) alive: true.
	(world row: 2 column: 3) alive: true.

	world nextState.
	
	self assert: (world row: 1 column: 1) isDead.
	self assert: (world row: 2 column: 1) isDead.
	self assert: (world row: 3 column: 1) isDead.
	self assert: (world row: 1 column: 2) isAlive.
	self assert: (world row: 2 column: 2) isAlive.
	self assert: (world row: 3 column: 2) isAlive.
	self assert: (world row: 1 column: 3) isDead.
	self assert: (world row: 2 column: 3) isDead.
	self assert: (world row: 3 column: 3) isDead.
]
