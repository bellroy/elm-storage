module VerifyExamples.Storage.ModuleDoc3 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage exposing (..)
import Storage.Value as Value
import Test


configuration : Storage
configuration =
    Storage.fromList
        [ ( "config.item.a", Value.string "some value" )
        , ( "config.item.b", Value.float 1.5 )
        ]


spec3 : Test.Test
spec3 =
    Test.test "Module VerifyExamples: \n\n    Storage.getStringUnsafe \"config.item.a\" configuration\n    --> \"some value\"" <|
        \() ->
            Expect.equal
                (Storage.getStringUnsafe "config.item.a" configuration)
                "some value"