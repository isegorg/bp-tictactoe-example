# bp-tictactoe-example
Example of Behavioral Programming (BP) in Glamorous Toolkit using Gt4Bp: play tictactoe waiting for move events.

## Download

Glamorous Toolkit can be downloaded from https://gtoolkit.com/download/ and unzip.

## Installation

The project can be loaded from the terminal with:

```bash
<path_to_gt>/GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli --interactive GlamorousToolkit.image eval "Metacello new repository: 'github://isegorg/bp-tictactoe-example:main/src'; baseline: 'BpTictactoeExample'; load." --save
```
Or from within the image running in a playground

```st
Metacello new
	repository: 'github://isegorg/bp-tictactoe-example:main/src';
	baseline: 'BpTictactoeExample';
	load
```

## Start examples from CLI

```bash
<path_to_gt>/GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli GlamorousToolkit.image bpCliExample --class=BpCliTictactoeExample --signature=allRules
```

then you can insert events to the system by stdin and the fired events are passed to stdout.
