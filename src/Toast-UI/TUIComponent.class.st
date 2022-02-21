Class {
	#name : #TUIComponent,
	#superclass : #WAComponent,
	#instVars : [
		'saveCallback',
		'text',
		'waitingMessage',
		'extensions',
		'buttons'
	],
	#category : #'Toast-UI'
}

{ #category : #accessing }
TUIComponent >> buttons [
	^ buttons
]

{ #category : #accessing }
TUIComponent >> buttons: anObject [
	buttons := anObject
]

{ #category : #accessing }
TUIComponent >> extensions [
	^ extensions
]

{ #category : #accessing }
TUIComponent >> extensions: anObject [
	extensions := anObject
]

{ #category : #rendering }
TUIComponent >> renderContentOn: html [
	| id |
	id := html nextId.
	html div
		id: id;
		class: 'tui-editable';
		attributeAt: #'data-loaded' put: #false;
		with: self text
]

{ #category : #accessing }
TUIComponent >> saveCallback [
	^ saveCallback
]

{ #category : #accessing }
TUIComponent >> saveCallback: anObject [
	saveCallback := anObject
]

{ #category : #accessing }
TUIComponent >> text [
	^ text
]

{ #category : #accessing }
TUIComponent >> text: anObject [
	text := anObject
]

{ #category : #accessing }
TUIComponent >> waitingMessage [
	^ waitingMessage
]

{ #category : #accessing }
TUIComponent >> waitingMessage: anObject [
	waitingMessage := anObject
]
