module Config exposing (..)

import Json.Decode exposing (..)


type alias Flags =
    { title : String
    , globalWidth : Int
    , globalHeight : Int
    , images : Json.Decode.Value
    }


type alias Config =
    { title : String
    , globalWidth : Int
    , globalHeight : Int
    , images : List Img
    }


type alias Img =
    { id : ImgKey
    , src : String
    }


type ImgKey
    = ElmLogo


initConfig : Flags -> Config
initConfig flags =
    case Json.Decode.decodeValue imgsDecoder flags.images of
        Ok imgDict ->
            Config flags.title
                flags.globalWidth
                flags.globalHeight
                imgDict

        Err err ->
            Debug.log (Json.Decode.errorToString err) (Config "" 0 0 [])


imgsDecoder : Json.Decode.Decoder (List Img)
imgsDecoder =
    Json.Decode.list imgDecoder


imgDecoder : Json.Decode.Decoder Img
imgDecoder =
    Json.Decode.map2 Img
        (Json.Decode.field "id" decodeImgKey)
        (Json.Decode.field "src" Json.Decode.string)


decodeImgKey : Json.Decode.Decoder ImgKey
decodeImgKey =
    Json.Decode.string
        |> Json.Decode.andThen
            (\s ->
                case s of
                    "elmlogo" ->
                        Json.Decode.succeed ElmLogo

                    _ ->
                        Json.Decode.fail ("Unrecognized image key " ++ s)
            )


getImage : ImgKey -> Config -> String
getImage key config =
    let
        kv =
            List.head <| List.filter (\x -> x.id == key) config.images
    in
        case kv of
            Just v ->
                v.src

            Nothing ->
                ""
