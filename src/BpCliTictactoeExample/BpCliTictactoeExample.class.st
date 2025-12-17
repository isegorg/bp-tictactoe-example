Class {
	#name : #BpCliTictactoeExample,
	#superclass : #Gt4BpRunnerBridgeCliExamples,
	#category : #BpCliTictactoeExample
}

{ #category : #example }
BpCliTictactoeExample >> allRules [
	<gtExample>
	| gt4bpTictactoeExamples runner |
	gt4bpTictactoeExamples := Gt4BpTicTacToeExamples new.
	runner := self emptyRunnerCli
		loadBProgram: gt4bpTictactoeExamples btAlterningTurns named: 'test-AlterningTurns.js';
		loadBProgram: gt4bpTictactoeExamples btSquareTaken named: 'test-SquareTaken.js';
		loadBProgram: gt4bpTictactoeExamples btXWin named: 'test-XWin.js';
		loadBProgram: gt4bpTictactoeExamples btOWin named: 'test-OWin.js';
		loadBProgram: gt4bpTictactoeExamples btGameOver named: 'test-Gameover.js';
		loadBProgram: gt4bpTictactoeExamples btDraw named: 'test-Draw.js';
		yourself.
	^ runner
]

{ #category : #example }
BpCliTictactoeExample >> emptyRunnerCli [
	<gtExample>
	| runner |
	runner := (Gt4BpRunnerBridgeCli 
		fromDirectory: (FileLocator temp / 'bt-examples' / 'tictactoe') asFileReference)
		onEvent: [ :event | Transcript crShow: 'BP Event -> ' , event asString ].
	^ runner
]
