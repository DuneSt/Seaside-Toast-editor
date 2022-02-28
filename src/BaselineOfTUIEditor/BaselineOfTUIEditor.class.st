Class {
	#name : #BaselineOfTUIEditor,
	#superclass : #BaselineOf,
	#category : #BaselineOfTUIEditor
}

{ #category : #baselines }
BaselineOfTUIEditor >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			self
				seaside3: spec;
				gitBridge: spec;
				fileLibraryHelper: spec.

			"Packages"
			spec
				package: 'Toast-UI' with: [ spec requires: #('Seaside3') ];
				package: 'Toast-Dev'
					with: [ spec requires: #('Toast-UI' 'GitBridge' 'FileLibraryHelper') ];
				package: 'Toast-Demo'
					with: [ spec requires: #('Toast-UI') ].
					
			"Groups"		
			spec group: 'core' with: #('Toast-UI') ]
]

{ #category : #baselines }
BaselineOfTUIEditor >> fileLibraryHelper: spec [
	"I small project to help developers to manage the files in the FileLibrary."

	spec
		baseline: 'FileLibraryHelper'
		with: [ spec repository: 'github://jecisc/FileLibraryHelper:v1.x.x/src' ]
]

{ #category : #baselines }
BaselineOfTUIEditor >> gitBridge: spec [
	spec
    	baseline: 'GitBridge'
    	with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
]

{ #category : #baselines }
BaselineOfTUIEditor >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('Core' 'JQuery' 'Zinc');
				repository: 'github://SeasideSt/Seaside/repository' ]
]
