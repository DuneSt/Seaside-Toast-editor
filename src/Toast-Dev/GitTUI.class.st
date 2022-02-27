Class {
	#name : #GitTUI,
	#superclass : #GitBridge,
	#category : #'Toast-Dev'
}

{ #category : #accessing }
GitTUI class >> resources [
	^ self root / 'resources'
]
