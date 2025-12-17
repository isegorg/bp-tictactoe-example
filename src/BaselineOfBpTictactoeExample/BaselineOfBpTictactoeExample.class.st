Class {
	#name : #BaselineOfBpTictactoeExample,
	#superclass : #BaselineOf,
	#category : #BaselineOfBpTictactoeExample
}

{ #category : #loading }
BaselineOfBpTictactoeExample class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'bp-tictactoe-example' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfBpTictactoeExample >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'BpCliTictactoeExample'
		]
]
