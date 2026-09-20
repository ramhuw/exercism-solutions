Class {
	#name : 'CollatzConjecture',
	#superclass : 'Object',
	#category : 'Exercise@CollatzConjecture',
	#package : 'Exercise@CollatzConjecture'
}

{ #category : 'as yet unclassified' }
CollatzConjecture >> stepsFrom: n [
	n <= 0 
	ifTrue: [ ^self error: 'Only positive numbers are allowed' ] 
	ifFalse: [ 
		n = 1 
		ifTrue: [ ^0 ] 
		ifFalse: [ 
			n \\ 2 = 0
			ifTrue: [ ^(self stepsFrom: n / 2) + 1 ]
			ifFalse: [ ^(self stepsFrom: n * 3 + 1) + 1 ]
		 ]
	]
]
