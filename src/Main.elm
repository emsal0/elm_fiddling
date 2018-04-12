module Main exposing (..)

import Html exposing (Html, div, h1, text, program, button)
import Html.Events exposing (onClick)
import Random

import Svg exposing (..)
import Svg.Attributes exposing (..)

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
        [ svg
            [ width "600"
            , height "600"
            ]
            [ Svg.text_ [ x "20", y "20", fontSize "20" ] [Svg.text (toString model.dieFace)] ]
        , button [ onClick Roll ] [ Html.text "Roll" ]
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
