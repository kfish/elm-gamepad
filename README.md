![Image of XBox 360 controller](images/xbox-1602822_1280.jpg)

# elm-gamepad

Use gamepad controllers in Elm applications.

## Browser support

This is a wrapper around the [W3C Gamepad API](https://w3c.github.io/gamepad/).

Most modern browsers support HTML5 gamepad input. See
https://html5test.com/compare/feature/input.getGamepads.html

To test your gamepad and browser, use the
[HTML5 Gamepad Tester](http://html5gamepad.com/).
Note that to avoid fingerprinting controllers, some browsers only
show them after a button has been pressed.

## Platform support

I'm developing this on Ubuntu Linux. I've tested it with:

	* wired USB controllers on Mac OS X, Ubuntu and Centos
	* Bluetooth controllers on Android (in Firefox)

It works out of the box on Linux and Android, and probably Windows.

On Mac OS X you may need to install a driver, such as
[XBox 360 controller driver for OSX]
(http://tattiebogle.net/index.php/ProjectRoot/Xbox360Controller/OsxDriver).

## Demo

This package contains a demo application
[ShowGamepad.elm](ShowGamepad.elm) which displays the raw Gamepad type.

[Live demo](http://kfish.github.io/elm-gamepad/)

## Build locally

To view it locally, clone this repository and run elm-reactor:

```
$ git clone https://github.com/kfish/elm-gamepad.git
$ cd elm-gamepad
$ elm-package install
$ elm-reactor
```

## API

```elm
-- Get a current list of gamepads
Gamepad.gamepads : (List Gamepad -> msg) -> Cmd msg
```

