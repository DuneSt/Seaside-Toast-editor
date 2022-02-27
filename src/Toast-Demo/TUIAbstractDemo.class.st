Class {
	#name : #TUIAbstractDemo,
	#superclass : #WAComponent,
	#category : #'Toast-Demo'
}

{ #category : #accessing }
TUIAbstractDemo class >> description [
	^ 'Simple display and edition of markdown, without event'
]

{ #category : #accessing }
TUIAbstractDemo class >> title [
	^ 'Simple display'
]

{ #category : #rendering }
TUIAbstractDemo >> description [
	^ self class description
]

{ #category : #rendering }
TUIAbstractDemo >> renderCodeOfDemoOn: html [
	html heading
		level3;
		with: 'Code:'.
	html div
		class: 'tui-demo-snippet-code';
		with: [ html text: #TODO"html
				render:
					(PrismComponent new
						sourceCode: [ (self class >> #renderPrismComponentOn:) sourceCode ];
						language: #smalltalk;
						enableCopyOnClick;
						yourself)" ]
]

{ #category : #rendering }
TUIAbstractDemo >> renderContentOn: html [
	self renderTitleOn: html.
	html div
		class: 'tui-demo-snippet-group';
		with: [ self renderDemoOn: html.
			self renderCodeOfDemoOn: html ].
]

{ #category : #rendering }
TUIAbstractDemo >> renderDemoOn: html [
	html div
		class: 'tui-demo-snippet-demo';
		with: [ self renderEditorComponentOn: html ]
]

{ #category : #rendering }
TUIAbstractDemo >> renderEditorComponentOn: html [
	^ self subclassResponsibility
]

{ #category : #rendering }
TUIAbstractDemo >> renderTitleOn: html [
	html div
		class: 'monaco-demo-page-title';
		with: [ html heading
				level3;
				with: self title.
			html paragraph: self description.
			self warningDescription ifNotNil: [ :desc | html strong: desc ] ]
]

{ #category : #rendering }
TUIAbstractDemo >> title [
	^ self class title
]

{ #category : #rendering }
TUIAbstractDemo >> warningDescription [
	"If a demo needs a warning, override this method."

	^ nil
]
