module Gamepad.Convert.Standard exposing (convert)

import String exposing (contains)
import Gamepad.Types exposing (..)


convert : RawGamepad_ -> Maybe StandardGamepad_
convert rawGamepad =
    case
        ( contains "STANDARD GAMEPAD" rawGamepad.id
        , rawGamepad.axes
        , rawGamepad.buttons
        )
    of
        ( True, [ x1, y1, x2, y2 ], [ a, b, x, y, lb, rb, lT, rT, back, start, lstick, rstick, padU, padD, padL, padR, logo ] ) ->
            Just
                { id = rawGamepad.id
                , buttonBack = back
                , buttonStart = start
                , buttonLogo = logo
                , buttonA = a
                , buttonB = b
                , buttonX = x
                , buttonY = y
                , leftTrigger = lT
                , leftBumper = lb
                , leftStick = { x = x1, y = y1, button = lstick }
                , rightTrigger = rT
                , rightBumper = rb
                , rightStick = { x = x2, y = y2, button = rstick }
                , dPadUp = padU
                , dPadDown = padD
                , dPadLeft = padL
                , dPadRight = padR
                }

        _ ->
            Nothing
