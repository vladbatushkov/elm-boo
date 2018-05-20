module Main exposing (..)

import Config exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


main : Program Flags Model Msg
main =
    programWithFlags
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }


type alias Model =
    { config : Config
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( Model (initConfig flags)
    , Cmd.none
    )


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
        [ img [ src <| getImage ElmLogo model.config, class "logo" ] []
        , span [ class "header" ] [ text model.config.title ]
        , p [ class "config" ]
            [ div [] [ text <| "width : " ++ toString model.config.globalWidth ]
            , div [] [ text <| "height : " ++ toString model.config.globalHeight ]
            ]
        ]
