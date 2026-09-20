Class {
	#name : 'Leap',
	#superclass : 'Object',
	#category : 'Exercise@Leap',
	#package : 'Exercise@Leap'
}

{ #category : 'as yet unclassified' }
Leap >> leapYear: aYear [
    ^ (aYear isDivisibleBy: 4) and: [ 
        (aYear isDivisibleBy: 100) not or: [ aYear isDivisibleBy: 400 ] ]
]
