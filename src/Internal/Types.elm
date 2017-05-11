module Internal.Types exposing (..)

{-| Button -}
type alias Button =
    { pressed : Bool
    , value   : Float
    }

{-| Stick -}
type alias Stick =
    { x      : Float
    , y      : Float
    , button : Button
    }

{-| Gamepad -}
type Gamepad =
      StandardGamepad StandardGamepad_
    | RawGamepad RawGamepad_

-- | StandardGamepad
type alias StandardGamepad_ =
    { id : String

   , buttonBack   : Button
   , buttonStart  : Button
   , buttonLogo   : Button

   , buttonA : Button
   , buttonB : Button
   , buttonX : Button
   , buttonY : Button

   , leftTrigger    : Button
   , leftBumper     : Button
   , leftStick      : Stick

   , rightTrigger    : Button
   , rightBumper     : Button
   , rightStick      : Stick

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

