Class {
	#name : #GSTProcessVariableHolder,
	#superclass : #Object,
	#instVars : [
		'val'
	],
	#category : #'OsmoLogging-Pharo'
}

{ #category : #get }
GSTProcessVariableHolder >> value [
	^val

]

{ #category : #set }
GSTProcessVariableHolder >> value: aValue [
	val := aValue

]
