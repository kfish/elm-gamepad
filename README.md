# elm-gamepad

This package provides an Elm language interface for gamepad input.

It works in most modern browsers with both wired and wireless controllers.

* See [HTML5 Test](https://html5test.com/compare/feature/input.getGamepads.html) to
check browser compatibility.

* Use the [HTML5 Gamepad Tester](http://html5gamepad.com/) to test yours.

* See the [elm-gamepad live demo](http://kfish.github.io/elm-gamepad/) to view
the raw data visible to your Elm application.

Note that to avoid fingerprinting controllers, some browsers only
show them after a button has been pressed.

![Image of XBox 360 controller](images/xbox-1602822_1280.jpg)

## Device and operating system support

I'm developing this on Ubuntu Linux and tested it with:

* wired USB controllers on Mac OS X, Ubuntu and Centos
* Bluetooth controllers on Android (in Firefox)

It works out of the box on Linux and Android, and probably Windows.

On Mac OS X you may need to install a driver, such as
[XBox 360 controller driver for OSX](http://tattiebogle.net/index.php/ProjectRoot/Xbox360Controller/OsxDriver).


## Usage

A Gamepad is represented as an Elm record containing lists of
Buttons and Axes. The values of these fields indicate the
current state of that button or axis. According to the
[spec](spec):

> All button values must be linearly normalized to the range
> [0.0 .. 1.0]. 0.0 must mean fully unpressed, and 1.0 must
> mean fully pressed. For buttons without an analog sensor, only
> the values 0.0 and 1.0 for fully unpressed and fully pressed
> must be provided.

Axes refers to the X and Y axes of joysticks:

> All axis values must be linearly normalized to the range
> [-1.0 .. 1.0]. As appropriate, -1.0 should correspond to
> "up" or "left", and 1.0 should correspond to "down" or "right".

```elm
{-| Button -}
type alias Button =
  { pressed : Bool
  , value : Float
  }

{-| Gamepad -}
type alias Gamepad =
  { id : String
  , axes : List Float
  , buttons : List Button
  , mapping : String
  }
```

Axis values are listed in pairs, X followed by Y.
The buttons and axes appear in their respective lists in
decreasing order of importance.

The only defined mapping is "standard":

![Image of standard gamepad layout](https://w3c.github.io/gamepad/standard_gamepad.svg)

### Polling interface

To poll for the current state of connected gamepads:

```elm
{-| Get the currently connected gamepads
-}
gamepads : (List Gamepad -> msg) -> Cmd msg
gamepads tagger = getGamepads |> Task.perform tagger
```

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
## History

This package was originally developed by @zimbatm for Elm 0.15. It was updated
for Elm 0.16 by @kfish, and merged into
[Dreambuggy](http://github.com/kfish/dreambuggy/),
where it was updated for Elm versions 0.17 and 0.18.


## Resources

 * [W3C Gamepad specification](spec)

[spec]: https://w3c.github.io/gamepad/
