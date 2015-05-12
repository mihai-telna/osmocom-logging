"
I filter based on mood, context and Bangkok Law
"
Class {
	#name : #LogFilter,
	#superclass : #Object,
	#category : #'OsmoLogging-Core'
}

{ #category : #filter }
LogFilter >> filter: anEntry [
	"I have to decide if anEntry can pass or should be filtered out, I can
	 access the logManager of anEntry to access the per process context"
	^self subclassResponsibility

]
