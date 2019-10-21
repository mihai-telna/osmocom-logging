"
I log to a stdio stream.
"
Class {
	#name : #LogTargetStdio,
	#superclass : #LogTarget,
	#instVars : [
		'prefix',
		'stream'
	],
	#classVars : [
		'LogMap'
	],
	#classInstVars : [
		'Identity',
		'LogMap'
	],
	#category : #'OsmoLogging-Pharo'
}

{ #category : #accessing }
LogTargetStdio class >> stderr [
	^self new stream: Stdio stderr; yourself
]

{ #category : #accessing }
LogTargetStdio class >> stdout [
	^self new stream: Stdio stdout; yourself
]

{ #category : #'as yet unclassified' }
LogTargetStdio >> exception: aMessage [
	| ctx |
	ctx := aMessage context stack collect: [:each | each asString].
	ctx := Character lf join: ctx.
	self print: 'EXCEPTION occured: ', ctx.
	self print: aMessage

]

{ #category : #'as yet unclassified' }
LogTargetStdio >> prefix [
	^prefix ifNil: ['']

]

{ #category : #'as yet unclassified' }
LogTargetStdio >> prefix: aMsg [
	prefix := aMsg

]

{ #category : #output }
LogTargetStdio >> print: aMessage [
	stream
		nextPutAll: self prefix;
		nextPutAll: aMessage;
		lf.
]

{ #category : #accessing }
LogTargetStdio >> stream: aStream [
	stream := aStream
]
