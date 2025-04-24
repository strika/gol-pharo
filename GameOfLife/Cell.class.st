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

{ #category : 'accessing' }
Cell >> alive: aBoolean [
	alive := aBoolean
]

{ #category : 'algorithm' }
Cell >> calculateNextState [
	aliveNext := #(2 3) includes: (neighbourhood aliveCells).
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
