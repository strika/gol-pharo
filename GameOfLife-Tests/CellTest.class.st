Class {
	#name : 'CellTest',
	#superclass : 'TestCase',
	#instVars : [
		'cell',
		'neighbourhood'
	],
	#category : 'GameOfLife-Tests',
	#package : 'GameOfLife-Tests'
}

{ #category : 'running' }
CellTest >> setUp [ 
	neighbourhood := NeighbourhoodStub new.
	cell := Cell new neighbourhood: neighbourhood.
  
]

{ #category : 'tests' }
CellTest >> testAliveCellDiesOfOverpopulation [
	neighbourhood aliveCells: 4.
	cell alive: true.
	cell calculateNextState.
	cell moveToNextState.
	self assert: cell isDead
]

{ #category : 'as yet unclassified' }
CellTest >> testAliveCellDiesOfUnderpopulation [
	neighbourhood aliveCells: 1.
	cell alive: true.
	cell calculateNextState.
	cell moveToNextState.
	self assert: cell isDead
]

{ #category : 'tests' }
CellTest >> testAliveCellWith2NeighboursStaysAlive [
   cell alive: true.
	neighbourhood aliveCells: 2.
	cell calculateNextState.
	cell moveToNextState.
	self assert: cell isAlive
]

{ #category : 'tests' }
CellTest >> testAliveCellWith3NeighboursStaysAlive [
   cell alive: true.
	neighbourhood aliveCells: 3.
	cell calculateNextState.
	cell moveToNextState.
	self assert: cell isAlive
]

{ #category : 'tests' }
CellTest >> testDeadCellComesAlive [
	neighbourhood aliveCells: 3.
	cell calculateNextState.
	cell moveToNextState.
	self assert: cell isAlive
]

{ #category : 'tests' }
CellTest >> testDeadCellStaysDead [
	| cell neighbourhood |
	neighbourhood := NeighbourhoodStub new aliveCells: 2.
	cell := Cell new neighbourhood: neighbourhood.
	cell calculateNextState.
	cell moveToNextState.
	self assert: cell isDead
]

{ #category : 'tests' }
CellTest >> testNewCellIsDead [
	self assert: (cell isDead)
]
