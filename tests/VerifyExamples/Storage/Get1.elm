module VerifyExamples.Storage.Get1 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage exposing (..)
import Storage.Value as Value exposing (..)
import Test


spec1 : Test.Test
spec1 =
    Test.test "#get: \n\n    empty\n        |> insert \"fruit\" (Value.string \"apple\")\n        |> get \"fruit\"\n    --> Just (Value.string \"apple\")" <|
        \() ->
            Expect.equal
                (Storage.empty
                    |> insert "fruit" (Value.string "apple")
                    |> get "fruit"
                )
                (Just (Value.string "apple"))