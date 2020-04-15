module Storage.Value exposing
    ( Value
    , empty, string, int, float, bool, json
    , compare, equals
    , encode, decode
    , toString, toBool, toFloat, toInt, toJson, toStringUnsafe
    )

{-|

@docs Value


# Build

@docs empty, string, int, float, bool, json


# Helpers

@docs compare, equals


# JSON

@docs encode, decode


# Convert

@docs toString, toBool, toFloat, toInt, toJson, toStringUnsafe

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

    toStringUnsafe empty
    --> ""

    toStringUnsafe (bool True)
    --> "true"

    toStringUnsafe (float 1.6)
    --> "1.6"

    toStringUnsafe (int 2)
    --> "2"

    toStringUnsafe (string "foo")
    --> "foo"

    toStringUnsafe (json (Encode.object [ ("foo", Encode.string "bar" ) ]))
    --> "{\"foo\":\"bar\"}"

-}
toStringUnsafe : Value -> String
toStringUnsafe =
    Value.toStringUnsafe


{-| Safely convert Value to a String

    toString (string "foo")
    --> Just "foo"

    toString (bool True)
    --> Nothing

-}
toString : Value -> Maybe String
toString =
    Value.toString


{-| Safely convert Value to a Bool

    toBool (bool True)
    --> Just True

    toBool (string "foo")
    --> Nothing

-}
toBool : Value -> Maybe Bool
toBool =
    Value.toBool


{-| Safely convert Value to a Float

    toFloat (float 1.6  )
    --> Just 1.6

    toFloat (int 1)
    --> Nothing

-}
toFloat : Value -> Maybe Float
toFloat =
    Value.toFloat


{-| Safely convert Value to an Int

    toInt (int 1  )
    --> Just 1

    toInt (float 1.0)
    --> Nothing

-}
toInt : Value -> Maybe Int
toInt =
    Value.toInt


{-| Safely convert Value to a Json.Encode.Value
toJson (json Encode.null )
--> Just Encode.null

    toJson (bool True)
    --> Nothing

-}
toJson : Value -> Maybe Json.Value
toJson =
    Value.toJson


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
