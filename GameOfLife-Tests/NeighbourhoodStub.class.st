"
Objects of this class are used instead of a real neighbourhood objects in tests.
"
Class {
	#name : 'NeighbourhoodStub',
	#superclass : 'Object',
	#instVars : [
		'aliveCells'
	],
	#category : 'GameOfLife-Tests',
	#package : 'GameOfLife-Tests'
}

{ #category : 'accessing' }
NeighbourhoodStub >> aliveCells [
	^ aliveCells
]

{ #category : 'accessing' }
NeighbourhoodStub >> aliveCells: aNumber [
	aliveCells := aNumber
]
