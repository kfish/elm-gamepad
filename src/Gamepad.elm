module Gamepad exposing
  ( Gamepad(..)
  , Stick
  , Button
  , gamepads
  )

{-| You might have some gamepads attached. This library helps you play.

# Gamepads
@docs gamepads

# Gamepad
@docs Gamepad

# Stick
@docs Stick

# Button
@docs Button

-}

import Task exposing (Task)

import Internal.Convert as Convert
import Internal.Types as Types
import Native.Gamepad

{-| Stick -}
type alias Stick    = Types.Stick

{-| Button -}
type alias Button  = Types.Button

{-| Gamepad -}
type Gamepad =
      StandardGamepad Types.StandardGamepad_
    | RawGamepad Types.RawGamepad_

convert : Types.RawGamepad_ -> Gamepad
convert rawGamepad = case Convert.convert rawGamepad of
    Ok  sg -> StandardGamepad sg
    Err rg -> RawGamepad rg

{-| Get the currently connected gamepads
-}
gamepads : (List Gamepad -> msg) -> Cmd msg
gamepads tagger =
    Task.map (List.map convert) getRawGamepads
    |> Task.perform tagger

getRawGamepads : Task x (List Types.RawGamepad_)
getRawGamepads = Native.Gamepad.gamepads 1.0
