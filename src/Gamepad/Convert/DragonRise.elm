module Gamepad.Convert.DragonRise exposing (convert)

import String exposing (contains)
import Gamepad.Types exposing (..)


-- DragonRise Inc. Generic USB Joystick (Vendor: 0079 Product: 0006)


convert : RawGamepad_ -> Maybe StandardGamepad_
convert rawGamepad =
    case
        ( contains "Vendor: 0079 Product: 0006" rawGamepad.id
        , rawGamepad.axes
        , rawGamepad.buttons
        )
    of
        ( True, [ x1, x2, y1, y2 ], [ bY, bB, bA, bX, lB, rB, lT, rT, bBack, bStart, leftStickButton, rightStickButton, dPadUp, dPadDown, dPadLeft, dPadRight ] ) ->
            let
                emptyTrigger =
                    { pressed = False, value = 0 }
            in
                -- it has two modes:
                -- analog:     dPad = four buttons, stick axes work
                -- not analog: dPad = axes x1+y1,   stick axes don't work
                Just
                    { id = rawGamepad.id
                    , buttonBack = bBack
                    , buttonStart = bStart
                    , buttonLogo =
                        emptyTrigger

                    -- doesn't have a logo button
                    , buttonA = bA
                    , buttonB = bB
                    , buttonX = bX
                    , buttonY = bY
                    , leftTrigger = lT
                    , leftBumper = lB
                    , leftStick = { x = x1, y = y1, button = leftStickButton }
                    , rightTrigger = rT
                    , rightBumper = rB
                    , rightStick = { x = x2, y = y2, button = rightStickButton }
                    , dPadUp = dPadUp
                    , dPadDown = dPadDown
                    , dPadLeft = dPadLeft
                    , dPadRight = dPadRight
                    }

        _ ->
            Nothing
