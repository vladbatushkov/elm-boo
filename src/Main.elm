module Main exposing (..)

import Html exposing (..)


main : Program Flags Model Msg
main =
    programWithFlags
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }


type alias Flags =
    { title : String
    , globalWidth : Int
    , globalHeight : Int
    }


type alias Model =
    { title : String
    , globalWidth : Int
    , globalHeight : Int
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( Model flags.title flags.globalWidth flags.globalHeight, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text model.title ]
        , div []
            [ h3 [] [ text <| "width: " ++ toString model.globalWidth ]
            , h3 [] [ text <| "height: " ++ toString model.globalHeight ]
            ]
        ]
