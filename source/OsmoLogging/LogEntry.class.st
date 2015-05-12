"
I represent a log entry and hold the text, level, area
"
Class {
	#name : #LogEntry,
	#superclass : #Object,
	#instVars : [
		'level',
		'ctx',
		'area',
		'msg'
	],
	#category : #'OsmoLogging-Core'
}

{ #category : #'as yet unclassified' }
LogEntry class >> withMsg: aMsg level: anLevel area: anArea context: aContext [
	^(self new)
	    msg: aMsg;
	    level: anLevel;
	    area: anArea;
	    context: aContext;
	    yourself

]

{ #category : #'as yet unclassified' }
LogEntry >> area [
	^area

]

{ #category : #'as yet unclassified' }
LogEntry >> area: anArea [
	area := anArea

]

{ #category : #'as yet unclassified' }
LogEntry >> context [
	^ctx

]

{ #category : #'as yet unclassified' }
LogEntry >> context: aContext [
	ctx := aContext

]

{ #category : #'as yet unclassified' }
LogEntry >> level [
	^level

]

{ #category : #'as yet unclassified' }
LogEntry >> level: anLevel [
	level := anLevel

]

{ #category : #'as yet unclassified' }
LogEntry >> msg [
	^msg

]

{ #category : #'as yet unclassified' }
LogEntry >> msg: aMsg [
	msg := aMsg

]
