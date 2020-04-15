module VerifyExamples.Storage.Size0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage exposing (..)
import Storage.Value as Value exposing (..)
import Test


spec0 : Test.Test
spec0 =
    Test.test "#size: \n\n    fromList [(\"foo\", Value.empty)]\n    |> size\n    --> 1" <|
        \() ->
            Expect.equal
                (fromList [ ( "foo", Value.empty ) ]
                    |> size
                )
                1
