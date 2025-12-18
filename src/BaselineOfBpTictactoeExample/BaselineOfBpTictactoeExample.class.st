Class {
	#name : 'BaselineOfBpTictactoeExample',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBpTictactoeExample',
	#package : 'BaselineOfBpTictactoeExample'
}

{ #category : 'loading' }
BaselineOfBpTictactoeExample class >> assimilateKnowledgeGt4BpLepiter [
	(LeDatabasesRegistry defaultLogicalDatabase
		databaseNamed: 'isegorg/gt4bp/lepiter') processKnowledge
]

{ #category : 'loading' }
BaselineOfBpTictactoeExample class >> loadAndAssimilateKnowledgeGt4BpLepiter [
	self loadGt4BpLepiter.
	self assimilateKnowledgeGt4BpLepiter
]

{ #category : 'loading' }
BaselineOfBpTictactoeExample class >> loadGt4BpLepiter [
	| gt4BpBaselineSymbol anEnvironment |
	gt4BpBaselineSymbol := #BaselineOfGt4BP.
	anEnvironment := Smalltalk globals.
	anEnvironment
		at: gt4BpBaselineSymbol
		ifPresent: [ :class |
			"To ensure logical DB properties creation in cli mode"
			LeLogicalDatabaseProperties defaultForGlamorousToolkit.
			gt4BpBaselineSymbol asClass loadLepiter ]
		ifAbsent: [  "NotFound signalFor: gt4BpBaselineSymbol in: anEnvironment" ]
]

{ #category : 'loading' }
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

{ #category : 'baseline' }
BaselineOfBpTictactoeExample >> baseline: spec [
	<baseline>
	^ spec
		for: #common
		do: [
			self
				lepiterLiterate: spec;
				gt4Bp: spec.
			spec preLoadDoIt: #'postLoadChanges:'.
			spec
				package: 'BpCliTictactoeExample'
				with: [ spec requires: #('LepiterLiterate' 'Gt4BP') ] ]
]

{ #category : 'post load' }
BaselineOfBpTictactoeExample >> gt4Bp: spec [
	spec
		baseline: 'Gt4BP'
		with: [
			spec
				repository: 'github://isegorg/gt4bp:main/src' ]
]

{ #category : 'baseline' }
BaselineOfBpTictactoeExample >> lepiterLiterate: spec [
	spec
		baseline: 'LepiterLiterate'
		with: [ spec repository: 'github://blueplanelabs/lepiter-literate:main/src' ]
]

{ #category : 'post load' }
BaselineOfBpTictactoeExample >> postLoadChanges: spec [
	self class loadAndAssimilateKnowledgeGt4BpLepiter
]
