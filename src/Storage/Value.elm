module Storage.Value exposing
    ( Value
    , empty, string, int, float, bool, json
    , compare, equals
    , encode, decode
    , toString
    )

{-|

@docs Value


# Build

@docs empty, string, int, float, bool, json


# Helpers

@docs compare, equals


# JSON

@docs encode, decode


# Debug

@docs toString

-}

import Internal.Storage.Value as Value
import Internal.Storage.Value.Bool as ValueBool
import Internal.Storage.Value.Float as ValueFloat
import Internal.Storage.Value.Int as ValueInt
import Internal.Storage.Value.Json as ValueJson
import Internal.Storage.Value.String as ValueString
import Json.Decode as Json


{-| A Storage Value
-}
type alias Value =
    Value.Value


{-| Create an empty Value
-}
empty : Value
empty =
    Value.ValueEmpty


{-| Create a Value from a Bool
-}
bool : Bool -> Value
bool =
    Value.ValueBool << ValueBool.make


{-| Create a Value from a Float
-}
float : Float -> Value
float =
    Value.ValueFloat << ValueFloat.make


{-| Create a Value from an Int
-}
int : Int -> Value
int =
    Value.ValueInt << ValueInt.make


{-| Create a Value from a String
-}
string : String -> Value
string =
    Value.ValueString << ValueString.make


{-| Create a Value from a Json.Encode.Value
-}
json : Json.Value -> Value
json =
    Value.ValueJson << ValueJson.make


{-| Compare two Values
-}
compare : Value -> Value -> Order
compare =
    Value.compare


{-| Are two values the same?
-}
equals : Value -> Value -> Bool
equals =
    Value.equals


{-| Return a String representation of a Value.

    toString empty
    --> ""

    toString (bool True)
    --> "true"

    toString (float 1.6)
    --> "1.6"

    toString (int 2)
    --> "2"

    toString (string "foo")
    --> "foo"

    toString (json (Encode.object [ ("foo", Encode.string "bar" ) ]))
    --> "{\"foo\":\"bar\"}"

-}
toString : Value -> String
toString =
    Value.toString


{-| Encode a Storage.Value as a Json.Encode.Value
-}
encode : Value -> Json.Value
encode =
    Value.encode


{-| Decode a Json.Encode.Value into a Json.Value
-}
decode : Json.Decoder Value
decode =
    Value.decode
