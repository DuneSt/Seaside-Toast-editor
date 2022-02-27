Class {
	#name : #TUIComponent,
	#superclass : #WAComponent,
	#instVars : [
		'saveCallback',
		'text',
		'waitingMessage',
		'extensions',
		'buttons',
		'widgetRules'
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
	| id el |
	id := html nextId.
	el := html div
		id: id;
		class: 'tui-editable';
		attributeAt: #'data-loaded' put: #false;
		attributeAt: #'data-save-callback'
			put:
			(html jQuery ajax
				type: 'POST';
				callback: [ :aString | self saveCallback cull: aString ]
					value: (JSStream on: 'TuiEditor.getInstance("#' , id , '").getValue()');
				onComplete: 'TuiEditor.saveCompleted()';
				onError: 'TuiEditor.saveFailed()');
		yourself.
	self widgetRules
		ifNotNil: [ el attributeAt: #'data-widget-rules' put: self widgetRules ].
	el with: self text
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

{ #category : #accessing }
TUIComponent >> widgetRules [
	^ widgetRules
]

{ #category : #accessing }
TUIComponent >> widgetRules: aString [
	widgetRules := aString
]
