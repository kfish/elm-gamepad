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

{-| Axis -}
type alias Axes =
  { x : Float
  , y : Float
  }

{-| Gamepad -}
type Gamepad =
  StandardGamepad StandardGamepad_
  | RawGamepad RawGamepad_

-- | StandardGamepad
type alias StandardGamepad_ =
  { id : String

  , buttonSelect : Button
  , buttonStart  : Button
  , buttonLogo   : Button

  , buttonA : Button
  , buttonB : Button
  , buttonX : Button
  , buttonY : Button

  , leftTrigger    : Button
  , leftBumper     : Button
  , leftStick      : Axes
  , leftStickPress : Button

  , rightTrigger    : Button
  , rightBumper     : Button
  , rightStick      : Axes
  , rightStickPress : Button

  , dPadUp    : Button
  , dPadDown  : Button
  , dPadLeft  : Button
  , dPadRight : Button
  }

{-| RawGamepad -}
type alias RawGamepad_ =
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
gamepads tagger = Task.map (List.map convert) getRawGamepads |> Task.perform tagger

convert : RawGamepad_ -> Gamepad
convert rg = RawGamepad rg

getRawGamepads : Task x (List RawGamepad_)
getRawGamepads = Native.Gamepad.gamepads 1.0
