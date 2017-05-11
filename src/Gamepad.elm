module Gamepad exposing
  ( Gamepad
  , Axes
  , Button
  , gamepads
  )

{-| You might have some gamepads attached. This library helps you play.

# Gamepads
@docs gamepads

# Gamepad
@docs Gamepad

# Axes
@docs Axes

# Button
@docs Button

-}

import Task exposing (Task)

import Internal.Convert exposing (convert)
import Internal.Types as Types
import Native.Gamepad

{-| Axes -}
type alias Axes    = Types.Axes

{-| Button -}
type alias Button  = Types.Button

{-| Gamepad -}
type alias Gamepad = Types.Gamepad

{-| Get the currently connected gamepads
-}
gamepads : (List Gamepad -> msg) -> Cmd msg
gamepads tagger = Task.map (List.map convert) getRawGamepads |> Task.perform tagger

getRawGamepads : Task x (List Types.RawGamepad_)
getRawGamepads = Native.Gamepad.gamepads 1.0
