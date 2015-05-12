"
I will filter and then output the log message
"
Class {
	#name : #LogTarget,
	#superclass : #Object,
	#category : #'OsmoLogging-Target'
}

{ #category : #log }
LogTarget >> exception: anEntry [
	self subclassResponsibility

]

{ #category : #log }
LogTarget >> print: anEntry [
	self subclassResponsibility

]
