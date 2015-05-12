Extension { #name : #Object }

{ #category : #'*OsmoLogging-Core' }
Object >> formatForLogging [
	^String streamContents: [:stream |
		stream nextPutAll: self class printString;
			nextPut: $(;
			nextPutAll: self printString;
			nextPut: $)].
]

{ #category : #'*OsmoLogging-Core' }
Object >> logDataContext: aData area: anArea [
	self logManager context: 'data' value: aData

]

{ #category : #'*OsmoLogging-Core' }
Object >> logDebug: aMessage area: anArea [
	self logManager log: (LogEntry 
		    withMsg: aMessage
		    level: LogLevel debug
		    area: anArea
		    context: self)

]

{ #category : #'*OsmoLogging-Core' }
Object >> logError: aMessage area: anArea [
	self logManager log: (LogEntry 
		    withMsg: aMessage
		    level: LogLevel error
		    area: anArea
		    context: self)

]

{ #category : #'*OsmoLogging-Core' }
Object >> logException: aMessage area: anArea [
	self logManager exception: (LogEntry 
		    withMsg: aMessage
		    level: LogLevel error
		    area: anArea
		    context: self signalerContext)

]

{ #category : #'*OsmoLogging-Core' }
Object >> logInfo: aMessage area: anArea [
	self logManager log: (LogEntry 
		    withMsg: aMessage
		    level: LogLevel info
		    area: anArea
		    context: self)

]

{ #category : #'*OsmoLogging-Core' }
Object >> logManager [
	^LogManager default

]

{ #category : #'*OsmoLogging-Core' }
Object >> logNotice: aMessage area: anArea [
	self logManager log: (LogEntry 
		    withMsg: aMessage
		    level: LogLevel notice
		    area: anArea
		    context: self)

]
