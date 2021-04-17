"
I can log everything to the syslog.
"
Class {
	#name : #LogTargetSyslog,
	#superclass : #LogTarget,
	#instVars : [
		'prefix'
	],
	#classVars : [
		'LogMap'
	],
	#classInstVars : [
		'Identity',
		'LogMap'
	],
	#category : #OsmoSyslog
}

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_AUTH [
	^4<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_AUTHPRIV [
	^10<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_CRON [
	^9<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_DAEMON [
	^3<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_FTP [
	^11<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_KERN [
	^0<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL0 [
	^ 16 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL1 [
	^ 17 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL2 [
	^ 18 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL3 [
	^ 19 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL4 [
	^ 20 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL5 [
	^ 21 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL6 [
	^ 22 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LOCAL7 [
	^ 23 << 3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_LPR [
	^6<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_MAIL [
	^2<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_NEWS [
	^7<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_SYSLOG [
	^5<<3
]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_USER [
	^8

]

{ #category : #'c-facility' }
LogTargetSyslog class >> LOG_UUCP [
	^8<<3
]

{ #category : #'c-interface' }
LogTargetSyslog class >> c_closelog [
	"void closelog(void)"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(void closelog())

]

{ #category : #'c-interface' }
LogTargetSyslog class >> c_openlog: ident opt: aOpt facility: aFac [
	"openlog(const char *ident, int logopt, int facility);"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^self nbCall: #(void openlog(char *ident, int aOpt, int aFac))
]

{ #category : #'c-interface' }
LogTargetSyslog class >> c_syslog: prio format: fmt prefix: prefix text: text [
	"void syslog(int priority, const char *message, ...);
	NativeBoost can not present variable args... so cheat.."
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(void syslog(int prio, String fmt, String prefix, String text))

]

{ #category : #uffi }
LogTargetSyslog class >> ffiLibraryName [
	^LibC
]

{ #category : #'as yet unclassified' }
LogTargetSyslog class >> logLevelMap [
	^LogMap ifNil: 
		[LogMap := (Dictionary new)
			    at: LogLevel debug put: 7;
			    at: LogLevel info put: 6;
			    at: LogLevel notice put: 5;
			    at: LogLevel error put: 3;
			    yourself]

]

{ #category : #'as yet unclassified' }
LogTargetSyslog class >> openlog: anIdentity option: aOption facility: aFacility [
	"openlog(3) will simply store the pointer. So we need to make sure
	that the string does stay around"

	Identity := self toExternalString: anIdentity.
	self c_closelog.
	self c_openlog: Identity opt: aOption facility: aFacility.
	^self new

]

{ #category : #'as yet unclassified' }
LogTargetSyslog class >> toExternalString: aString [
	^ExternalAddress fromString: aString
]

{ #category : #'as yet unclassified' }
LogTargetSyslog class >> update: aSymbol [
	"We need to forget the C String we have allocated as we are running
	 in a new VM right now. Maybe we will be re-opened by someone."

	aSymbol = #returnFromSnapshot 
	    ifTrue: [Smalltalk at: #SYSLOG_NAME put: nil]

]

{ #category : #'as yet unclassified' }
LogTargetSyslog >> exception: aMessage [
	| level ctx |
	ctx := aMessage context stack collect: [:each | each asString].
	ctx := Character lf join: ctx.
	level := self class logLevelMap at: aMessage level.
	self class c_syslog: level format: '%s%s' prefix: self prefix text: 'EXCEPTION occured: ', ctx.
	self print: aMessage

]

{ #category : #'as yet unclassified' }
LogTargetSyslog >> prefix [
	^prefix ifNil: ['']

]

{ #category : #'as yet unclassified' }
LogTargetSyslog >> prefix: aMsg [
	prefix := aMsg

]

{ #category : #output }
LogTargetSyslog >> print: aMessage [
	| level |
	level := self class logLevelMap at: aMessage level.
	self class c_syslog: level format: '%s%s' prefix: self prefix text: aMessage msg.

]
