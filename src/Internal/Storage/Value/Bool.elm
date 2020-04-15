module Internal.Storage.Value.Bool exposing
    ( ValueBool
    , decode
    , encode
    , make
    , toBool
    , toComparable
    , toInt
    , toString
    )

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


type ValueBool
    = ValueBool Bool


make : Bool -> ValueBool
make =
    ValueBool


toComparable : ValueBool -> Int
toComparable =
    toInt


toInt : ValueBool -> Int
toInt (ValueBool a) =
    if a then
        1

    else
        0


toString : ValueBool -> String
toString (ValueBool a) =
    if a then
        "true"

    else
        "false"


toBool : ValueBool -> Bool
toBool (ValueBool a) =
    a


encode : ValueBool -> Value
encode =
    Encode.bool << toBool


decode : Decoder ValueBool
decode =
    Decode.map make Decode.bool
