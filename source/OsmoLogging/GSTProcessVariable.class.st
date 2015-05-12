Class {
	#name : #GSTProcessVariable,
	#superclass : #ProcessLocalVariable,
	#instVars : [
		'dict'
	],
	#category : #'OsmoLogging-Pharo'
}

{ #category : #creation }
GSTProcessVariable class >> key: aKey [
	^self soleInstance key: aKey

]

{ #category : #creation }
GSTProcessVariable >> dict [
	^dict ifNil: [dict := Dictionary new]

]

{ #category : #key }
GSTProcessVariable >> key: aKey [
	^self dict at: aKey
	    ifAbsent: [self dict at: aKey put: GSTProcessVariableHolder new]

]
