"
Calculates and returns the state of neighbourhood around a cell.
"
Class {
	#name : 'Neighbourhood',
	#superclass : 'Object',
	#instVars : [
		'row',
		'column',
		'cellWorld'
	],
	#category : 'GameOfLife',
	#package : 'GameOfLife'
}

{ #category : 'accessing' }
Neighbourhood >> aliveCells [
	| count |
	
	count := 0.
	
	(Interval from: (row - 1) to: (row + 1)) do: [ :r |
		(Interval from: (column - 1) to: (column + 1)) do: [ :c |
			(((r ~= row) or: [ c ~= column ]) and: [ (cellWorld x: c y: r) isAlive ])
			 ifTrue: [ count := count + 1 ] ] ].
	
	^ count
]

{ #category : 'accessing' }
Neighbourhood >> cellWorld: aCellWorld [
	cellWorld := aCellWorld
]

{ #category : 'accessing' }
Neighbourhood >> column: aNumber [
	column := aNumber
]

{ #category : 'accessing' }
Neighbourhood >> row: aNumber [
	row := aNumber
]
