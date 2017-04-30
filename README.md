Elm Gamepad
===========

Wrapper around the [W3C Gamepad API
(draft)](https://w3c.github.io/gamepad/gamepad.html).

Usage
-----

```elm
-- Get a current list of gamepads
Gamepad.gamepads : (List Gamepad -> msg) -> Cmd msg
```


To avoid fingerprinting controllers, browsers only show them when a first
button is pressed.

