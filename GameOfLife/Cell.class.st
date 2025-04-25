Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'alive',
		'aliveNext',
		'neighbourhood'
	],
	#category : 'GameOfLife',
	#package : 'GameOfLife'
}

{ #category : 'as yet unclassified' }
Cell class >> withNeighbourhood: neighbourhood [
	"Builds a cell with given neighbourhood."

	^ self new
		  neighbourhood: neighbourhood;
		  yourself
]

{ #category : 'accessing' }
Cell >> alive: aBoolean [
	alive := aBoolean
]

{ #category : 'algorithm' }
Cell >> calculateNextState [
	aliveNext := self isAlive 
		ifTrue: [#(2 3) includes: (neighbourhood aliveCells)]
		ifFalse: [neighbourhood aliveCells == 3].
]

{ #category : 'initialization' }
Cell >> initialize [ 
	alive := false.
]

{ #category : 'testing' }
Cell >> isAlive [
	^ alive
]

{ #category : 'testing' }
Cell >> isDead [
	^ (alive not)
]

{ #category : 'algorithm' }
Cell >> moveToNextState [
	alive := aliveNext
]

{ #category : 'accessing' }
Cell >> neighbourhood: aNeighbourhood [
  neighbourhood := aNeighbourhood 
]
