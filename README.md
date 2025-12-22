# BP TicTacToe CLI Example

Example of the TicTacToe game controlled via the CLI and implemented using Behavioral Programming (BP) in Glamorous Toolkit with [Gt4Bp](https://github.com/isegorg/gt4bp): play tictactoe waiting for move events.

## Download

Glamorous Toolkit can be downloaded from https://gtoolkit.com/download/ and unzip.

## Installation

The project can be loaded from the terminal with the following command. Previously you should replace `$GT_HOME`, or define its value, to the binaries directory under the GT installation directory:

This command can take some time because it will download and install in your image the required dependencies (e.g. Gt4Bp will be downloaded and tangled). Once it finishes successfully all the GT windows will be closed and the control returned to the terminal:

```bash
$GT_HOME/GlamorousToolkit-cli --interactive \
	GlamorousToolkit.image eval \
	"Metacello new \
		repository: 'github://isegorg/bp-tictactoe-example:main/src'; \
		baseline: 'BpTictactoeExample'; \
		load." \
	--save
```

On Mac

```bash
GT_HOME = <unzip_folder>/GlamorousToolkit.app/Contents/MacOS/
```

On Linux

```bash
GT_HOME = <unzip_folder>/bin/
```

Or from within the image running in a playground the following Smalltalk expression:

```st
Metacello new
	repository: 'github://isegorg/bp-tictactoe-example:main/src';
	baseline: 'BpTictactoeExample';
	load
```

## Start examples from CLI

```bash
$GT_HOME/GlamorousToolkit-cli GlamorousToolkit.image\
	bpCliExample --class=BpCliTictactoeExample --signature=allRules
```
The previous command starts the example that waits for inputs in the standard input.

For example, you can copying the following input event to the standard input and pressing `RETURN`:

```json
{"name":"move","data":{"row":1, "col":1}}
```
If the program runs as expected it should print the following two events in the standard output:

```json
{"name":"move","data":{"row":1,"col":1},"type":"eventFired"}
{"name":"moveAccepted","data":{"row":1,"col":1,"player":"X"},"type":"eventFired"}
```
## Specifications

The program's specifications can be found at [Specifications](https://github.com/isegorg/bp-tictactoe-example/wiki/Specifications)
