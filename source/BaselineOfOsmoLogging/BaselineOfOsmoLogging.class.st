Class {
	#name : #BaselineOfOsmoLogging,
	#superclass : #BaselineOf,
	#category : #BaselineOfOsmoLogging
}

{ #category : #baselines }
BaselineOfOsmoLogging >> baseline: spec [
	<baseline>

	spec
		package: #OsmoLogging;
		package: #OsmoSyslog.
]
