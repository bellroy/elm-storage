module Internal.Storage.Value.Json exposing
    ( ValueJson
    , decode
    , encode
    , make
    , toComparable
    , toString
    )

import Json.Decode as Decode exposing (Decoder, Value)
import Json.Encode as Encode


type ValueJson
    = ValueJson Value


make : Value -> ValueJson
make =
    ValueJson


toComparable : ValueJson -> String
toComparable =
    toString


toString : ValueJson -> String
toString =
    Encode.encode 0 << encode


encode : ValueJson -> Value
encode (ValueJson a) =
    a


decode : Decoder ValueJson
decode =
    Decode.map make Decode.value
