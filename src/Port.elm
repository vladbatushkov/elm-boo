port module Port exposing (..)

import Json.Decode exposing (..)


port listen : (Json.Decode.Value -> msg) -> Sub msg


decodeValue : (String -> msg) -> Json.Decode.Value -> msg
decodeValue mapper value =
    case Json.Decode.decodeValue Json.Decode.string value of
        Ok string ->
            mapper string

        Err _ ->
            mapper "JavaScript send shit!"
