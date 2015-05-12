"
I log to the Transcript buffer
"
Class {
	#name : #LogTranscriptTarget,
	#superclass : #LogTarget,
	#category : #'OsmoLogging-Target'
}

{ #category : #log }
LogTranscriptTarget >> exception: anEntry [
	Transcript
	    show: anEntry msg; cr;
	    show: (anEntry context stack first: (20 min: anEntry context stack size)); cr.

]

{ #category : #log }
LogTranscriptTarget >> print: anEntry [
	Transcript
	    show: anEntry msg;
	    cr

]
