module Internal.Storage.Value.Int exposing
    ( ValueInt
    , decode
    , encode
    , make
    , toComparable
    , toInt
    , toString
    )

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


type ValueInt
    = ValueInt Int


make : Int -> ValueInt
make =
    ValueInt


toComparable : ValueInt -> Int
toComparable =
    toInt


toString : ValueInt -> String
toString =
    String.fromInt << toInt


toInt : ValueInt -> Int
toInt (ValueInt a) =
    a


encode : ValueInt -> Value
encode =
    Encode.int << toInt


decode : Decoder ValueInt
decode =
    Decode.map make Decode.int
