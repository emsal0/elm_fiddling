module Main exposing (..)

import Html exposing (Html, div, h1, text, program, button)
import Html.Events exposing (onClick)
import Random

type alias Model =
    { dieFace : Int

    }

init: (Model, Cmd Msg)
init =
    ( Model 1, Cmd.none )

-- MESSAGES

type Msg
    = Roll
    | NewFace Int

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text (toString model.dieFace) ]
        , button [ onClick Roll ] [ text "Roll" ]
        ]

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6))

        NewFace i ->
            ( Model i, Cmd.none )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
