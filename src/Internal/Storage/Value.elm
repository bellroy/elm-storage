module Internal.Storage.Value exposing
    ( Value(..)
    , compare
    , decode
    , encode
    , equals
    , toBool
    , toFloat
    , toInt
    , toJson
    , toString
    , toStringUnsafe
    )

import Internal.Storage.Value.Bool as ValueBool exposing (ValueBool)
import Internal.Storage.Value.Float as ValueFloat exposing (ValueFloat)
import Internal.Storage.Value.Int as ValueInt exposing (ValueInt)
import Internal.Storage.Value.Json as ValueJson exposing (ValueJson)
import Internal.Storage.Value.String as ValueString exposing (ValueString)
import Json.Decode as Decode exposing (Decoder)
import Json.Encode as Encode exposing (Value)


type Value
    = ValueEmpty
    | ValueBool ValueBool
    | ValueFloat ValueFloat
    | ValueInt ValueInt
    | ValueString ValueString
    | ValueJson ValueJson


encode : Value -> Encode.Value
encode json =
    case json of
        ValueEmpty ->
            Encode.null

        ValueBool a ->
            ValueBool.encode a

        ValueFloat a ->
            ValueFloat.encode a

        ValueInt a ->
            ValueInt.encode a

        ValueString a ->
            ValueString.encode a

        ValueJson a ->
            ValueJson.encode a


decode : Decoder Value
decode =
    Decode.oneOf
        [ Decode.map ValueBool ValueBool.decode
        , Decode.map ValueFloat ValueFloat.decode
        , Decode.map ValueInt ValueInt.decode
        , Decode.map ValueString ValueString.decode
        , Decode.map ValueJson ValueJson.decode
        ]


equals : Value -> Value -> Bool
equals a b =
    (==) EQ <| compare a b


compare : Value -> Value -> Order
compare a b =
    case ( a, b ) of
        ( ValueEmpty, ValueEmpty ) ->
            EQ

        ( ValueBool a1, ValueBool b1 ) ->
            Basics.compare
                (ValueBool.toComparable a1)
                (ValueBool.toComparable b1)

        ( ValueFloat a1, ValueFloat b1 ) ->
            Basics.compare
                (ValueFloat.toComparable a1)
                (ValueFloat.toComparable b1)

        ( ValueInt a1, ValueInt b1 ) ->
            Basics.compare
                (ValueInt.toComparable a1)
                (ValueInt.toComparable b1)

        ( ValueString a1, ValueString b1 ) ->
            Basics.compare
                (ValueString.toComparable a1)
                (ValueString.toComparable b1)

        ( ValueJson a1, ValueJson b1 ) ->
            Basics.compare
                (ValueJson.toComparable a1)
                (ValueJson.toComparable b1)

        _ ->
            Basics.compare
                (toStringUnsafe a)
                (toStringUnsafe b)


toStringUnsafe : Value -> String
toStringUnsafe value =
    case value of
        ValueEmpty ->
            ""

        ValueBool a ->
            ValueBool.toString a

        ValueFloat a ->
            ValueFloat.toString a

        ValueInt a ->
            ValueInt.toString a

        ValueString a ->
            ValueString.toString a

        ValueJson a ->
            ValueJson.toString a


toBool : Value -> Maybe Bool
toBool a =
    case a of
        ValueBool a2 ->
            Just <| ValueBool.toBool a2

        _ ->
            Nothing


toFloat : Value -> Maybe Float
toFloat a =
    case a of
        ValueFloat a2 ->
            Just <| ValueFloat.toFloat a2

        _ ->
            Nothing


toInt : Value -> Maybe Int
toInt a =
    case a of
        ValueInt a2 ->
            Just <| ValueInt.toInt a2

        _ ->
            Nothing


toString : Value -> Maybe String
toString a =
    case a of
        ValueString a2 ->
            Just <| ValueString.toString a2

        _ ->
            Nothing


toJson : Value -> Maybe Encode.Value
toJson a =
    case a of
        ValueJson a2 ->
            Just <| ValueJson.encode a2

        _ ->
            Nothing
