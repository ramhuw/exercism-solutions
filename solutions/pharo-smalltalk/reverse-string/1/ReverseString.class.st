Class {
	#name : 'ReverseString',
	#superclass : 'Object',
	#category : 'Exercise@ReverseString',
	#package : 'Exercise@ReverseString'
}

{ #category : 'as yet unclassified' }
ReverseString >> reverseValue: v [
	v isEmpty ifTrue: [ ^'' ] ifFalse: [ ^ (self reverseValue: v allButFirst) , v first asString ]
]
