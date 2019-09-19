module Main exposing (..)

import Browser exposing (..)
import Config exposing (..)
import Port exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subs
        , view = view
        }


type alias Model =
    { config : Config
    , visible : String
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( Model (initConfig flags) "none"
    , Cmd.none
    )


subs : Model -> Sub Msg
subs model =
    Port.listen (Port.decodeValue mapMsg)


type Msg
    = NoOp
    | OpenMsg
    | CloseMsg


mapMsg : String -> Msg
mapMsg s =
    OpenMsg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OpenMsg ->
            ( { model | visible = "block" }, Cmd.none )

        CloseMsg ->
            ( { model | visible = "none" }, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ div [ class "overlay", style "display" model.visible ]
            [ a [ class "closebtn", onClick CloseMsg ] [ text "×" ]
            , div [ class "overlay-content" ]
                [ h1 [] [ text "Header" ]
                , a [ href "#" ]
                    [ text "Link1" ]
                , a [ href "#" ]
                    [ text "Link2" ]
                , a [ href "#" ]
                    [ text "Link3" ]
                ]
            ]
        ]



-- , div
--     []
--     [ img [ src <| getImage ElmLogo model.config, class "logo" ] []
--     , span [ class "header" ] [ text model.config.title ]
--     , p [ class "config" ]
--         [ div [] [ text <| "width : " ++ toString model.config.globalWidth ]
--         , div [] [ text <| "height : " ++ toString model.config.globalHeight ]
--         ]
--     ]
