module VerifyExamples.Storage.IsEmpty0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage exposing (..)
import Storage.Value as Value exposing (..)
import Test


spec0 : Test.Test
spec0 =
    Test.test "#isEmpty: \n\n    empty\n        |> insert \"fruit\" (Value.string \"apple\")\n        |> remove \"fruit\"\n        |> isEmpty\n    --> True" <|
        \() ->
            Expect.equal
                (Storage.empty
                    |> insert "fruit" (Value.string "apple")
                    |> remove "fruit"
                    |> isEmpty
                )
                True
