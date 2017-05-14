module Internal.Convert exposing (convert)

import Internal.Types exposing (..)

import Internal.Convert.Standard as Standard
import Internal.Convert.RockCandy as RockCandy

conversions : List (RawGamepad_ -> Maybe StandardGamepad_)
conversions =
    [ Standard.convert
    , RockCandy.convert
    ]

convert : RawGamepad_ -> Result RawGamepad_ StandardGamepad_
convert rawGamepad = case detect conversions rawGamepad of
    Just gamepad -> Ok gamepad
    Nothing      -> Err rawGamepad

-- Find the first successful conversion
detect : List (a -> Maybe b) -> a -> Maybe b
detect list a = case list of
    f :: fs ->
        case f a of
            Just b  -> Just b
            Nothing -> detect fs a
    [] -> Nothing
