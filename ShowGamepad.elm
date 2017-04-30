module Main exposing (..)

import Html exposing (text)

import Gamepad

import Html exposing (Html, div, text, program)

type Msg
    = GamepadMsg (List Gamepad.Gamepad)

type alias Model =
    List Gamepad.Gamepad

init : ( Model, Cmd Msg )
init =
    ( [], Gamepad.gamepads GamepadMsg )

view : Model -> Html Msg
view model =
    div []
        [ text (toString model) ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GamepadMsg gamepads ->
            ( gamepads, Gamepad.gamepads GamepadMsg )

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [
        ]

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
