Class {
	#name : #GSTProcessVariable,
	#superclass : #ProcessLocalVariable,
	#category : #'OsmoLogging-Pharo'
}

{ #category : #creation }
GSTProcessVariable class >> key: aKey [
	^self soleInstance key: aKey

]

{ #category : #creation }
GSTProcessVariable >> dict [
	^self value ifNil: [self value: Dictionary new. self value]

]

{ #category : #key }
GSTProcessVariable >> key: aKey [
	| dict |
	dict := self dict.
	^dict at: aKey ifAbsentPut: [GSTProcessVariableHolder new]

]
