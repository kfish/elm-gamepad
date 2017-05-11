module Internal.Convert exposing (convert)

import Internal.Types exposing (..)

convert : RawGamepad_ -> Gamepad
convert rg = RawGamepad rg

