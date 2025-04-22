Class {
	#name : 'CellTest',
	#superclass : 'TestCase',
	#category : 'GameOfLife-Tests',
	#package : 'GameOfLife-Tests'
}

{ #category : 'tests' }
CellTest >> testNewCellIsDead [
	| cell |
	cell := Cell new.
	self assert: (cell isDead)
]
