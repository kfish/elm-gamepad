module Internal.Convert exposing (convert)

import String exposing (contains)

import Internal.Types exposing (..)

convert : RawGamepad_ -> Result RawGamepad_ StandardGamepad_
convert rawGamepad =
    if contains "STANDARD GAMEPAD" rawGamepad.id then
        fromStandardMapping rawGamepad
    else
        fromUnknownMapping rawGamepad


fromStandardMapping : RawGamepad_ -> Result RawGamepad_ StandardGamepad_
fromStandardMapping rawGamepad =
    case (rawGamepad.axes, rawGamepad.buttons) of
        ( [x1, y1, x2, y2]
        , [ a, b, x, y, lb, rb, lT, rT, back, start
          , lstick, rstick, padU, padD, padL, padR, logo]
        ) ->
            Ok
                { id = rawGamepad.id
                , buttonBack  = back
                , buttonStart = start
                , buttonLogo  = logo

                , buttonA = a
                , buttonB = b
                , buttonX = x
                , buttonY = y

                , leftTrigger    = lT
                , leftBumper     = lb
                , leftStick      = { x = x1, y = y1, button = lstick }

                , rightTrigger    = rT
                , rightBumper     = rb
                , rightStick      = { x = x2, y = y2, button = rstick }

                , dPadUp    = padU
                , dPadDown  = padD
                , dPadLeft  = padL
                , dPadRight = padR
                }

        _ -> fromUnknownMapping rawGamepad


fromUnknownMapping : RawGamepad_ -> Result RawGamepad_ StandardGamepad_
fromUnknownMapping rawGamepad =
    case (rawGamepad.axes, rawGamepad.buttons) of
        -- Performance Designed Products Rock Candy Gamepad for Xbox 360 (Vendor: 0e6f Product: 011f)
        ( [x1, y1, b1, x2, y2, b2, x3, y3]
        , [a, b, x, y, lb, rb, back, start, logo, lstick, rstick]) ->
            let
                toTrigger b = let b_ = (b+1.0)/2.0 in
                    if b_ > 0 then
                        { pressed = True, value = b_ }
                    else
                        { pressed = False, value = 0 }
                lT = toTrigger b1
                rT = toTrigger b2

                toPads ax =
                    if ax > 0 then
                        ({ pressed = True, value = ax }, { pressed = False, value = 0 })
                    else if ax < 0 then
                        ({ pressed = False, value = 0 }, { pressed = True, value = -ax })
                    else
                        ({ pressed = False, value = 0 }, { pressed = False, value = 0 })
                (padR, padL) = toPads x3
                (padD, padU) = toPads y3

            in

                    Ok
                        { id = rawGamepad.id

                        , buttonBack  = back
                        , buttonStart = start
                        , buttonLogo  = logo

                        , buttonA = a
                        , buttonB = b
                        , buttonX = x
                        , buttonY = y

                        , leftTrigger    = lT
                        , leftBumper     = lb
                        , leftStick      = { x = x1, y = y1, button = lstick }

                        , rightTrigger    = rT
                        , rightBumper     = rb
                        , rightStick      = { x = x2, y = y2, button = rstick }

                        , dPadUp    = padU
                        , dPadDown  = padD
                        , dPadLeft  = padL
                        , dPadRight = padR
                        }

        _ -> Err rawGamepad

