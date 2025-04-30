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

{ #category : 'tests' }
CellWorldTest >> testAccessingCellOutOfBounds [
	self assert: (world x: 0 y: 1) isDead.
	self assert: (world x: 11 y: 1) isDead.
	self assert: (world x: 1 y: 0) isDead.
	self assert: (world x: 1 y: 11) isDead.
]

{ #category : 'tests' }
CellWorldTest >> testNextState [
	(world x: 1 y: 1) alive: true.
	(world x: 2 y: 1) alive: true.
	(world x: 1 y: 2) alive: true.

	world nextState.
	
	self assert: (world x: 1 y: 1) isAlive.
	self assert: (world x: 2 y: 1) isAlive.
	self assert: (world x: 1 y: 2) isAlive.
	self assert: (world x: 2 y: 2) isAlive.
	self assert: (world x: 3 y: 1) isDead.
	self assert: (world x: 1 y: 3) isDead.
]
