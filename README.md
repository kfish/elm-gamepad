Elm Gamepad
===========

This is a wrapper around the [W3C Gamepad API
(draft)](https://w3c.github.io/gamepad/).

API
---

```elm
-- Get a current list of gamepads
Gamepad.gamepads : (List Gamepad -> msg) -> Cmd msg
```

Browser support
---------------

Most modern browsers support HTML5 gamepad input. A current list of
browser support is at
https://html5test.com/compare/feature/input.getGamepads.html

To test gamepad support in your browser, use the
[HTML5 Gamepad Tester](http://html5gamepad.com/).
Note that to avoid fingerprinting controllers, some browsers only
show them after a button has been pressed.

This package contains a demo application
[ShowGamepad.elm](ShowGamepad.elm) which displays the raw Gamepad type.

To view it, clone this repository and run elm-reactor:

```
$ git clone https://github.com/kfish/elm-gamepad.git
$ elm-package install
$ elm-reactor
```
