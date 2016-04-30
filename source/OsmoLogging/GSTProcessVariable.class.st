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
	^self value ifNil: [ | dict |
		"Do not assume that self value: dict. self value. will return the value we had.
		Either because of a bug in process scheduling... but let us just be safe."
		dict := Dictionary new.
		self value: dict.
		dict]

]

{ #category : #key }
GSTProcessVariable >> key: aKey [
	| dict |
	dict := self dict.
	^dict at: aKey ifAbsentPut: [GSTProcessVariableHolder new]

]
