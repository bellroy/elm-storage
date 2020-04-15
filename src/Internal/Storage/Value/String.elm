module Internal.Storage.Value.String exposing
    ( ValueString
    , decode
    , encode
    , make
    , toComparable
    , toString
    )

import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


type ValueString
    = ValueString String


make : String -> ValueString
make =
    ValueString


toComparable : ValueString -> String
toComparable =
    toString


toString : ValueString -> String
toString (ValueString a) =
    a


encode : ValueString -> Value
encode =
    Encode.string << toString


decode : Decoder ValueString
decode =
    Decode.map make Decode.string
