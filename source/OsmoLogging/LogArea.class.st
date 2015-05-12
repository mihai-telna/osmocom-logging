"
I represent a LogArea
"
Class {
	#name : #LogArea,
	#superclass : #Object,
	#instVars : [
		'name',
		'enabled',
		'level'
	],
	#category : #'OsmoLogging-Core'
}

{ #category : #accessing }
LogArea class >> areaDescription [
	^self subclassResponsibility

]

{ #category : #accessing }
LogArea class >> areaName [
	^self subclassResponsibility

]

{ #category : #accessing }
LogArea class >> availableAreas [
	^self allSubclasses 
	    collect: [:each | Array with: each areaName with: each areaDescription]

]

{ #category : #accessing }
LogArea class >> default [
	^self subclassResponsibility

]

{ #category : #'as yet unclassified' }
LogArea class >> defaultForArea: aSymbol [
	"Find an Area and place the default into our dictionary"

	LogArea 
	    allSubclassesDo: [:each | each areaName = aSymbol ifTrue: [^each default]].
	^nil

]

{ #category : #accessing }
LogArea >> enabled [
	^enabled

]

{ #category : #accessing }
LogArea >> enabled: anEnabled [
	enabled := anEnabled

]

{ #category : #accessing }
LogArea >> minLevel [
	^level

]

{ #category : #accessing }
LogArea >> minLevel: aLevel [
	level := aLevel

]
