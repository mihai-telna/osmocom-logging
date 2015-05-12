"
I represent the available levels for log messages
"
Class {
	#name : #LogLevel,
	#superclass : #Object,
	#category : #'OsmoLogging-Core'
}

{ #category : #'as yet unclassified' }
LogLevel class >> debug [
	^1

]

{ #category : #'as yet unclassified' }
LogLevel class >> error [
	^7

]

{ #category : #'as yet unclassified' }
LogLevel class >> info [
	^3

]

{ #category : #'as yet unclassified' }
LogLevel class >> notice [
	^5

]
