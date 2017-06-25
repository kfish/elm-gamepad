module Gamepad.Convert exposing (convert)

import Gamepad.Types exposing (..)
import Gamepad.Convert.Standard as Standard
import Gamepad.Convert.RockCandy as RockCandy
import Gamepad.Convert.DragonRise as DragonRise


{-

   SDL Game Controller DB:
       https://github.com/gabomdq/SDL_GameControllerDB/blob/master/gamecontrollerdb.txt

   Chromium:
       https://cs.chromium.org/chromium/src/device/gamepad/

   Firefox:
       https://dxr.mozilla.org/mozilla-central/source/dom/gamepad

-}


conversions : List (RawGamepad_ -> Maybe StandardGamepad_)
conversions =
    [ Standard.convert
    , RockCandy.convert
    , DragonRise.convert
    ]


convert : RawGamepad_ -> Result RawGamepad_ StandardGamepad_
convert rawGamepad =
    case detect conversions rawGamepad of
        Just gamepad ->
            Ok gamepad

        Nothing ->
            Err rawGamepad



-- Find the first successful conversion


detect : List (a -> Maybe b) -> a -> Maybe b
detect list a =
    case list of
        f :: fs ->
            case f a of
                Just b ->
                    Just b

                Nothing ->
                    detect fs a

        [] ->
            Nothing
