Class {
	#name : 'CellTest',
	#superclass : 'TestCase',
	#category : 'GameOfLife-Tests',
	#package : 'GameOfLife-Tests'
}

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
	| cell |
	cell := Cell new.
	self assert: (cell isDead)
]
