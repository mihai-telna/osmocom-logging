"
I handle the actual log invocation
"
Class {
	#name : #LogManager,
	#superclass : #Object,
	#instVars : [
		'target',
		'filter',
		'areas'
	],
	#classVars : [
		'Log'
	],
	#category : #'OsmoLogging-Core'
}

{ #category : #instance }
LogManager class >> default [
	Log ifNil: 
		[Log := LogManager new.
		Log target: LogTranscriptTarget new].
	^Log

]

{ #category : #accessing }
LogManager >> areas [
	areas ifNil: [areas := Dictionary new].
	^areas

]

{ #category : #'as yet unclassified' }
LogManager >> context: aString value: aValue [
	| key |
	key := Array with: 'LogArea' with: aString.
	(GSTProcessVariable key: key) value: aValue

]

{ #category : #'as yet unclassified' }
LogManager >> contextValue: aString [
	| key |
	key := Array with: 'LogArea' with: aString.
	^(GSTProcessVariable key: key) value

]

{ #category : #log }
LogManager >> exception: anEntry [
	self handle: anEntry ifTrue: [target exception: anEntry]

]

{ #category : #private }
LogManager >> findArea: anArea [
	"Find anArea, or ask for a default"
	^self areas at: anArea
	    ifAbsent: 
		[| area |
		area := LogArea defaultForArea: anArea.
		area ifNotNil: [self areas at: anArea put: area].
		area]

]

{ #category : #private }
LogManager >> handle: anEntry ifTrue: aBlock [
	| area |
	area := self findArea: anEntry area.
	(area enabled and: [anEntry level >= area minLevel]) ifTrue: aBlock

]

{ #category : #log }
LogManager >> log: anEntry [
	self handle: anEntry ifTrue: [target print: anEntry]

]

{ #category : #private }
LogManager >> target: aTarget [
	target := aTarget

]
