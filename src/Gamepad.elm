module Gamepad exposing
  ( Gamepad
  , Button
  , gamepads
  )

{-| You might have some gamepads attached. This library helps you play.

# Gamepads
@docs gamepads

# Gamepad
@docs Gamepad

# Button
@docs Button

-}

import Task exposing (Task)

import Native.Gamepad

{-| Button -}
type alias Button =
  { pressed : Bool
  , value : Float
  }

{-| Gamepad -}
type alias Gamepad =
  { id : String
  , axes : List Float
  , buttons : List Button
  , mapping : String
  -- connected
  -- index
  -- timestamp
  }

{-| Get the currently connected gamepads
-}
gamepads : (List Gamepad -> msg) -> Cmd msg
gamepads tagger = getGamepads |> Task.perform tagger

getGamepads : Task x (List Gamepad)
getGamepads = Native.Gamepad.gamepads 1.0
