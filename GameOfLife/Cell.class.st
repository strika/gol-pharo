Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'alive'
	],
	#category : 'GameOfLife',
	#package : 'GameOfLife'
}

{ #category : 'initialization' }
Cell >> initialize [ 
	alive := false.
]

{ #category : 'testing' }
Cell >> isDead [
	^ (alive not)
]
