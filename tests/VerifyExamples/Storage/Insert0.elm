module VerifyExamples.Storage.Insert0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage exposing (..)
import Storage.Value as Value exposing (..)
import Test


spec0 : Test.Test
spec0 =
    Test.test "#insert: \n\n    empty\n        |> insert \"fruit\" (Value.string \"apple\")\n        |> insert \"fruit\" (Value.string \"banana\")\n    --> fromList [ ( \"fruit\", Value.string \"banana\" ) ]" <|
        \() ->
            Expect.equal
                (Storage.empty
                    |> insert "fruit" (Value.string "apple")
                    |> insert "fruit" (Value.string "banana")
                )
                (fromList [ ( "fruit", Value.string "banana" ) ])
