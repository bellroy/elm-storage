module Internal.Storage.Value.Float exposing
    ( ValueFloat
    , decode
    , encode
    , make
    , toComparable
    , toFloat
    , toString
    )

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


type ValueFloat
    = ValueFloat Float


make : Float -> ValueFloat
make =
    ValueFloat


toComparable : ValueFloat -> Float
toComparable =
    toFloat


toString : ValueFloat -> String
toString =
    String.fromFloat << toFloat


toFloat : ValueFloat -> Float
toFloat (ValueFloat a) =
    a


encode : ValueFloat -> Value
encode =
    Encode.float << toFloat


decode : Decoder ValueFloat
decode =
    Decode.map make Decode.float
