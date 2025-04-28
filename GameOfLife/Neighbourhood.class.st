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
