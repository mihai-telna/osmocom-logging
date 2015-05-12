Class {
	#name : #LogStructuredLogger,
	#superclass : #Object,
	#instVars : [
		'source',
		'area'
	],
	#category : #'OsmoLogging-Core'
}

{ #category : #'as yet unclassified' }
LogStructuredLogger class >> for: anObject area: anArea [
	^self new
		source: anObject;
		area: anArea
]

{ #category : #creation }
LogStructuredLogger >> area: anArea [
	area := anArea
]

{ #category : #'as yet unclassified' }
LogStructuredLogger >> format: anObject [
	^anObject formatForLogging

]

{ #category : #format }
LogStructuredLogger >> formatMessage: aMessage context: aContext [
	^String streamContents: [:stream |
		stream
			nextPutAll: (self format: source);
			nextPutAll: ' ';
			nextPutAll: aMessage.
		aContext ifNotNil: [
			stream 
				nextPutAll: ' ';
				nextPutAll: (' ' join: (aContext collect: [:each | self format: each]))].
	]
]

{ #category : #'as yet unclassified' }
LogStructuredLogger >> log: aMessage with: aContext level: aLevel [
	^self logManager
			log: (LogEntry
					withMsg: (self formatMessage: aMessage context: aContext)
					level: aLevel
					area: area
					context: source)
]

{ #category : #logging }
LogStructuredLogger >> logDebug: aMessage with: aContext [
	^self log: aMessage with: aContext level: LogLevel debug

]

{ #category : #'as yet unclassified' }
LogStructuredLogger >> logError: aMessage with: aContext [ 
	^self log: aMessage with: aContext level: LogLevel error
]

{ #category : #'as yet unclassified' }
LogStructuredLogger >> logInfo: aMessage with: aContext [
	^self log: aMessage with: aContext level: LogLevel info
]

{ #category : #'as yet unclassified' }
LogStructuredLogger >> logNotice: aMessage with: aContext [
	^self log: aMessage with: aContext level: LogLevel notice
]

{ #category : #creation }
LogStructuredLogger >> source: anObject [ 
	source := anObject
]
