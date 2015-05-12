Extension { #name : #Association }

{ #category : #'*OsmoLogging-Core' }
Association >> formatForLogging [
	^String streamContents: [:stream |
		stream
			nextPutAll: self key formatForLogging;
			nextPutAll: '->';
			nextPutAll: self value formatForLogging
	]
]
